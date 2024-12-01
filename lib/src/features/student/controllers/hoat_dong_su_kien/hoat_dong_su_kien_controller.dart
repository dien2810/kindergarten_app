import 'package:get/get.dart';
import 'package:kindergarten_app/src/repository/activities_repository/activities_repository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';

import '../../../../repository/account_repository/account_repository.dart';
import '../../../../repository/type_of_activity_repository/type_of_activity_repository.dart';
import '../../../../utils/helper_controller/helper_controller.dart';
import '../../models/activities/activities_event.dart';
import '../../models/type_of_activity/type_of_activity_model.dart';

class HoatDongSuKienController extends GetxController {
  static HoatDongSuKienController get instance => Get.find();

  final _accountRepo = Get.put(AccountRepository());
  final _studentRepo = Get.put(StudentRepository());
  final _activitiesRepo = Get.put(ActivitiesRepository());
  var selectedDay = DateTime.now().obs;

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
    final activities = await _activitiesRepo.getActivitiesById();
    final day = Helper.formatDateToString(selectedDay.value);
    if (activities!.dates[day]!=null){
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
}
