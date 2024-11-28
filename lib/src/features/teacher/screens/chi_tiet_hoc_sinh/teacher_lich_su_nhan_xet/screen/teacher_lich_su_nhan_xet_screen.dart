import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thong_tin_hoc_sinh/teacher_thong_tin_hoc_sinh_controller.dart';

class TeacherLichSuNhanXetScreen extends StatelessWidget {
  final String studentName; // Tên học sinh
  final String imageUrl; // Đường dẫn ảnh của học sinh

  const TeacherLichSuNhanXetScreen({
    Key? key,
    required this.studentName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TeacherThongTinHocSinhController controller =
    Get.put(TeacherThongTinHocSinhController());

    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader2(title: tLichSuNhanXet),
      body: Column(
        children: [
          // Avatar và tên học sinh
          _buildStudentProfile(imageUrl, studentName),
          const SizedBox(height: 16), // Khoảng cách dưới ảnh

          // Nội dung lịch sử nhận xét
          Expanded(
            child: Center(
              child: Text(
                "Nội dung lịch sử nhận xét sẽ hiển thị ở đây.",
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ),
          ),

          // Nút quay lại
          BackButtonFooterWidget(),
        ],
      ),
    );
  }

  // Hàm xây dựng phần avatar và tên học sinh
  Widget _buildStudentProfile(String imageUrl, String studentName) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Avatar hình tròn
          CircleAvatar(
            radius: 60, // Kích thước avatar
            backgroundImage: imageUrl.startsWith('http')
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
          ),
          const SizedBox(height: 12), // Khoảng cách giữa avatar và tên

          // Tên học sinh
          Text(
            studentName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333), // Màu chữ
            ),
          ),
        ],
      ),
    );
  }
}

// Widget để hiển thị nút quay lại
class BackButtonFooterWidget extends StatelessWidget {
  const BackButtonFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ElevatedButton(
        onPressed: () {
          // Quay lại trang trước
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF380543), // Màu nền nút
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0), // Bo góc nút
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
        child: const Text(
          "Quay lại",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Màu chữ
          ),
        ),
      ),
    );
  }
}