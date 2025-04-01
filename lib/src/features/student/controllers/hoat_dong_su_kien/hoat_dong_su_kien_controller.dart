import 'dart:io';

import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/repository/activities_repository/activities_repository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../constants/cloud_params.dart';
import '../../../../constants/text_strings.dart';
import '../../../../repository/type_of_activity_repository/type_of_activity_repository.dart';
import '../../../../utils/helper_controller/helper_controller.dart';
import '../../models/activities/activities_event.dart';
import '../../models/activities/activities_model.dart';
import '../../models/student/student_model.dart';
import '../../models/type_of_activity/type_of_activity_model.dart';
import 'package:http/http.dart' as http;

class HoatDongSuKienController extends GetxController {
  static HoatDongSuKienController get instance => Get.find();

  final _activitiesRepo = Get.put(ActivitiesRepository());
  var selectedDay = DateTime.now().obs;
  late ActivitiesModel activities;
  late TypeOfActivityModel typeOfActivity;
  late int eventIndex;
  Rx<int> imageListLength = 0.obs;
  final RxList<String> images = <String>[].obs; // Danh sách ảnh reactive
  late StudentModel student;

  @override
  Future<void> onInit() async {
    super.onInit();
    //final activities = await _activitiesRepo.getActivitiesById();
    selectedDay.value = DateTime.now();
    //final day = Helper.formatDateToString(selectedDay.value);
  }

  // Lấy danh sách sự kiện cho ngày cụ thể
  Future<List<ActivityEvent>> fetchEventsForDay(DateTime date) async {
    selectedDay.value = date;
    final studentRepo = Get.put(StudentRepository());
    student = (await studentRepo.getStudentById())!;
    final classID = student.studentProfile.studentClass;
    activities = (await _activitiesRepo.getActivitiesByClassId(classID))!;
    final day = Helper.formatDateToString(selectedDay.value);
    if (activities.dates[day]!=null){
      return activities.dates[day]!.events;
    }
    else{
      return [];
    }
  }

  Future<TypeOfActivityModel?> getTypeOfActivity(ActivityEvent activityEvent) async {
    final typeOfActivityRepo = Get.put(TypeOfActivityRepository());
    return await typeOfActivityRepo.getTypeOfActivityById(activityEvent.typeOfActivity);
  }

  // Hàm tạo URL từ public ID của Cloudinary
  String buildCloudinaryUrl(String publicId) {
    return 'https://res.cloudinary.com/$tCloudName/image/upload/$publicId.$defaultFormat';
  }

  // Hàm tải ảnh từ Cloudinary
  Future<void> downloadImage(String publicId) async {
    try {
      final imageUrl = buildCloudinaryUrl(publicId); // Tạo URL từ public ID
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.$defaultFormat';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        // Lưu vào thư viện ảnh
        final result = await GallerySaver.saveImage(filePath);
        if (result == true) {
          Helper.successSnackBar(title: tHinhAnh, message: tDaTaiAnhThanhCong);
        } else {
          throw Exception(tLuuAnhThatBai);
        }
      } else {
        throw Exception('$tTaiAnhThatBai ${response.statusCode}');
      }
    } catch (e) {
      Helper.errorSnackBar(title: tHinhAnh, message: '$tLoiKhiTaiAnh $e');
    }
  }
}
