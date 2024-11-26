import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/dan_thuoc/teacher_dan_thuoc_controller.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_1.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/teacher_navigation_menu_controller.dart';
import '../../teacher_navigation_menu/teacher_bottom_navigation_bar_widget.dart';
import '../widget/teacher_dan_thuoc_list_view_widget.dart';

class TeacherDanThuocScreen extends StatelessWidget {
  const TeacherDanThuocScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final teacherNavigationMenuController = Get.put(TeacherNavigationMenuController());
    final teacherDanThuocController = Get.put(TeacherDanThuocController());

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tDanThuoc),
        bottomNavigationBar: TeacherBottomNavigationBarWidget(controller: teacherNavigationMenuController),
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: t10Size),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                ),
              ),
            ),
            const SizedBox(height: t15Size),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
              child: Transform.translate(
              offset: const Offset(0, 0),
              child: Container(
                      height: 900,
                      padding: const EdgeInsets.all(t15Size),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                        border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
                      ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0)),
                      child: WeeklyDatePicker(
                        selectedDay: teacherDanThuocController
                            .selectedDay.value, // DateTime
                        changeDay: (value) {
                          teacherDanThuocController.fetchEventsForDay(
                              value); // Fetch events for selected day
                        },
                        backgroundColor: const Color(0xFFCAF0F8),
                        selectedDigitBackgroundColor:
                        const Color(0xFFBA83DE),
                        selectedDigitColor: const Color(0xFF03045E),
                        digitsColor: const Color(0xFF03045E),
                        weekdayTextColor: const Color(0xFF03045E),
                        enableWeeknumberText: false,
                      ),
                    )),
                          SizedBox(height: t15Size),
                          Expanded(
                            child: TeacherDanThuocListViewWidget(),
                          )
                        ],
                      ),
                    ),
              ),
                  )
                ],
              ),
            )
          ],
        ),
      ),


    );
  }
}










