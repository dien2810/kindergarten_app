import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/guardian_navigation_menu_controller.dart';
import 'bottom_navigation_bar_widget.dart';

class GuardianNavigationMenu extends StatelessWidget {
  const GuardianNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GuardianNavigationMenuController());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(controller: controller),
      body: Obx(()=>controller.screens[controller.selectedIndex.value])
    );
  }
}


