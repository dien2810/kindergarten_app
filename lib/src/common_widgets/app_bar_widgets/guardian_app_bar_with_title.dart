import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/image_strings.dart';

class GuardianAppBarWithTitleWidget extends StatelessWidget implements PreferredSizeWidget {
  const GuardianAppBarWithTitleWidget({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: tWhiteColor,
          size: 30,
        ),
        onPressed: (){
          Get.back();
        },
      ),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: tWhiteColor,
              fontWeight: FontWeight.w500,
              fontSize: 30,
              fontFamily: 'Inter'
          ),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(tGuardianAppBarImage),
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