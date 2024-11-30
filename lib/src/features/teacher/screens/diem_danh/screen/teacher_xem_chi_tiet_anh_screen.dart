import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/diem_danh/screen/teacher_diem_danh_screen.dart';
import 'dart:io';

import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_color_and_title.dart';
import '../../../controllers/teacher_navigation_menu_controller.dart';

class TeacherXemChiTietAnhScreen extends StatelessWidget {
  final File? image; // Ảnh được truyền vào
  final String title; // Tiêu đề để hiển thị

  const TeacherXemChiTietAnhScreen({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TeacherAppBarWithColorAndTitle(title: title, hexColor: "#7209B7"),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _buildImageView(),
            ),
          ),
          // Nút Quay lại
          // Nút Quay lại
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Padding thêm cho nút
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7209B7), // Màu tím trùng với màu header
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Bo góc
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60,), // Kích thước nút
              ),
              onPressed: () {
               Get.back();
              },
              child: const Text(
                "Quay lại trang trước",
                style: TextStyle(fontSize: 22, color: Colors.white), // Kích thước và màu chữ
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildImageView() {
    if (image == null || (image?.path.isEmpty ?? true)) {
      // Trường hợp ảnh chưa được thêm
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info, color: Colors.blue, size: 50), // Biểu tượng thông tin
          SizedBox(height: 16),
          Text("Ảnh chưa được thêm.", style: TextStyle(fontSize: 18)),
        ],
      );
    } else if (image!.existsSync()) {
      // Trường hợp ảnh tồn tại
      return Image.file(image!); // Hiển thị ảnh
    } else {
      // Trường hợp ảnh không tồn tại
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 50), // Biểu tượng lỗi
          SizedBox(height: 16),
          Text("Ảnh không hoạt động hoặc không tồn tại.", style: TextStyle(fontSize: 18)),
        ],
      );
    }
  }
}