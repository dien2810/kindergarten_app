import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/student/screens/hoat_dong_su_kien/widget/chi_tiet_su_kien_widget.dart';

class SuKienWidget extends StatelessWidget {
  final Map<String, Map<String, dynamic>> dailyRoutine = {
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

  SuKienWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Chuyển đổi thông tin routine thành danh sách
    List<Map<String, dynamic>> events = dailyRoutine["daily_id_1"]!["routine"]
        .entries
        .map((entry) {
      var routine = entry.value as Map<String, dynamic>;
      return {
        "startTime": routine["startTime"],
        "endTime": routine["endTime"],
        "eventName": routine["eventName"],
        "details": routine
      };
    })
        .toList()
        .cast<Map<String, dynamic>>(); // Explicitly cast to List<Map<String, dynamic>>

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chế độ sinh hoạt năm học 2024-2025 lớp Pooh 01'),
        backgroundColor: const Color(0xFFD74971),
      ),
      body: Padding(
        padding: EdgeInsets.all(t10Size+t3Size*2),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6E8E8),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('THỜI GIAN', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('SỰ KIỆN', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: events.map((event) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        '${event['startTime']} - ${event['endTime']}',
                        style: const TextStyle(
                          color: Color(0xFFD74971),
                          fontWeight: FontWeight.bold, // Tô đậm chữ
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        event['eventName'],
                        style: const TextStyle(
                          color: Color(0xFF7B7B7B),
                          fontWeight: FontWeight.bold, // Tô đậm chữ
                        ),
                      ),
                      onTap: () {
                        var details = event['details'] as Map<String, dynamic>;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ChiTietSuKienWidget(
                              title: details["eventName"],
                              time: '${details["startTime"]} - ${details["endTime"]}',
                              note: details["note"] ?? 'Không có thông tin', // Giá trị mặc định
                              location: details["location"] ?? 'Không có thông tin',
                              duration: details["duration"] ?? 'Không có thông tin',
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              }).toList(),
              headingRowColor: WidgetStateColor.resolveWith((states) => const Color(0xFFD74971)),
              dataRowColor: WidgetStateColor.resolveWith((states) => const Color(0xFFF6E8E8)),
              dataRowHeight: 60,
              headingRowHeight: 70,
            ),
          ),
        ),
      ),
    );
  }
}