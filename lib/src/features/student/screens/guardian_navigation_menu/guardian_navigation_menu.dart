import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/colors.dart';

import '../../controllers/guardian_navigation_menu_controller.dart';

class GuardianNavigationMenu extends StatelessWidget {
  const GuardianNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GuardianNavigationMenuController());
    return Scaffold(
      bottomNavigationBar: Obx(
          ()=>NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index)=>controller.selectedIndex.value=index,
            backgroundColor: Colors.white,
            indicatorColor: Colors.black.withOpacity(0.1),
            destinations: const[
              NavigationDestination(icon: Icon(
                Icons.home_outlined,
                color: tDarkBlue,
                size: 35.0,
              ),
                  label: "Trang chủ"),
              NavigationDestination(icon: Icon(
                Icons.calendar_today_outlined,
                color: tDarkBlue,
                size: 30.0
              ),
                  label: "Học sinh"),
              NavigationDestination(icon: Icon(
                Icons.chat_bubble_outline,
                color: tDarkBlue,
                size: 30.0,
              ),
                  label: "Chat"),
              NavigationDestination(icon: Icon(
                Icons.notifications_none,
                color: tDarkBlue,
                size: 35.0,
              ),
                  label: "Thông báo"),
              NavigationDestination(icon: Icon(
                Icons.person_outline_rounded,
                color: tDarkBlue,
                size: 35.0,
              ),
                  label: "Tài khoản"),
            ],
          )
      ),
      body: Obx(()=>controller.screens[controller.selectedIndex.value])
    );
  }
}
