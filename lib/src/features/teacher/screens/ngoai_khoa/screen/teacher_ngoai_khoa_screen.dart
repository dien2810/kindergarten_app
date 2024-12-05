import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/ngoai_khoa/teacher_ngoai_khoa_controller.dart';
import '../widget/teacher_cau_lac_bo_card_widget.dart';
import 'teacher_them_moi_cau_lac_bo_screen.dart';

class TeacherNgoaiKhoaScreen extends StatefulWidget {
  const TeacherNgoaiKhoaScreen({super.key});

  @override
  _TeacherNgoaiKhoaScreenState createState() => _TeacherNgoaiKhoaScreenState();
}

class _TeacherNgoaiKhoaScreenState extends State<TeacherNgoaiKhoaScreen> {
  final TeacherNgoaiKhoaController clubController = Get.put(TeacherNgoaiKhoaController());

  @override
  void initState() {
    super.initState();
    clubController.fetchSemesters();
    // Chọn học kỳ đầu tiên và tải danh sách câu lạc bộ khi vào trang
    WidgetsBinding.instance.addPostFrameCallback((_) {
      clubController.selectedSemester.value = 'semester_id_1';
      _fetchClubs('semester_id_1');
    });

  }

  void _fetchClubs(String semesterID) {
    clubController.fetchClubsBySemesterAndTeacher(semesterID);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tNgoaiKhoa),
        body: Stack(
          children: [
            Column(
              children: [
                Obx(() {
                  if (clubController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: t10Size),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: clubController.semesters.map((semester) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  clubController.selectedSemester.value = semester.id!;
                                  _fetchClubs(semester.id!);
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: clubController.selectedSemester.value == semester.id ? Colors.purple : Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: Colors.purple),
                                ),
                                child: Text(
                                  semester.semesterName,
                                  style: TextStyle(
                                    color: clubController.selectedSemester.value == semester.id ? Colors.white : Colors.purple,
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
                  );
                }),
                SizedBox(height: t15Size),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(t15Size),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(width: 2, color: const Color(0xFFC4C4C4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: t20Size),
                          Obx(() {
                            if (clubController.isLoading.value) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            if (clubController.clubs.isEmpty) {
                              return const Text('Không có câu lạc bộ nào đảm nhiệm trong học kỳ này.');
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: clubController.clubs.length,
                              itemBuilder: (context, index) {
                                final club = clubController.clubs[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TeacherCauLacBoCardWidget(
                                      club: club,
                                    ),
                                    SizedBox(height: t5Size),
                                  ],
                                );
                              },
                            );
                          }),
                        ],
                      ),
                    ),
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
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TeacherThemMoiCauLacBoScreen()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.purple),
                    ),
                    child : const SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white, size: 30.0),
                        SizedBox(width: 10.0),
                        Text(
                          'Thêm mới câu lạc bộ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ),
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
