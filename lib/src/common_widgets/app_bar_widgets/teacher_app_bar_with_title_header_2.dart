import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/image_strings.dart';

class TeacherAppBarWithTitleHeader2 extends StatelessWidget implements PreferredSizeWidget {
  const TeacherAppBarWithTitleHeader2({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.0,
      leading: IconButton(
        padding: const EdgeInsets.only(top: 20),
        icon: const Icon(
          Icons.arrow_back,
          color: tWhiteColor,
          size: 30,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 20), // Thay đổi giá trị này để điều chỉnh khoảng cách
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: tWhiteColor,
              fontWeight: FontWeight.w500,
              fontSize: 30,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ),
      flexibleSpace: Container(
        height: 140, // Đặt chiều cao phù hợp
        width: double.infinity, // Chiều rộng đầy đủ
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(tTeacherAppBarImageHeader2),
            fit: BoxFit.fill, // Sử dụng BoxFit.contain
          ),
        ),
      ),
      backgroundColor: Colors.transparent, // Đặt màu nền trong suốt
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(130.0);
}