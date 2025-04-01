import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kindergarten_app/src/features/student/models/activities/activities_model.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/giang_day/teacher_giang_day_controller.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../flutter_flow/flutter_flow_util.dart';
import '../../../../constants/cloud_params.dart';
import '../../../../constants/text_strings.dart';
import '../../../../repository/activities_repository/activities_repository.dart';
import '../../../../repository/type_of_activity_repository/type_of_activity_repository.dart';
import '../../../../utils/helper_controller/helper_controller.dart';
import '../../../student/models/activities/activities_event.dart';
import '../../../student/models/type_of_activity/type_of_activity_model.dart';
import 'package:http/http.dart' as http;

class TeacherHoatDongSuKienController extends GetxController{
  static TeacherHoatDongSuKienController get instance => Get.find();

  final _activitiesRepo = Get.put(ActivitiesRepository());
  var selectedDay = DateTime.now().obs;
  late ActivitiesModel activities;
  late TypeOfActivityModel typeOfActivity;
  late int eventIndex;
  Rx<int> imageListLength = 0.obs;
  final RxList<String> images = <String>[].obs; // Danh sách ảnh reactive

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
    final giangDayController = Get.put(TeacherGiangDayController());
    final classID = giangDayController.classModel?.id;
    activities = (await _activitiesRepo.getActivitiesByClassId(classID!))!;
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

  Future<void> updateNewImage(String newImageId)async {
    final activityRepo = Get.put(ActivitiesRepository());
    final dateString = DateFormat('dd-MM-yyyy').format(selectedDay.value);
    activities.dates[dateString]?.events[eventIndex].image.add(newImageId);
    await activityRepo.updateActivities(activities);
    await fetchEventsForDay(selectedDay.value);
    imageListLength.value = activities.dates[dateString]!.events[eventIndex].image.length;
    images.value = activities.dates[dateString]!.events[eventIndex].image;
  }

  Future<void> updateNewVideo(String newImageId)async {
    final activityRepo = Get.put(ActivitiesRepository());
    final dateString = DateFormat('dd-MM-yyyy').format(selectedDay.value);
    activities.dates[dateString]?.events[eventIndex].videoLive = newImageId;
    await activityRepo.updateActivities(activities);
    await fetchEventsForDay(selectedDay.value);
    imageListLength.value = activities.dates[dateString]!.events[eventIndex].image.length;
    images.value = activities.dates[dateString]!.events[eventIndex].image;
  }

  // Hàm chọn và upload ảnh (giữ nguyên)
  Future<void> uploadImage(String screenType) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        String newImageId = await Helper.uploadImage(pickedFile);
        if (screenType == tActivity){
          await updateNewImage(newImageId);
        }
        Helper.successSnackBar(title: tHinhAnh, message: tDaUploadAnhThanhCong);
      } catch (e) {
        Helper.errorSnackBar(title: tHinhAnh, message: '$tLoiKhiUploadAnh $e');
      }
    }
  }

  Future<void> uploadVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      try {
        String newImageId = await Helper.uploadImage(pickedFile);
        await updateNewVideo(newImageId);
        Helper.successSnackBar(title: tUploadThanhCong, message: tDaUploadVideoThanhCong);
        Get.back();
      } catch (e) {
        Helper.errorSnackBar(title: tUploadThatBai, message: '$tLoiKhiUploadVideo $e');
      }
    }
  }

  // Hàm xóa ảnh
  Future<void> deleteImage(int index) async {
    try {
      // Hiển thị dialog xác nhận trước khi xóa
      bool? confirm = await Get.dialog<bool>(
        AlertDialog(
          title: const Text(tXacNhanXoa),
          content: const Text(tBanCoChacMuonXoaAnhKhong),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: false),
              child: const Text(tHuy),
            ),
            TextButton(
              onPressed: () => Get.back(result: true),
              child: const Text(tXoa),
            ),
          ],
        ),
      );

      if (confirm != true) return;
      final activityRepo = Get.put(ActivitiesRepository());
      final dateString = DateFormat('dd-MM-yyyy').format(selectedDay.value);
      activities.dates[dateString]?.events[eventIndex].image.removeAt(index);
      await activityRepo.updateActivities(activities);
      await fetchEventsForDay(selectedDay.value);
      imageListLength.value = activities.dates[dateString]!.events[eventIndex].image.length;
      // Xóa ảnh khỏi danh sách (nếu danh sách có thể thay đổi)
      Helper.successSnackBar(title: tXacNhanXoa, message: tDaXoaAnhThanhCong);
      images.value = activities.dates[dateString]!.events[eventIndex].image;
    } catch (e) {
      Helper.errorSnackBar(title: tHinhAnh, message: '$tLoiKhiXoaAnh $e');
    }
  }
}