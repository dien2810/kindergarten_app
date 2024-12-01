import 'package:get/get.dart';

class DayOfWeek {
  String startTime;  // Đổi từ final sang String
  String endTime;    // Đổi từ final sang String

  DayOfWeek({required this.startTime, required this.endTime});
}

class ClubModel {
  final String clubId;
  final String clubName;
  final String semesterID;
  int tuition; // Thay đổi thành int (có thể gán)
  String openingDay;
  int capacity; // Thay đổi thành int (có thể gán)
  String openedRegistration;
  String closedRegistration;
  String room;
  String aboutCourse;
  final String teacherID;
  final Map<String, DayOfWeek> dayOfWeek;

  ClubModel({
    required this.clubId,
    required this.clubName,
    required this.semesterID,
    required this.tuition,
    required this.openingDay,
    required this.capacity,
    required this.openedRegistration,
    required this.closedRegistration,
    required this.room,
    required this.aboutCourse,
    required this.teacherID,
    required this.dayOfWeek,
  });

  // Phương thức copyWith
  ClubModel copyWith({
    String? clubId,
    String? clubName,
    String? semesterID,
    int? tuition,
    String? openingDay,
    int? capacity,
    String? openedRegistration,
    String? closedRegistration,
    String? room,
    String? aboutCourse,
    String? teacherID,
    Map<String, DayOfWeek>? dayOfWeek,
  }) {
    return ClubModel(
      clubId: clubId ?? this.clubId,
      clubName: clubName ?? this.clubName,
      semesterID: semesterID ?? this.semesterID,
      tuition: tuition ?? this.tuition,
      openingDay: openingDay ?? this.openingDay,
      capacity: capacity ?? this.capacity,
      openedRegistration: openedRegistration ?? this.openedRegistration,
      closedRegistration: closedRegistration ?? this.closedRegistration,
      room: room ?? this.room,
      aboutCourse: aboutCourse ?? this.aboutCourse,
      teacherID: teacherID ?? this.teacherID,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    );
  }
}

class TeacherNgoaiKhoaController extends GetxController {
  Map<String, DayOfWeek> dayOfWeekMap = {};
  // Danh sách câu lạc bộ
  final clubs = <ClubModel>[
    ClubModel(
      clubId: "club_id_1",
      clubName: "CLB Bóng đá",
      semesterID: "semester_id_1",
      tuition: 500000,
      openingDay: "05/09/2024",
      capacity: 20,
      openedRegistration: "01/08/2024",
      closedRegistration: "31/08/2024",
      room: "Sân 1",
      aboutCourse: "Luyện đá bóng - phát triển tài năng nhí với hoạt động thể thao năng động, trải nghiệm với cảm giác sân bóng khi còn bé, đảm bảo an toàn trên sân.",
      teacherID: "teacher_id_3",
      dayOfWeek: {
        "Friday": DayOfWeek(startTime: "7:30", endTime: "9:00"),
        "Sunday": DayOfWeek(startTime: "7:30", endTime: "9:00"),
      },
    ),
    ClubModel(
      clubId: "club_id_2",
      clubName: "CLB vẽ tranh",
      semesterID: "semester_id_1",
      tuition: 500000,
      openingDay: "05/09/2024",
      capacity: 20,
      openedRegistration: "01/08/2024",
      closedRegistration: "31/08/2024",
      room: "Sân 1",
      aboutCourse: "Luyện vẽ tranh - phát triển vẽ tranh nhí với hoạt động thể thao năng động, trải nghiệm với cảm giác sân bóng khi còn bé, đảm bảo an toàn trên sân.",
      teacherID: "teacher_id_3",
      dayOfWeek: {
        "Friday": DayOfWeek(startTime: "7:30", endTime: "9:00"),
        "Sunday": DayOfWeek(startTime: "7:30", endTime: "9:00"),
      },
    ),
    // Thêm câu lạc bộ khác nếu cần
  ].obs; // Sử dụng Rx để dễ dàng quản lý trạng thái


  String convertDayToVietnamese(String englishDay) {
    switch (englishDay) {
      case 'Monday':
        return 'Thứ 2';
      case 'Tuesday':
        return 'Thứ 3';
      case 'Wednesday':
        return 'Thứ 4';
      case 'Thursday':
        return 'Thứ 5';
      case 'Friday':
        return 'Thứ 6';
      case 'Saturday':
        return 'Thứ 7';
      case 'Sunday':
        return 'Chủ nhật';
      default:
        return englishDay; // Trả về giá trị gốc nếu không khớp
    }
  }
  String convertVietnameseToDay(String vietnameseDay) {
    switch (vietnameseDay) {
      case 'Thứ 2':
        return 'Monday';
      case 'Thứ 3':
        return 'Tuesday';
      case 'Thứ 4':
        return 'Wednesday';
      case 'Thứ 5':
        return 'Thursday';
      case 'Thứ 6':
        return 'Friday';
      case 'Thứ 7':
        return 'Saturday';
      case 'Chủ nhật':
        return 'Sunday';
      default:
        return vietnameseDay; // Trả về giá trị gốc nếu không khớp
    }
  }

  void addSchedule(String day, DayOfWeek schedule) {
    dayOfWeekMap[day] = schedule; // Cập nhật lịch biểu cho ngày tương ứng
    update(); // Cập nhật trạng thái để thông báo cho UI
  }

}