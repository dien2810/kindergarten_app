import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/teacher_navigation_menu_controller.dart';
import '../../../controllers/thuc_don/teacher_thuc_don_controller.dart';
import '../../teacher_navigation_menu/teacher_bottom_navigation_bar_widget.dart';
import '../widget/teacher_thuc_don_card_widget.dart';

class TeacherThucDonScreen extends StatelessWidget {
  const TeacherThucDonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final thucDonController = Get.put(TeacherThucDonController());
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: t10Size),
                  ),
                ),
                const SizedBox(height: t15Size),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          height: 900,
                          padding: const EdgeInsets.all(t15Size),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                            border: Border.all(width: 2, color: const Color(0xFFC4C4C4)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                    () => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: WeeklyDatePicker(
                                    selectedDay: thucDonController.selectedDay.value, // DateTime
                                    changeDay: (value) {
                                      thucDonController.selectedDay.value = value;
                                    },
                                    backgroundColor: const Color(0xFFCAF0F8),
                                    selectedDigitBackgroundColor: const Color(0xFFBA83DE),
                                    selectedDigitColor: const Color(0xFF03045E),
                                    digitsColor: const Color(0xFF03045E),
                                    weekdayTextColor: const Color(0xFF03045E),
                                    enableWeeknumberText: false,
                                  ),
                                ),
                              ),
                              const SizedBox(height: t20Size),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tBuaSang,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF03045E),
                                          ),
                                        ),
                                        SizedBox(height: t5Size),
                                        TeacherThucDonCardWidget(),
                                        SizedBox(height: t5Size),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
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
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: t20Size),
                child: ElevatedButton(
                  onPressed: () {
                    // Hành động khi nhấn nút
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9317AE), // Màu nền
                    foregroundColor: Colors.white, // Màu chữ
                    padding: const EdgeInsets.symmetric(vertical: t10Size),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Thêm mới thực đơn",
                    style: TextStyle(fontSize: 16),
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
