import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/teacher_navigation_menu_controller.dart';
import 'teacher_bottom_navigation_bar_widget.dart';

class TeacherNavigationMenu extends StatelessWidget {
  const TeacherNavigationMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeacherNavigationMenuController());
    return Scaffold(
        bottomNavigationBar:
            TeacherBottomNavigationBarWidget(controller: controller),
        body: Obx(() => controller.screens[controller.selectedIndex.value]));
  }
}
