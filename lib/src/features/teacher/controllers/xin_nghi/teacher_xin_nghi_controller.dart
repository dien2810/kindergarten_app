import 'package:get/get.dart';

class TeacherXinNghiController extends GetxController {
  var selectedDay = DateTime.now().obs; // Ngày được chọn
  var dayOffData = <String, dynamic>{}; // Dữ liệu xin nghỉ
  var dailyRoutine = <String, dynamic>{}; // Dữ liệu chế độ sinh hoạt
  @override
  void onInit() {
    super.onInit();

  }


  // Hàm lấy thông tin xin nghỉ cho ngày đã chọn
  List<Map<String, dynamic>> fetchEventsForDay(DateTime day) {
    String formattedDate = "${day.day}-${day.month}-${day.year}";
    List<Map<String, dynamic>> events = [];

    dayOffData.forEach((studentId, data) {
      var dates = data['dates'];
      if (dates.containsKey(formattedDate)) {
        events.add({
          'studentId': studentId,
          'date': formattedDate,
          'details': dates[formattedDate],
        });
      }
    });

    return events;
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
  void updateStatus(String studentId, String date, String newStatus) {
    if (dayOffData[studentId]['dates'][date] != null) {
      dayOffData[studentId]['dates'][date]['status'] = newStatus;
      update(); // Cập nhật UI
    }
  }

}