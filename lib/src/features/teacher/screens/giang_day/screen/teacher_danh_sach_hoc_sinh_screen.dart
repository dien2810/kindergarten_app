import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/image_strings.dart';
import 'package:kindergarten_app/src/features/teacher/screens/xin_nghi/screen/teacher_danh_sach_xin_nghi_screen.dart';

import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/giang_day/teacher_giang_day_controller.dart';
import '../../../controllers/teacher_navigation_menu_controller.dart';
import '../../diem_danh/screen/teacher_diem_danh_screen.dart';
import '../../teacher_navigation_menu/teacher_bottom_navigation_bar_widget.dart';
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
    final teacherNavigationMenuController =
    Get.put(TeacherNavigationMenuController());

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tDanhSachHocSinh),
        bottomNavigationBar: TeacherBottomNavigationBarWidget(
          controller: teacherNavigationMenuController,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Khung tìm kiếm
              Container(
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4E9F7),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: 'Tìm kiếm học sinh...',
                    hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF7B7B7B),
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    // Thực hiện logic tìm kiếm
                  },
                ),
              ),
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
                      Get.to(TeacherDiemDanhScreen());
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
                     Get.to(TeacherDanhSachXinNghiScreen());
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
              const Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 5.0, // Khoảng cách ngang giữa các phần tử
                    runSpacing: 5.0, // Khoảng cách dọc giữa các phần tử
                    alignment: WrapAlignment.center,
                    children: [
                      HocSinhWidget(
                          imageUrl: tHocSinhAvatarItem1,
                          tenHocSinh: 'Nguyễn Văn Trang Anh'),
                      HocSinhWidget(
                          imageUrl: tHocSinhAvatarItem2,
                          tenHocSinh: 'Giản Đình Thái'),
                      HocSinhWidget(
                          imageUrl: tHocSinhAvatarItem3,
                          tenHocSinh: 'Nguyễn Tuấn Đạt'),
                      HocSinhWidget(
                          imageUrl: tHocSinhAvatarItem3,
                          tenHocSinh: 'Nguyễn Tuấn Đạt'),
                      HocSinhWidget(
                          imageUrl: tHocSinhAvatarItem3,
                          tenHocSinh: 'Nguyễn Tuấn Đạt'),
                      HocSinhWidget(
                          imageUrl: tHocSinhAvatarItem3,
                          tenHocSinh: 'Nguyễn Tuấn Đạt'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
