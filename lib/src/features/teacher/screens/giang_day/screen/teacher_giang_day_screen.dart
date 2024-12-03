import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/giang_day/teacher_giang_day_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/giang_day/widget/teacher_lop_giang_day_widget.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/teacher_navigation_menu_controller.dart';
import '../../teacher_navigation_menu/teacher_bottom_navigation_bar_widget.dart';

class TeacherGiangDayScreen extends StatefulWidget {
  const TeacherGiangDayScreen({super.key});

  @override
  State<TeacherGiangDayScreen> createState() => _TeacherGiangDayScreenState();
}

class _TeacherGiangDayScreenState extends State<TeacherGiangDayScreen> {
  String selectedAcademicYear = '2024 - 2025';
  List<String> academicYears = ['2024 - 2025', '2023 - 2024', '2022 - 2023', '2021 - 2022'];

  @override
  Widget build(BuildContext context) {
    final giangDayController = Get.put(TeacherGiangDayController());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tGiangDay),
        body: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: t10Size),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Thêm cuộn ngang
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: academicYears.map((year) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAcademicYear = year;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: selectedAcademicYear == year ? Colors.purple : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.purple),
                              ),
                              child: Text(
                                year,
                                style: TextStyle(
                                  color: selectedAcademicYear == year ? Colors.white : Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: t15Size),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          height: 900,
                          padding: EdgeInsets.all(t15Size),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(25.0)),
                            border: Border.all(
                                width: 2, color: const Color(0xFFC4C4C4)),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: t20Size),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        // bên trong để 1 widget lớp giảng dạy
                                        const TeacherLopGiangDayWidget(lopName: 'Lớp Pooh 01', soLuong: 25, thoiGianBatDau: '31/08/2024', thoiGianKetThuc: '31/12/2024'),
                                        SizedBox(height: t5Size),
                                        //TeacherThucDonCardWidget(),
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
          ],
        ),
      ),
    );
  }
}
