import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/models/absent/absent_date_entry.dart';
import 'package:kindergarten_app/src/features/student/models/absent/absent_model.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/giang_day/teacher_giang_day_controller.dart';
import 'package:kindergarten_app/src/repository/absent_repository/absent_repository.dart';
import 'package:kindergarten_app/src/repository/student_repository/student_repository.dart';

import '../../../../utils/helper_controller/helper_controller.dart';

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
  var attendanceRecords = <String, dynamic>{}; // Dữ liệu điểm danh
  late List<String> studentIds;
  Map<String, AbsentModel> absentList = {};
  final _giangDayController = Get.put(TeacherGiangDayController());
  final _absentRepo = Get.put(AbsentRepository());
  final _studentRepo = Get.put(StudentRepository());

  void loadAbsent() {
    super.onInit();
    getAbsentData();
  }
  
  Future<void> getAbsentData() async {

    studentIds = _giangDayController.classModel!.students;

    for (var studentId in studentIds) {
      var absent = await _absentRepo.getAbsentByStudentId(studentId);
      if (absent != null){
        absentList[studentId] = absent;
      }
    }
  }

  Future<List<Map<String, dynamic>>> fetchAttendance(DateTime date) async {
    List<Map<String, dynamic>> result = [];
    final dateString = Helper.formatDateToString(date);
    for(var studentId in studentIds){
      final student = await _studentRepo.getStudentByStudentId(studentId);
      attendanceRecords[studentId] = {
        'studentId': studentId,
        'studentName': student!.studentProfile.name,
        'semesterID': absentList[studentId]?.semesterID??'',
        'amountOfDayOff': absentList[studentId]?.amountOfDayOff??0,
        'absentData': absentList[studentId]?.dates[dateString]??AbsentDateEntry(
          day: dateString,
          absentStatus: tVangKhongPhep,
          absentTime: '',
          checkinImage: '',
          checkinTime: 'N/A',
          checkoutImage: '',
          checkoutTime: 'N/A',
          period: [],
          reason: ''
        ),
      };
    }
    int count = 0;
    attendanceRecords.forEach((studentId, record) {
      print(studentId);
      // print(record);
      count++;
      print(record['absentData']);
      AbsentDateEntry details = record['absentData']!;
      result.add({
        'studentId': studentId,
        'name': 'Học sinh ${record['studentName']}',
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
    });
    print(result);
    return result;
  }

  Future<void> updateAttendance() async {
    final absentRepo = Get.put(AbsentRepository());
    final selectedDate = Helper.formatDateToString(selectedDay.value);

    for (var studentId in attendanceRecords.keys) {
      final record = attendanceRecords[studentId];
      if (record != null) {
        AbsentDateEntry details = record['absentData']!;
        final updatedAbsentData = {
          'amountOfDayOff': record['amountOfDayOff'],
          'dates.$selectedDate': {
            'period': details.period,
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
    Helper.successSnackBar(title: tThongBao, message: tDaCapNhatTrangThaiDiemDanh);
  }
}