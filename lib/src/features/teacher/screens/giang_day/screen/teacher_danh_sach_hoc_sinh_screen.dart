import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/diem_danh/teacher_diem_danh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/hoat_dong_su_kien/screen/hoat_dong_su_kien_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/xin_nghi/screen/teacher_danh_sach_xin_nghi_screen.dart';

import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/giang_day/teacher_giang_day_controller.dart';
import '../../diem_danh/screen/teacher_diem_danh_screen.dart';
import '../widget/hoc_sinh_widget.dart';

class TeacherDanhSachHocSinhScreen extends StatefulWidget {
  const TeacherDanhSachHocSinhScreen({super.key});

  @override
  _TeacherDanhSachHocSinhScreenState createState() =>
      _TeacherDanhSachHocSinhScreenState();
}

class _TeacherDanhSachHocSinhScreenState
    extends State<TeacherDanhSachHocSinhScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final giangDayController = Get.put(TeacherGiangDayController());

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tDanhSachHocSinh),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container(
              //   margin: const EdgeInsets.only(bottom: 16.0),
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFF4E9F7),
              //     borderRadius: BorderRadius.circular(18.0),
              //   ),
              //   child: TextField(
              //     controller: searchController,
              //     decoration: const InputDecoration(
              //       contentPadding:
              //       EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              //       suffixIcon: Icon(
              //         Icons.search,
              //         color: Colors.black,
              //       ),
              //       hintText: 'Tìm kiếm học sinh...',
              //       hintStyle: TextStyle(
              //         fontSize: 14.0,
              //         color: Color(0xFF7B7B7B),
              //       ),
              //       border: InputBorder.none,
              //     ),
              //     onChanged: (value) {
              //       // Thực hiện logic tìm kiếm
              //     },
              //   ),
              // ),
              // Dãy button
              Wrap(
                spacing: 1.0, // Khoảng cách giữa các button
                alignment: WrapAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB5179E),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    ),
                    onPressed: () {
                      // Chuyển sang trang "Hoạt Động"
                      Get.to(const TeacherHoatDongSuKienScreen());
                    },
                    child: const Text(
                      'HOẠT ĐỘNG',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7209B7),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    ),
                    onPressed: () {
                      // Chuyển sang trang "Điểm Danh"
                      final teacherDiemDanhController = Get.put(TeacherDiemDanhController());
                      teacherDiemDanhController.studentIds = giangDayController.classModel!.students;
                      Get.to(()=>  TeacherDiemDanhScreen());
                    },
                    child: const Text(
                      'ĐIỂM DANH',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF480CA8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    ),
                    onPressed: () {
                      final diemDanhController = Get.put(TeacherDiemDanhController());
                      diemDanhController.studentIds = giangDayController.classModel!.students;
                      Get.to(TeacherDanhSachXinNghiScreen(studentIds: giangDayController.classModel!.students));
                    },
                    child: const Text(
                      'XIN NGHỈ',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10.0), // Khoảng cách giữa button và danh sách
              // Danh sách học sinh
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Số lượng widget trên một hàng
                      crossAxisSpacing: 10, // Khoảng cách ngang
                      mainAxisSpacing: 10, // Khoảng cách dọc
                    ),
                    itemCount: giangDayController.classModel?.students.length, // Số lượng widget
                    itemBuilder: (context, index) {
                      final studentId = giangDayController.classModel?.students[index];
                      return FutureBuilder(
                        future: giangDayController.getStudentByStudentId(studentId!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting){
                            return const Center(child: CircularProgressIndicator());
                          }
                          else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }
                          else if (!snapshot.hasData) {
                            return const Center(child: Text('Không có dữ liệu.'));
                          }
                          final student = snapshot.data;
                          return HocSinhWidget(
                            student: student!,
                          );
                        }
                      );
                    },
                  )

                  // child: Wrap(
                  //   spacing: 5.0, // Khoảng cách ngang giữa các phần tử
                  //   runSpacing: 5.0, // Khoảng cách dọc giữa các phần tử
                  //   alignment: WrapAlignment.center,
                  //   children: [
                  //     SizedBox(
                  //       height: t100Size*3,
                  //       child: ListView.builder(
                  //         shrinkWrap: true,
                  //         physics: const NeverScrollableScrollPhysics(),
                  //         itemCount: 6,
                  //         // itemCount: giangDayController.classModel?.students.length,
                  //         itemBuilder: (context, index){
                  //           return const HocSinhWidget(
                  //               imageUrl: tHocSinhAvatarItem1,
                  //               tenHocSinh: 'Nguyễn Văn Trang Anh'
                  //           );
                  //         },
                  //       ),
                  //     ),
                  //
                  //     const HocSinhWidget(
                  //         imageUrl: tHocSinhAvatarItem1,
                  //         tenHocSinh: 'Nguyễn Văn Trang Anh'),
                  //
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
