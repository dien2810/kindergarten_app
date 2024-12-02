import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/image_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/ngoai_khoa/teacher_ngoai_khoa_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/ngoai_khoa/screen/teacher_chi_tiet_cau_lac_bo_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/ngoai_khoa/widget/thanh_vien_widget.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/text_strings.dart';

class TeacherDanhSachThanhVienClbScreen extends StatefulWidget {
  const TeacherDanhSachThanhVienClbScreen({super.key});

  @override
  _TeacherDanhSachThanhVienClbScreenState createState() =>
      _TeacherDanhSachThanhVienClbScreenState();
}

class _TeacherDanhSachThanhVienClbScreenState
    extends State<TeacherDanhSachThanhVienClbScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ngoaiKhoaController = Get.put(TeacherNgoaiKhoaController());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tThanhVienCLB),
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
                    hintText: 'Tìm kiếm thành viên...',
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

              const SizedBox(height: 10.0), // Khoảng cách giữa button và danh sách
              // Danh sách học sinh
              const Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 5.0, // Khoảng cách ngang giữa các phần tử
                    runSpacing: 5.0, // Khoảng cách dọc giữa các phần tử
                    alignment: WrapAlignment.center,
                    children: [
                      ThanhVienWidget(
                          imageUrl: tHocSinhAvatarItem1,
                          tenHocSinh: 'Nguyễn Văn Trang Anh'),
                      ThanhVienWidget(
                          imageUrl: tHocSinhAvatarItem2,
                          tenHocSinh: 'Giản Đình Thái'),
                      ThanhVienWidget(
                          imageUrl: tHocSinhAvatarItem3,
                          tenHocSinh: 'Nguyễn Tuấn Đạt'),
                      ThanhVienWidget(
                          imageUrl: tHocSinhAvatarItem3,
                          tenHocSinh: 'Nguyễn Tuấn Đạt'),
                      ThanhVienWidget(
                          imageUrl: tHocSinhAvatarItem3,
                          tenHocSinh: 'Nguyễn Tuấn Đạt'),
                      ThanhVienWidget(
                          imageUrl: tHocSinhAvatarItem3,
                          tenHocSinh: 'Nguyễn Tuấn Đạt'),
                    ],
                  ),
                ),
              ),
              // Footer với 2 button
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF99D98C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherChiTietCauLacBoScreen(clubId: "club_id_1"), // Thay "club_id_1" bằng ID thực tế
                            ),
                          );
                        },
                        child: const Text(
                          'CHI TIẾT CLB',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0), // Khoảng cách giữa hai button
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF380543),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'QUAY LẠI',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}