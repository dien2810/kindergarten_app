import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thong_tin_hoc_sinh/teacher_thong_tin_hoc_sinh_controller.dart';

import '../widget/teacher_ho_so_giay_to_hoc_sinh_widget.dart';
import '../widget/teacher_thong_tin_hoc_sinh_widget.dart';

class TeacherThongTinCaNhanHocSinhScreen extends StatelessWidget {
  final String studentName; // Tên học sinh
  final String imageUrl; // Đường dẫn ảnh của học sinh

  const TeacherThongTinCaNhanHocSinhScreen({
    Key? key,
    required this.studentName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TeacherThongTinHocSinhController controller =
    Get.put(TeacherThongTinHocSinhController());

    return DefaultTabController(
      length: 2, // Số lượng tab
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tThongTinCaNhan),
        body: Column(
          children: [
            // Avatar và tên học sinh
            _buildStudentProfile(imageUrl, studentName),
            const SizedBox(height: 16), // Khoảng cách dưới ảnh

            // TabBar
            const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "Thông tin học sinh",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B2384),
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Hồ sơ giấy tờ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0B2384),
                    ),
                  ),
                ),
              ],
            ),

            // Nội dung TabBar
            Expanded(
              child: TabBarView(
                children: [
                  TeacherThongTinHocSinhWidget(studentInfo: student),
                  TeacherHoSoGiayToHocSinhWidget(studentRecord: record),
                ],
              ),
            ),

            // Nút cập nhật thông tin
            UpdateInfoFooterWidget(
              onUpdate: () {
                Get.snackbar(
                  "Cập nhật thành công",
                  "Thông tin học sinh đã được cập nhật!",
                  snackPosition: SnackPosition.TOP,
                );
              },
            ),
          ],
        ),
      ),
    );
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
            backgroundImage: imageUrl.startsWith('http')
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
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
}


class UpdateInfoFooterWidget extends StatelessWidget {
  const UpdateInfoFooterWidget({super.key, required this.onUpdate});

  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ElevatedButton(
        onPressed: onUpdate,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF380543), // Màu nền nút
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0), // Bo góc nút
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0),
        ),
        child: const Text(
          "Cập nhật thông tin",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Màu chữ
          ),
        ),
      ),
    );
  }
}
