import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/screens/ngoai_khoa/screen/teacher_them_moi_cau_lac_bo_screen.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/ngoai_khoa/teacher_ngoai_khoa_controller.dart';
import '../widget/teacher_cau_lac_bo_card_widget.dart';

class TeacherNgoaiKhoaScreen extends StatefulWidget {
  const TeacherNgoaiKhoaScreen({super.key});

  @override
  _TeacherNgoaiKhoaScreenState createState() => _TeacherNgoaiKhoaScreenState();
}

class _TeacherNgoaiKhoaScreenState extends State<TeacherNgoaiKhoaScreen> {
  String selectedAcademicYear = '2024 - 2025';
  List<String> academicYears = ['2024 - 2025', '2023 - 2024', '2022 - 2023', '2021 - 2022'];
  final TeacherNgoaiKhoaController clubController = Get.put(TeacherNgoaiKhoaController());

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: t10Size),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
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
                            // Sử dụng clubController.clubs để lấy danh sách câu lạc bộ
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
                                      club: club, // Gửi club model vào widget
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
            // Nút thêm mới câu lạc bộ
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF99D98C), // Màu xanh lá nhạt
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TeacherThemMoiCauLacBoScreen(), // Thay "club_id_1" bằng ID thực tế
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 8), // Khoảng cách giữa nút và văn bản
                    const Text(
                      'Thêm mới câu lạc bộ',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}