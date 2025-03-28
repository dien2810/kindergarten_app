import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/giang_day/teacher_giang_day_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/giang_day/widget/teacher_lop_giang_day_widget.dart';
import '../../../../../constants/sizes.dart';

class TeacherGiangDayScreen extends StatefulWidget {
  const TeacherGiangDayScreen({super.key});

  @override
  State<TeacherGiangDayScreen> createState() => _TeacherGiangDayScreenState();
}

class _TeacherGiangDayScreenState extends State<TeacherGiangDayScreen> {

  List<String> academicYears = ['2024 - 2025', '2023 - 2024', '2022 - 2023', '2021 - 2022'];

  @override
  Widget build(BuildContext context) {
    final giangDayController = Get.put(TeacherGiangDayController());
    return FutureBuilder(
      future: giangDayController.getSemesterList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Không có dữ liệu.'));
        }
        final academicYears = snapshot.data!;
        giangDayController.selectedAcademicYear.value=academicYears[0].semesterName;

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
                          child: Obx(()=>Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: academicYears.map((semester) {
                                final year = semester.semesterName;
                                return GestureDetector(
                                  onTap: () {
                                    giangDayController.semester = semester;
                                    giangDayController.selectedAcademicYear.value=year;
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: giangDayController.selectedAcademicYear.value == year ? Colors.purple : Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.purple),
                                    ),
                                    child: Text(
                                      year,
                                      style: TextStyle(
                                        color: giangDayController.selectedAcademicYear.value == year ? Colors.white : Colors.purple,
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
                                    child: FutureBuilder(
                                      future: giangDayController.getClassesData(),
                                      builder: (context, snapshot){
                                        if (snapshot.connectionState == ConnectionState.waiting){
                                          return const Center(child: CircularProgressIndicator());
                                        }
                                        else if (snapshot.hasError) {
                                          return Center(child: Text('Error: ${snapshot.error}'));
                                        }
                                        else if (!snapshot.hasData) {
                                          return const Center(child: Text('Không có dữ liệu.'));
                                        }
                                        final classes = snapshot.data!;
                                        return Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            // bên trong để 1 widget lớp giảng dạy
                                            TeacherLopGiangDayWidget(
                                              lopName: classes.className,
                                              soLuong: classes.students.length,
                                              thoiGianBatDau: '01-12-2024',
                                              thoiGianKetThuc: '31-12-2024'
                                            ),
                                            SizedBox(height: t5Size),
                                            //TeacherThucDonCardWidget(),
                                            SizedBox(height: t5Size),
                                          ],
                                        );
                                      },
                                    )
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
    );
  }
}
