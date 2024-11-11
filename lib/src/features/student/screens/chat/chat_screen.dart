import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/guardian_navigation_menu_controller.dart';
import '../guardian_navigation_menu/bottom_navigation_bar_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
      body: Container(color: Colors.purple),
    );
  }
}
