import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/dayoff_model/dayoff_entry_model.dart';
import 'package:kindergarten_app/src/features/student/models/dayoff_model/dayoff_model.dart';
import 'package:kindergarten_app/src/repository/daily_routine_repository/daily_routine_repository.dart';
import 'package:kindergarten_app/src/repository/dayOffRepository/dayoff_repository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';

import '../../../../constants/text_strings.dart';


class TeacherXinNghiController extends GetxController {
  var selectedDay = DateTime.now().obs; // Ngày được chọn
  var dayOffData = <DayoffEntry>[]; // Dữ liệu xin nghỉ
  var dailyRoutine = <String, dynamic>{}; // Dữ liệu chế độ sinh hoạt
  List<String> studentIds = []; // Dữ liệu chế độ sinh hoạt
  //Xin nghi card
  late List<String> routineNames;
  //ChiTietXinNghi
  late DayoffModel dayOff;
  RxString currentStatus = tChoDuyet.obs;

  // Hàm lấy thông tin xin nghỉ cho ngày đã chọn
  Future<List<DayoffEntry>> fetchEventsForDay(DateTime day) async {
    // Chuyển DateTime thành chuỗi ngày/tháng/năm
    String formattedDate = "${day.day}-${day.month}-${day.year}";
    dayOffData = [];
    final dayoffRepo = Get.put(DayoffRepository());
    try {
      // Lặp qua từng studentId để lấy dữ liệu
      for (String studentId in studentIds) {
        final dayoff = await dayoffRepo.getDayOffByStudentId(studentId);
        if (dayoff!.dates.isNotEmpty && dayoff.dates[formattedDate] != null) {
          final dayOffEntry = dayoff.dates[formattedDate];
          dayOffData.add(dayOffEntry!);
        }
      }
    } catch (e) {
      print('Lỗi khi truy vấn dữ liệu: $e');
    }
    return dayOffData;
  }

  // Hàm để lấy tên hoạt động từ period
  List<String> getActivityNamesFromPeriod(List<String> period) {
    List<String> activityNames = [];

    for (String routineId in period) {
      // Kiểm tra routineId có trong dailyRoutine không
      if (dailyRoutine["daily_id_1"]["routine"].containsKey(routineId)) {
        String activityName = dailyRoutine["daily_id_1"]["routine"][routineId]["eventName"];
        activityNames.add(activityName);
      }
    }

    return activityNames;
  }

  Future<String> getXinNghiCard(String studentId, List<String> periods)async {
    final studentRepo = Get.put(StudentRepository());
    final dailyRoutineRepo = Get.put(DailyRoutineRepository());
    final studentName = (await studentRepo.getStudentNameById(studentId))!;
    for (var period in periods){
      final routine = await dailyRoutineRepo.getDailyRoutineById();
      routineNames = routine!.routine.values.map((value)=>value.eventName).toList();
    }
    return studentName;


  }
  Future<void> updateStatus(String studentId, String day, String newStatus) async {
    final dayoffRepo = Get.put(DayoffRepository());
    dayOff = (await dayoffRepo.getDayOffByStudentId(studentId))!;
    dayOff.dates[day]?.status = newStatus;
    print(dayOff.dates[day]?.status);
  }

  Future<void> updateDayoff() async {
    final dayoffRepo = Get.put(DayoffRepository());
    await dayoffRepo.updateDayoff(dayOff);
  }



}