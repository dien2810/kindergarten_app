import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/teacher_navigation_menu_controller.dart';

import '../../../../constants/colors.dart';

class TeacherBottomNavigationBarWidget extends StatelessWidget {
  const TeacherBottomNavigationBarWidget({
    super.key,
    required this.controller,
  });

  final TeacherNavigationMenuController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          backgroundColor: Colors.white,
          indicatorColor: Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: tDarkPurple,
                  size: 35.0,
                ),
                label: "Trang chủ"),
            NavigationDestination(
                icon: Icon(Icons.calendar_today_outlined,
                    color: tDarkPurple, size: 30.0),
                label: "Học đường"),
            NavigationDestination(
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: tDarkPurple,
                  size: 30.0,
                ),
                label: "Chat"),
            NavigationDestination(
                icon: Icon(
                  Icons.notifications_none,
                  color: tDarkPurple,
                  size: 35.0,
                ),
                label: "Thông báo"),
            NavigationDestination(
                icon: Icon(
                  Icons.person_outline_rounded,
                  color: tDarkPurple,
                  size: 35.0,
                ),
                label: "Tài khoản"),
          ],
        ));
  }
}
