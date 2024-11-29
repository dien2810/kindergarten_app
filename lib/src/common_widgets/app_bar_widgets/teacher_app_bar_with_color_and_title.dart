import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherAppBarWithColorAndTitle extends StatelessWidget implements PreferredSizeWidget {
  final String hexColor; // Màu nền dưới dạng chuỗi hex
  final String title; // Tiêu đề

  const TeacherAppBarWithColorAndTitle({
    Key? key,
    required this.hexColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.0, // Chiều cao của thanh công cụ
      leading: IconButton(
        padding: const EdgeInsets.only(top: 20), // Khoảng cách icon
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Get.back(); // Điều hướng quay lại
        },
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 20), // Điều chỉnh khoảng cách tiêu đề
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 30,
              fontFamily: 'Inter', // Font chữ
            ),
          ),
        ),
      ),
      flexibleSpace: Container(
        height: 140, // Chiều cao của header
        width: double.infinity, // Chiều rộng toàn màn hình
        decoration: BoxDecoration(
          color: _hexToColor(hexColor), // Áp dụng màu từ hexColor
        ),
      ),
      backgroundColor: Colors.transparent, // Đặt nền trong suốt
      elevation: 0, // Loại bỏ bóng
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130.0); // Chiều cao tổng thể

  // Hàm chuyển đổi chuỗi hex thành màu
  Color _hexToColor(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff'); // Alpha mặc định nếu không có
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
