import 'package:get/get.dart';
import 'package:kindergarten_app/src/repository/absent_repository/absent_repository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';


class AttendanceRecord {
  final String studentId;
  final String semesterID;
  final int amountOfDayOff;
  final Map<String, AttendanceDetail> dates;
  final String studentName;

  AttendanceRecord({
    required this.studentId,
    required this.semesterID,
    required this.amountOfDayOff,
    required this.dates,
    required this.studentName,
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

  factory AttendanceDetail.fromMap(Map<String, dynamic> map) {
    // Danh sách trạng thái hợp lệ
    final List<String> statuses = ['vắng không phép', 'vắng có phép', 'đúng giờ', 'đến muộn'];

    // Kiểm tra và gán giá trị hợp lệ cho absentStatus
    String absentStatus = map['absentStatus'] ?? '';
    if (!statuses.contains(absentStatus)) {
      absentStatus = statuses[0]; // Gán giá trị mặc định nếu không hợp lệ
    }

    return AttendanceDetail(
      period: List<String>.from(map['period'] ?? []), // Giữ lại period từ dữ liệu
      absentTime: map['absentTime'] ?? '', // Lấy absentTime từ dữ liệu
      absentStatus: absentStatus, // Sử dụng giá trị đã kiểm tra
      checkinTime: map['checkinTime'] ?? '',
      checkoutTime: map['checkoutTime'] ?? '',
      checkinImage: map['checkinImage'] ?? '',
      checkoutImage: map['checkoutImage'] ?? '',
      reason: map['reason'] ?? '', // Giữ lại reason từ dữ liệu
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'absentStatus': absentStatus,
      'checkinTime': checkinTime,
      'checkoutTime': checkoutTime,
      'checkinImage': checkinImage,
      'checkoutImage': checkoutImage,
      // Không bao gồm period và reason trong Map khi cập nhật
    };
  }
}
class TeacherDiemDanhController extends GetxController {
  var selectedDay = DateTime.now().obs; // Ngày được chọn
  var attendanceRecords = <String, AttendanceRecord>{}.obs; // Dữ liệu điểm danh
  late List<dynamic> studentIds;

  void loadAbsent() {
    super.onInit();
    getAbsentData();
  }

  Future<void> getAbsentData() async {
    final absentRepo = Get.put(AbsentRepository());
    final studentRepo = Get.put(StudentRepository());
    for (var studentId in studentIds){
      final absent = await absentRepo.getAbsentByStudentId(studentId);
      final student = await studentRepo.getStudentByStudentId(studentId);
      attendanceRecords[studentId] = AttendanceRecord(
        studentId: studentId,
        studentName: student!.studentProfile.name,
        semesterID: absent!.semesterID,
        amountOfDayOff: absent.amountOfDayOff,
        dates: (absent.dates).map(
              (date, details) {
            return MapEntry(
              date,
              AttendanceDetail(
                period: List<String>.from(details.period ?? [""]),
                absentTime: details.absentTime,
                absentStatus: details.absentStatus,
                checkinImage: details.checkinImage,
                checkoutImage: details.checkoutImage,
                checkinTime: details.checkinTime,
                checkoutTime: details.checkoutTime,
                reason: details.reason,
              ),
            );
          },
        ),
      );
    }
  }

  List<Map<String, dynamic>> fetchAttendanceForDay(DateTime selectedDay) {
    List<Map<String, dynamic>> result = [];
    attendanceRecords.forEach((studentId, record) {
      if (record.dates.containsKey(formatDate(selectedDay))) {
        AttendanceDetail details = record.dates[formatDate(selectedDay)]!;
        result.add({
          'studentId': studentId,
          'name': 'Học sinh ${record.studentName}',
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

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }


  Future<void> updateAttendance() async {
    final absentRepo = Get.put(AbsentRepository());
    final selectedDate = formatDate(selectedDay.value);

    for (var studentId in attendanceRecords.keys) {
      final record = attendanceRecords[studentId];
      if (record != null && record.dates.containsKey(selectedDate)) {
        final details = record.dates[selectedDate];
        final updatedAbsentData = {
          'semesterID': record.semesterID,
          'amountOfDayOff': record.amountOfDayOff,
          'dates.$selectedDate': {
            'period': details!.period,
            'absentTime': details.absentTime,
            'absentStatus': details.absentStatus,
            'checkinImage': details.checkinImage,
            'checkoutImage': details.checkoutImage,
            'checkinTime': details.checkinTime,
            'checkoutTime': details.checkoutTime,
            'reason': details.reason,
          }
        };

        await absentRepo.updateAbsentByStudentId(studentId, updatedAbsentData);
      }
    }
    Get.snackbar('Thông báo', 'Đã cập nhật trạng thái xin nghỉ thành công.');
  }
}