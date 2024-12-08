import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/nhan_xet_hoc_sinh/teacher_nhan_xet_hoc_sinh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thong_tin_hoc_sinh/teacher_thong_tin_hoc_sinh_controller.dart';
import '../../../../../../../common_widgets/cloud_image/cloud_image_widget.dart';
import '../../../../../../../repository/guardian_repository/guardian_repository.dart';
import '../widget/teacher_clb_nhan_xet_card_widget.dart';
import '../widget/teacher_clb_them_moi_nhan_xet_bottom_sheet.dart';

class TeacherClbLichSuNhanXetScreen extends StatelessWidget {
  final String studentName;
  final String imageUrl;
  final String guardianID;
  final String replyContent;
  final String commentDate;
  final String teacherID;
  final String studentID;
  final Function(String) onAddComment;

  const TeacherClbLichSuNhanXetScreen({
    Key? key,
    required this.studentName,
    required this.imageUrl,
    required this.guardianID,
    required this.replyContent,
    required this.commentDate,
    required this.teacherID,
    required this.studentID,
    required this.onAddComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TeacherThongTinNhanxetController controller =
        Get.put(TeacherThongTinNhanxetController());
    Future<String> parentName = controller.getTeacherName(guardianID);
    // Lấy ngày hiện tại
    final String currentDate =
        DateTime.now().toLocal().toString().split(' ')[0];

    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader2(title: tLichSuNhanXet),
      body: Stack(
        children: [
          Column(
            children: [
              // Avatar và tên học sinh
              _buildStudentProfile(context, imageUrl, studentName, currentDate),
              const SizedBox(height: 16), // Khoảng cách dưới ảnh

              // Danh sách nhận xét
              Expanded(
                child: Obx(() {
                  return Scrollbar(
                    child: ListView.builder(
                      itemCount: controller.comments.length,
                      itemBuilder: (context, index) {
                        var comment = controller.comments[index];

                        return Column(
                          children: [
                            for (var info in comment.commentInfo)
                              TeacherClbNhanXetCardWidget(
                                teacherID: info.teacherID,
                                comment: info.comment,
                                replyContent: info.replyContent,
                                commentDate: info.commentDate,
                                replyDate: info.replyDate,
                                guardianID: guardianID,
                                parentName: (parentName as String?) ?? '', // Placeholder, sẽ cập nhật sau
                                date: '',
                              ),
                          ],
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
          // Gọi hàm để lấy tên phụ huynh
          FutureBuilder<String?>(
            future: getFullNameByGuardianId(guardianID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Text(
                    "Tên phụ huynh: ${snapshot.data ?? 'Không tìm thấy'}");
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStudentProfile(BuildContext context, String imageUrl,
      String studentName, String currentDate) {
    return Row(
      children: [
        CircleAvatar(
          child: CloudImage(
            publicId: imageUrl,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          studentName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Future<String?> getFullNameByGuardianId(String guardianId) async {
    final guardianRepo = GuardianRepository(); // Đảm bảo bạn đã tạo lớp này
    return await guardianRepo.getFullNameByGuardianId(guardianId);
  }
}
