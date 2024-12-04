import 'package:flutter/material.dart';

class TeacherChiTietSuKienWidget extends StatelessWidget {
  final String title;
  final String time;
  final String note;
  final String location;
  final String duration;

  const TeacherChiTietSuKienWidget({
    super.key,
    required this.title,
    required this.time,
    required this.note,
    required this.location,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // Nền trong suốt
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD74971), // Màu nền cho toàn bộ dialog
          borderRadius: BorderRadius.circular(16.0), // Bo góc cho toàn bộ dialog
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tiêu đề với bo góc
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFD74971), // Màu nền tiêu đề
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)), // Bo góc trên
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0, // Tăng kích thước chữ
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Thời gian', time, const Color(0xFFF6E8E8)),
                  _buildDetailRow('Chi tiết', note, Colors.white),
                  _buildDetailRow('Địa điểm', location, const Color(0xFFF6E8E8)),
                  _buildDetailRow('Thời lượng', duration, Colors.white),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'ĐÓNG',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0, // Tăng kích thước chữ nút
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, Color backgroundColor) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              '$title:',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0, // Tăng kích thước chữ
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0, // Tăng kích thước chữ
              ),
            ),
          ),
        ],
      ),
    );
  }
}