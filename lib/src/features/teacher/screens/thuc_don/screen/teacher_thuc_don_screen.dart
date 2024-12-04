import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thuc_don/teacher_thuc_don_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thuc_don/widget/teacher_thuc_don_card_widget.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/sizes.dart';
import '../../../../student/models/menu/menu_item.dart';
import '../widget/teacher_them_mon_an_bottom_sheet.dart';

class TeacherThucDonScreen extends StatelessWidget {
  const TeacherThucDonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherThucDonController = Get.put(TeacherThucDonController());

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tThucDon),
        body: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: t10Size),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: const TabBar(
                        automaticIndicatorColorAdjustment: false,
                        unselectedLabelColor: Color(0xFF777777),
                        tabs: [
                          Tab(
                            child: Text(
                              tThucDon,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: t15Size),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(t15Size),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                          border: Border.all(width: 2, color: const Color(0xFFC4C4C4)),
                        ),
                        child: GetBuilder<TeacherThucDonController>(
                          init: TeacherThucDonController(),
                          builder: (controller) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: WeeklyDatePicker(
                                    selectedDay: teacherThucDonController.selectedDay.value,
                                    changeDay: (value) async {
                                      teacherThucDonController.selectedDay.value = value;
                                      teacherThucDonController.update(); // Thông báo cập nhật
                                      await teacherThucDonController.getMenuData(value); // Lấy dữ liệu mới
                                    },

                                    backgroundColor: const Color(0xFFCAF0F8),
                                    selectedDigitBackgroundColor: const Color(0xFFBA83DE),
                                    selectedDigitColor: const Color(0xFF03045E),
                                    digitsColor: const Color(0xFF03045E),
                                    weekdayTextColor: const Color(0xFF03045E),
                                    enableWeeknumberText: false,
                                  ),
                                ),
                                SizedBox(height: t10Size), // Khoảng cách giữa WeeklyDatePicker và danh sách món ăn
                                Expanded(
                                  child: FutureBuilder<List<MenuItem>?>(
                                    future: teacherThucDonController.getMenuData(teacherThucDonController.selectedDay.value),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const Center(child: CircularProgressIndicator());
                                      }
                                      if (snapshot.hasError) {
                                        return Center(child: Text('Error: ${snapshot.error}'));
                                      }
                                      if (!snapshot.hasData || snapshot.data?.isEmpty == true) {
                                        return const Center(child: Text('Không có món ăn cho ngày này.'));
                                      } else {
                                        final menuItems = snapshot.data!;
                                        return ListView.builder(
                                          itemCount: menuItems.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                TeacherThucDonCardWidget(
                                                  menuItem: menuItems[index],
                                                  date: teacherThucDonController.selectedDay.value,
                                                  index: index,
                                                ),
                                                SizedBox(height: t10Size), // Khoảng cách giữa các card
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(height: t50Size), // Khoảng trống nửa sau danh sách
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: t20Size),
                child: ElevatedButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return const TeacherThemMonAnBottomSheet();
                      },
                    );
                    // Làm mới dữ liệu sau khi thêm mới
                    teacherThucDonController.refreshMenuData(teacherThucDonController.selectedDay.value);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9317AE),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: t10Size),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    "Thêm mới món ăn",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
