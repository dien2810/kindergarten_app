import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';

import '../../../../../controllers/nhan_xet_hoc_sinh/teacher_nhan_xet_hoc_sinh_controller.dart';

class TeacherClbChiTietNhanXetScreen extends StatelessWidget {
  final String parentName;
  final String date;
  final String comment;
  final String teacherID;
  final String guardianID;
  final String replyContent;
  final String commentDate;
  final String replyDate;

  const TeacherClbChiTietNhanXetScreen({
    super.key,
    required this.parentName,
    required this.date,
    required this.comment,
    required this.teacherID,
    required this.guardianID,
    required this.replyContent,
    required this.commentDate,
    required this.replyDate,
  });

  @override
  Widget build(BuildContext context) {
    final TeacherThongTinNhanxetController controller =
    Get.put(TeacherThongTinNhanxetController());

    // Lấy chiều rộng của màn hình
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader2(title: tChiTietNhanXet),
      body: Column(
        children: [
          // Khung cho nhận xét
          Container(
            width: screenWidth, // Chiều rộng bằng với chiều rộng màn hình
            height: 200, // Chiều cao khung nhận xét
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Giáo viên chủ nhiệm: $teacherID", // Tên giáo viên
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Ngày nhận xét: $date",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  "Nội dung nhận xét: $comment",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 16), // Khoảng cách giữa hai khung
          // Khung cho phản hồi
          Container(
            width: screenWidth, // Chiều rộng bằng với chiều rộng màn hình
            height: 200, // Chiều cao khung phản hồi
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color(0xFFE8F0FE), // Màu nền cho phản hồi
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tên phụ huynh: $parentName",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Ngày phản hồi: $replyDate",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  "Nội dung phản hồi: $replyContent",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          // Nút quay lại
          Spacer(), // Đẩy nút xuống cuối footer
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding xung quanh nút
            child: SizedBox(
              width: double.infinity, // Chiều rộng nút chiếm toàn bộ
              child: ElevatedButton(
                onPressed: () {
                  Get.back(); // Quay lại màn hình trước
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF380543), // Màu nền nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Bo góc 30
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  // Padding bên trong nút
                  child: Text(
                    "Quay lại trang trước",
                    style: TextStyle(
                      color: Colors.white, // Màu chữ trắng
                      fontSize: 22, // Kích thước chữ 22
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}