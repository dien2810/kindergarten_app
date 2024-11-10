import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/features/student/screens/hoat_dong_su_kien/widget/chi_tiet_su_kien_widget.dart';

class SuKienWidget extends StatelessWidget {
  final List<Map<String, String>> events = [
    {"time": "6:30 - 7:30", "event": "Đón trẻ - điểm danh tại lớp"},
    {"time": "7:30 - 7:40", "event": "Tập thể dục buổi sáng"},
    {"time": "7:40 - 8:30", "event": "Ăn sáng"},
    {"time": "8:30 - 9:30", "event": "Học tập"},
    {"time": "9:30 - 10:30", "event": "Hoạt động tự do/ Giờ chơi tự do"},
    {"time": "10:30 - 11:30", "event": "Ăn trưa"},
    {"time": "11:30 - 13:30", "event": "Ngủ trưa"},
    {"time": "13:30 - 14:30", "event": "Hoạt động tự do/ Giờ chơi tự do"},
    {"time": "14:30 - 16:00", "event": "Học tập/ Rèn luyện kỹ năng"},
    {"time": "16:00 - 17:00", "event": "Điểm danh/ Trả bé cho phụ huynh"},
  ];

  SuKienWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chế độ sinh hoạt năm học 2024-2025 lớp Pooh 01'),
        backgroundColor: const Color(0xFFD74971),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    DataCell(Text(event['time']!)),
                    DataCell(
                      Text(event['event']!),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ChiTietSuKienWidget(
                              title: event['event']!,
                              time: event['time']!,
                              description: 'Chi tiết về sự kiện: ${event['event']}',
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              }).toList(),
              headingRowColor: MaterialStateColor.resolveWith((states) => Color(0xFFD74971)),
              dataRowColor: MaterialStateColor.resolveWith((states) => Color(0xFFF6E8E8)),
              dataRowHeight: 60,
              headingRowHeight: 70,
            ),
          ),
        ),
      ),
    );
  }
}
