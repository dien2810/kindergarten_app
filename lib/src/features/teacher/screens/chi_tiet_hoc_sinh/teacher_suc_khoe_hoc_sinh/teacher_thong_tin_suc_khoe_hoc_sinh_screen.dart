import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/circle_cloud_image_widget.dart';
import 'package:kindergarten_app/src/constants/colors.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/teacher_thong_tin_suc_khoe_form_widget.dart';
import '../../../../../constants/sizes.dart';
import '../../../../student/models/student/student_model.dart';
import '../../../controllers/suc_khoe_hoc_sinh/teacher_suc_khoe_hoc_sinh_controller.dart';
import 'co_ban_tab/teacher_co_ban_tab_widget.dart';
import 'ho_so_y_te/teacher_danh_sach_lich_su_tiem_chung_widget.dart';
import 'ho_so_y_te/teacher_loi_khuyen_bac_si_widget.dart';
import 'kham_tab/teacher_kham_tab_widget.dart';

class TeacherThongTinSucKhoeHocSinhScreen extends StatelessWidget {
  final StudentModel student; // Đường dẫn ảnh của học sinh
  const TeacherThongTinSucKhoeHocSinhScreen({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeacherSucKhoeHocSinhController());
    controller.student = student;

    return FutureBuilder(
      future: controller.loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: const TeacherAppBarWithTitleHeader2(title: tThongTinSucKhoe),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: t10Size),
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          _buildStudentProfile(student.studentDocument.image, student.studentProfile.name),
                          const SizedBox(height: 16), // Khoảng cách dưới ảnh
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                              ),
                              child: const TabBar(
                                automaticIndicatorColorAdjustment: false,
                                unselectedLabelColor: Color(0xFF777777),
                                tabs: [
                                  Tab(
                                    child: Text(
                                      tThongTinChung,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      tHoSoYTe,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    TeacherThongTinSucKhoeChungWidget(controller: controller),
                    DefaultTabController(
                      length: 4,
                      child: Column(
                        children: [
                          TabBar.secondary(
                            isScrollable: true,
                            automaticIndicatorColorAdjustment: false,
                            unselectedLabelColor: const Color(0xFF757575),
                            labelColor: tWhiteColor,
                            indicatorColor: const Color(0xFF03045E),
                            indicator: BoxDecoration(
                              color: const Color(0xFF7209B7),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: const [
                              Tab(
                                child: Center(
                                  child: Text(
                                    tCoBan,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Center(
                                  child: Text(
                                    tKham,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Center(
                                  child: Text(
                                    tLoiKhuyen,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Center(
                                  child: Text(
                                    tTiemChung,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: t10Size),
                          Expanded(
                            child: TabBarView(
                              children: [
                                TeacherCoBanTabWidget(controller: controller),
                                TeacherKhamTabWidget(controller: controller),
                                TeacherLoiKhuyenBacSiWidget(controller: controller),
                                TeacherDanhSachLichSuTiemChungWidget(controller: controller),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

// Hàm xây dựng phần avatar và tên học sinh
Widget _buildStudentProfile(String imageUrl, String studentName) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        // Avatar hình tròn
        CircleAvatar(
          radius: 60, // Kích thước avatar
          child: CircleCloudImageWidget(publicId: imageUrl)
          // backgroundImage: imageUrl.startsWith('http')
          //     ? NetworkImage(imageUrl)
          //     : AssetImage(imageUrl) as ImageProvider,
        ),
        const SizedBox(height: 12), // Khoảng cách giữa avatar và tên

        // Tên học sinh
        Text(
          studentName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333), // Màu chữ
          ),
        ),
      ],
    ),
  );
}