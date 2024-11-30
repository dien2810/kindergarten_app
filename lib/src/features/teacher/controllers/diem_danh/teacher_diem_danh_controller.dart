import 'package:get/get.dart';

class AttendanceRecord {
  final String studentId;
  final String semesterID;
  final int amountOfDayOff;
  final Map<String, AttendanceDetail> dates;

  AttendanceRecord({
    required this.studentId,
    required this.semesterID,
    required this.amountOfDayOff,
    required this.dates,
  });
}

class AttendanceDetail {
  final List<String> period;
  final String absentTime;
  final String absentStatus;
  final String checkinImage;
  final String checkoutImage;
  final String checkinTime;
  final String checkoutTime;
  final String reason;

  AttendanceDetail({
    required this.period,
    required this.absentTime,
    required this.absentStatus,
    required this.checkinImage,
    required this.checkoutImage,
    required this.checkinTime,
    required this.checkoutTime,
    required this.reason,
  });
}

class TeacherDiemDanhController extends GetxController {
  var selectedDay = DateTime.now().obs; // Ngày được chọn
  var attendanceRecords = <String, AttendanceRecord>{}.obs; // Dữ liệu điểm danh

  @override
  void onInit() {
    super.onInit();
    fetchAttendanceData(); // Gọi hàm để tải dữ liệu điểm danh
  }

  // Hàm để tải dữ liệu điểm danh
  void fetchAttendanceData() {
    // Dữ liệu mẫu từ bảng absent
    var sampleData = {
      "student_id_1": {
        "semesterID": "semester_id_1",
        "amountOfDayOff": 3,
        "dates": {
          "30/11/2024": {
            "period": [
              "routine_id_1",
              "routine_id_2",
              "routine_id_3",
              "routine_id_4",
              "routine_id_5",
              "routine_id_6"
            ],
            "absentTime": "1 ngày",
            "absentStatus": "vắng có phép",
            "checkinImage": "",
            "checkoutImage": "linkanhcheckout",
            "checkinTime": "7:00",
            "checkoutTime": "7:30",
            "reason": "Bị ốm"
          },
          // Thêm các ngày khác
        }
      },
      "student_id_2": {
        "semesterID": "semester_id_1",
        "amountOfDayOff": 1,
        "dates": {
          "30/11/2024": {
            "period": ["routine_id_4"],
            "absentTime": "1 ngày",
            "absentStatus": "vắng không phép",
            "checkinImage": "linkanhcheckin",
            "checkoutImage": "",
            "checkinTime": "7:00",
            "checkoutTime": "17:30",
            "reason": "Bị ốm"
          },
          "29/11/2024": {
            "period": ["routine_id_4"],
            "absentTime": "1 ngày",
            "absentStatus": "vắng không phép",
            "checkinImage": "linkanhcheckin",
            "checkoutImage": "linkanhcheckout",
            "checkinTime": "7:00",
            "checkoutTime": "7:30",
            "reason": "Bị ốm"
          },
          // Thêm các ngày khác
        }
      }
    };

    // Chuyển đổi dữ liệu mẫu thành AttendanceRecord
    sampleData.forEach((studentId, data) {
      attendanceRecords[studentId] = AttendanceRecord(
        studentId: studentId,
        semesterID: data['semesterID'] as String, // Ép kiểu String
        amountOfDayOff: data['amountOfDayOff'] as int, // Ép kiểu int
        dates: (data['dates'] as Map<String, dynamic>).map(
              (date, details) {
            return MapEntry(
              date,
              AttendanceDetail(
                period: List<String>.from(details['period'] ?? []),
                absentTime: details['absentTime'] as String, // Ép kiểu String
                absentStatus: details['absentStatus'] as String, // Ép kiểu String
                checkinImage: details['checkinImage'] as String, // Ép kiểu String
                checkoutImage: details['checkoutImage'] as String, // Ép kiểu String
                checkinTime: details['checkinTime'] as String, // Ép kiểu String
                checkoutTime: details['checkoutTime'] as String, // Ép kiểu String
                reason: details['reason'] as String, // Ép kiểu String
              ),
            );
          },
        ),
      );
    });
  }

  // Hàm để lấy dữ liệu điểm danh cho ngày đã chọn
  List<Map<String, dynamic>> fetchAttendanceForDay(DateTime selectedDay) {
    List<Map<String, dynamic>> result = [];
    attendanceRecords.forEach((studentId, record) {
      // Kiểm tra xem học sinh có dữ liệu điểm danh cho ngày đó không
      if (record.dates.containsKey(formatDate(selectedDay))) {
        AttendanceDetail details = record.dates[formatDate(selectedDay)]!; // Lấy AttendanceDetail
        result.add({
          'studentId': studentId,
          'name': 'Học sinh $studentId', // Thay thế bằng tên thực tế
          'attendanceDetails': {
            'period': details.period,
            'absentTime': details.absentTime,
            'absentStatus': details.absentStatus,
            'checkinImage': details.checkinImage,
            'checkoutImage': details.checkoutImage,
            'checkinTime': details.checkinTime,
            'checkoutTime': details.checkoutTime,
            'reason': details.reason,
          },
        });
      }
    });
    return result;
  }

  // Hàm định dạng ngày
  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}