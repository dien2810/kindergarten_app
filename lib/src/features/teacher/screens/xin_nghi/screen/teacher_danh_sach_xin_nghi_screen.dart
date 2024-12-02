import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_color_and_title.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/xin_nghi/teacher_xin_nghi_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/xin_nghi/screen/teacher_chi_tiet_don_xin_nghi_screen.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/teacher_navigation_menu_controller.dart';
import '../../teacher_navigation_menu/teacher_bottom_navigation_bar_widget.dart';
import '../widget/teacher_xin_nghi_card_widget.dart';

class TeacherDanhSachXinNghiScreen extends StatelessWidget {
  const TeacherDanhSachXinNghiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherNavigationMenuController = Get.put(TeacherNavigationMenuController());
    final teacherXinNghiController = Get.put(TeacherXinNghiController());

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithColorAndTitle(title: tXinNghi, hexColor: "#480CA8"),
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
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
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
                        padding: const EdgeInsets.all(t15Size),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                          border: Border.all(width: 2, color: const Color(0xFFC4C4C4)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: WeeklyDatePicker(
                                selectedDay: teacherXinNghiController.selectedDay.value,
                                changeDay: (value) {
                                  teacherXinNghiController.selectedDay.value = value; // Cập nhật ngày đã chọn
                                },
                                backgroundColor: const Color(0xFFCAF0F8),
                                selectedDigitBackgroundColor: const Color(0xFFBA83DE),
                                selectedDigitColor: const Color(0xFF03045E),
                                digitsColor: const Color(0xFF03045E),
                                weekdayTextColor: const Color(0xFF03045E),
                                enableWeeknumberText: false,
                              ),
                            )),
                            SizedBox(height: t15Size),
                            Obx(() {
                              var events = teacherXinNghiController.fetchEventsForDay(teacherXinNghiController.selectedDay.value);
                              // Kiểm tra xem có đơn xin nghỉ nào không
                              if (events.isEmpty) {
                                return const Center(
                                  child: Text(
                                    "Không có đơn xin nghỉ",
                                    style: TextStyle(fontSize: 18, color: Colors.grey),
                                  ),
                                );
                              }
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: events.map<Widget>((event) {
                                  var activityNames = teacherXinNghiController.getActivityNamesFromPeriod(event['details']['period']);

                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => TeacherChiTietDonXinNghiScreen(
                                        studentId: event['studentId'],
                                        date: event['date'],
                                        details: event['details'],
                                      ));
                                    },
                                    child: TeacherXinNghiCardWidget(
                                      dayOffData: {
                                        event['studentId']: {
                                          'dates': {
                                            event['date']: {
                                              'content': event['details']['content'],
                                              'period': activityNames.isNotEmpty ? activityNames : ['Cả ngày'],
                                              'status': event['details']['status'],
                                            },
                                          },
                                        },
                                      },
                                    ),
                                  );
                                }).toList(),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}