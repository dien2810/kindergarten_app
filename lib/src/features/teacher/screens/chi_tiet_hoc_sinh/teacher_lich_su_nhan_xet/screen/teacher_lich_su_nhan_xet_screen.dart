import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/nhan_xet_hoc_sinh/teacher_nhan_xet_hoc_sinh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_lich_su_nhan_xet/widget/teacher_them_moi_nhan_xet_bottom_sheet.dart';
import '../../../../../../../flutter_flow/flutter_flow_util.dart';
import '../../../../../../common_widgets/cloud_image/circle_cloud_image_widget.dart';
import '../widget/teacher_nhan_xet_card_widget.dart';

class TeacherLichSuNhanXetScreen extends StatelessWidget {
  final String studentName;
  final String imageUrl;
  final String guardianID;
  final String studentID;
  final String teacherID; // Thêm teacherID
  final Function(String, String, String) onAddComment; // Cập nhật kiểu hàm

  const TeacherLichSuNhanXetScreen({
    super.key,
    required this.studentName,
    required this.imageUrl,
    required this.guardianID,
    required this.studentID,
    required this.teacherID, // Thêm tham số này
    required this.onAddComment,
  });

  @override
  Widget build(BuildContext context) {
    final TeacherThongTinNhanxetController controller =
    Get.put(TeacherThongTinNhanxetController());

    // Lấy ngày hiện tại
    final String currentDate = DateTime.now().toLocal().toString().split(' ')[0];

    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader2(title: tLichSuNhanXet),
      body: Stack(
        children: [
          Column(
            children: [
              // Avatar và tên học sinh
              _buildStudentProfile(context, imageUrl, studentName, currentDate),
              const SizedBox(height: 16),

              Expanded(
                child: Obx(() {
                  // Lấy danh sách nhận xét của học sinh
                  var studentComments = controller.comments;

                  return Scrollbar(
                    child: ListView.builder(
                      itemCount: studentComments.length,
                      itemBuilder: (context, index) {
                        final commentModel = studentComments[index];

                        // Lặp qua tất cả các CommentInfo trong CommentModel
                        return Column(
                          children: commentModel.commentInfo.map((comment) {
                            return TeacherNhanXetCardWidget(
                              date: comment.commentDate, // Ngày nhận xét
                              comment: comment.comment,
                              teacherID: comment.teacherID,
                              guardianID: comment.guardianID!, // Nếu guardianID có thể null
                              replyContent: comment.replyContent,
                              commentDate: comment.commentDate,
                              replyDate: comment.replyDate,
                            );
                          }).toList(),
                        );
                      },
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(); // Quay lại màn hình trước
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF380543),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.0),
                      child: Text(
                        "Quay lại trang trước",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Hàm xây dựng phần avatar và tên học sinh
  Widget _buildStudentProfile(BuildContext context, String imageUrl,
      String studentName, String currentDate) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: CircleCloudImageWidget(publicId: imageUrl),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    // Hiển thị BottomSheet
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return TeacherThemMoiNhanXetBottomSheet(
                          teacherID: teacherID,
                          parentName: studentName,
                          guardianID: guardianID,
                          onAddComment: onAddComment, // Cập nhật callback
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFADE25D),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            studentName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const Text(
            "LỊCH SỬ NHẬN XÉT",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7B7B7B),
            ),
          ),
        ],
      ),
    );
  }
}