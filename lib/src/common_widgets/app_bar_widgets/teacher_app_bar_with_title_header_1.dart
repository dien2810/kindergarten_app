import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/image_strings.dart';

class TeacherAppBarWithTitleHeader1 extends StatelessWidget implements PreferredSizeWidget {
  const TeacherAppBarWithTitleHeader1({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(tTeacherAppBarImageHeader1),
            fit: BoxFit.cover,
          ),
        ),
      ),
      backgroundColor: Colors.transparent, // Đặt màu nền trong suốt

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(200.0);
}