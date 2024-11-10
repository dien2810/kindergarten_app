import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/student_information/widget/student_document_widget.dart';
import 'package:kindergarten_app/src/features/student/screens/student_information/widget/student_info_widget.dart';

import '../../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/guardian_navigation_menu_controller.dart';
import '../../guardian_navigation_menu/bottom_navigation_bar_widget.dart';

class ThongTinHocSinhScreen extends StatelessWidget {
  const ThongTinHocSinhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tThongTinHocSinh),
        bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
        body: const Column(
          children: <Widget>[
            TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "Thông tin học sinh",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B2384),
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Hồ sơ giấy tờ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B2384),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StudentInfoWidget(),
                  StudentDocumentWidget(), // Tab Hồ sơ giấy tờ
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
