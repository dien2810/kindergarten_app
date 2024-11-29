import 'package:get/get.dart';

class TeacherXinNghiController extends GetxController {
  var selectedDay = DateTime.now().obs; // Ngày được chọn
  var dayOffData = <String, dynamic>{}; // Dữ liệu xin nghỉ
  var dailyRoutine = <String, dynamic>{}; // Dữ liệu chế độ sinh hoạt
  @override
  void onInit() {
    super.onInit();
    // Khởi tạo dữ liệu xin nghỉ (có thể lấy từ API hoặc nguồn khác)
    dayOffData = {
      "student_id_1": {
        "dates": {
          "29/11/2024": {
            "period": [
              "routine_id_1",
              "routine_id_2",
              "routine_id_3",
              "routine_id_4",
              "routine_id_5",
              "routine_id_6"
            ],
            "content": "Xin nghỉ vì bị bệnh ngày 31/8/2024",
            "status": "Đã duyệt"
          },
          "28/11/2024": {
            "period": [
              "routine_id_1",
              "routine_id_2",
              "routine_id_3",
              "routine_id_4",
              "routine_id_5",
              "routine_id_6"
            ],
            "content": "Xin nghỉ vì phụ huynh đưa bé đi tiêm phòng dại",
            "status": "Chờ duyệt"
          },
          "27/11/2024": {
            "period": ["cả ngày"],
            "content": "Xin nghỉ vì phụ huynh đưa bé về quê ăn đám cưới",
            "status": "Chờ duyệt"
          }
        }
      },
      "student_id_2": {
        "dates": {
          "29/11/2024": {
            "period": ["cả ngày"],
            "content": "Xin nghỉ vì bé bị đau đầu, buồn nôn. Xin nghỉ vì bé bị ho khan, viêm họng cấp",
            "status": "Chờ duyệt"
          }
        }
      },
      "student_id_3": {
        "dates": {
          "29/11/2024": {
            "period": ["cả ngày"],
            "content": "Xin nghỉ vì bé bị ho khan, viêm họng cấp",
            "status": "Chờ duyệt"
          }
        }
      },
    };
    // dữ liệu mã chế độ sinh hoạt làm mốc cho list period
    dailyRoutine = {
      "daily_id_1": {
        "dailyRoutineName": "Chế độ sinh hoạt năm học 2024-2025 lớp Pooh 01",
        "classID": "class_id_1",
        "routine": {
          "routine_id_1": {
            "eventName": "Đón trẻ - điểm danh tại lớp",
            "startTime": "6:30",
            "endTime": "7:30",
            "duration": "60 phút",
            "location": "A201",
            "teacherID": "teacher_id_1",
            "note": "Điểm danh trẻ nhằm kiểm tra số lượng - nề nếp của trẻ đồng thời nhận lời dặn từ phụ huynh đối với trẻ trong một số trường hợp"
          },
          "routine_id_2": {
            "eventName": "Tập thể dục buổi sáng ",
            "startTime": "7:30",
            "endTime": "7:40",
            "duration": "10 phút",
            "location": "Sân trường khu 1",
            "teacherID": "teacher_id_1",
            "note": "Hoạt động tập thể dục buổi sáng bao gồm những bài tập vận động nhẹ giúp trẻ sảng khoái tinh thần cho 1 ngày học tập"
          },
          "routine_id_3": {
            "eventName": "Ăn sáng",
            "startTime": "7:40",
            "endTime": "8:30",
            "duration": "50 - 60 phút",
            "location": "Căn teen trường khu A1",
            "teacherID": "teacher_id_1",
            "note": "Bé có một bữa ăn sáng nhẹ để bắt đầu một ngày học đầy năng lượng ở trường"
          },
          "routine_id_4": {
            "eventName": "Học tập",
            "startTime": "8:30",
            "endTime": "9:30",
            "duration": "50 - 60 phút",
            "location": "A201",
            "teacherID": "teacher_id_1",
            "note": "Bé tham gia lớp học với nhiều hoạt động phong phú nhằm bổ trợ kiến thức cơ bản và cần thiết cho trẻ "
          },
          "routine_id_5": {
            "eventName": "Hoạt động tự do/ Giờ chơi tự do",
            "startTime": "9:30",
            "endTime": "10:30",
            "duration": "50 - 60 phút",
            "location": "A201",
            "teacherID": "teacher_id_1",
            "note": "Bé tham gia lớp học với nhiều hoạt động vui chơi tự do nhằm giúp bé học tập hiệu quả"
          },
          "routine_id_6": {
            "eventName": "Ăn trưa",
            "startTime": "10:30",
            "endTime": "11:30",
            "duration": "50 - 60 phút",
            "location": "Căn teen trường khu A1",
            "teacherID": "teacher_id_1",
            "note": "Với chế độ dinh dưỡng cân bằng và phong phú trong bữa chính giúp trẻ nạp đầy đủ dinh dưỡng và tiếp tục buổi học đầy năng lượng"
          },
          "routine_id_7": {
            "eventName": "Ngủ trưa",
            "startTime": "11:30",
            "endTime": "13:30",
            "duration": "120 phút",
            "location": "PN201",
            "teacherID": "teacher_id_1",
            "note": "Bé cần một thời gian cố định để nghỉ ngơi nhằm đảm bảo không mệt mỏi sau giờ học và vui chơi "
          },
          "routine_id_8": {
            "eventName": "Hoạt động tự do/ Giờ chơi tự do",
            "startTime": "13:30",
            "endTime": "14:30",
            "duration": "50 - 60 phút",
            "location": "A201",
            "teacherID": "teacher_id_1",
            "note": "Bé tham gia hoạt động vui chơi tự do dưới sự giám sát của giáo viên chủ nhiệm trong lớp với đa dạng hoạt động vui chơi"
          },
          "routine_id_9": {
            "eventName": "Ăn xế/ Bữa phụ",
            "startTime": "14:30",
            "endTime": "15:00",
            "duration": "30 phút",
            "location": "Căn teen trường khu A1",
            "teacherID": "teacher_id_1",
            "note": "Bé có 1 bữa phụ trong ngày nhằm đảm bảo chất lượng dinh dưỡng bé cần nạp trong 1 ngày đầy hoạt động bổ ích"
          },
          "routine_id_10": {
            "eventName": "Học tập",
            "startTime": "15:00",
            "endTime": "16:00",
            "duration": "50 - 60 phút",
            "location": "A201",
            "teacherID": "teacher_id_1",
            "note": "Bé tham gia lớp học với nhiều hoạt động phong phú nhằm bổ trợ kiến thức cơ bản và cần thiết cho trẻ "
          },
          "routine_id_11": {
            "eventName": "Điểm danh - trả bé cho phụ huynh ",
            "startTime": "16:00",
            "endTime": "17:00",
            "duration": "50 - 60 phút",
            "location": "A201",
            "teacherID": "teacher_id_1",
            "note": "Giáo viên tiến hành điểm danh cũng như trao đổi với phụ huynh về trẻ trong ngày nếu có trường hợp nhất định xảy ra"
          }
        }
      }
    };
  }


  // Hàm lấy thông tin xin nghỉ cho ngày đã chọn
  List<Map<String, dynamic>> fetchEventsForDay(DateTime day) {
    String formattedDate = "${day.day}/${day.month}/${day.year}";
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