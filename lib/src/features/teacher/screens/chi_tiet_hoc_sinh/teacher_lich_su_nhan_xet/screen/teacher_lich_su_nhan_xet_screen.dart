import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/nhan_xet_hoc_sinh/teacher_nhan_xet_hoc_sinh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thong_tin_hoc_sinh/teacher_thong_tin_hoc_sinh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_lich_su_nhan_xet/widget/teacher_them_moi_nhan_xet_bottom_sheet.dart';
import '../widget/teacher_nhan_xet_card_widget.dart';

class TeacherLichSuNhanXetScreen extends StatelessWidget {
  final String studentName;
  final String imageUrl;
  final String guardianID; // ID phụ huynh
  final String replyContent; // Nội dung trả lời
  final String commentDate; // Ngày nhận xét
  final String teacherID; // ID giáo viên
  final String studentID; // ID học sinh
  final Function(String) onAddComment; // Callback để thêm nhận xét

  const TeacherLichSuNhanXetScreen({
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

    // Lấy ngày hiện tại
    final String currentDate = DateTime.now().toLocal().toString().split(
        ' ')[0];

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
                        var studentComments =
                        controller
                            .comments[index]["student_id_1"]["commentInfo"]; // Lấy danh sách nhận xét của học sinh

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: studentComments.map<Widget>((comment) {
                            return TeacherNhanXetCardWidget(
                              parentName: comment["guardianID"],
                              date: comment["commentDate"],
                              comment: comment["comment"],
                              teacherID: comment["teacherID"],
                              guardianID: comment["guardianID"],
                              replyContent: comment["replyContent"],
                              commentDate: comment["commentDate"],
                              replyDate: comment["replyDate"],
                            );
                          }).toList(),
                        );
                      },
                    ),
                  );
                }),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0), // Padding xung quanh nút
                child: SizedBox(
                  width: 300, // Đặt chiều rộng của nút lớn hơn
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(); // Quay lại màn hình trước
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF380543), // Màu nền nút
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Bo góc 30
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.0),
                      // Padding bên trong nút
                      child: Text(
                        "Quay lại trang trước",
                        style: TextStyle(
                          color: Colors.white, // Màu chữ trắng
                          fontSize: 22, // Kích thước chữ 22
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
            alignment: Alignment.center, // Căn giữa các widget trong Stack
            children: [
              // Avatar hình tròn
              CircleAvatar(
                radius: 70, // Kích thước avatar
                backgroundImage: imageUrl.startsWith('http')
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider,
              ),
              // Nút thêm mới
              Positioned(
                bottom: 0, // Đặt nút ở đáy của avatar
                right: 0,
                // Đặt nút ở bên phải của avatar
                child: GestureDetector(
                  onTap: () {
                    // Hiển thị BottomSheet
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return TeacherThemMoiNhanXetBottomSheet(
                          teacherID: "teacher_id_1",
                          // ID giáo viên
                          parentName: studentName, // :))) lấy tên học sinh cho phụ huynh
                          // Tên phụ huynh
                          currentDate: currentDate,
                          guardianID: guardianID,
                          replyContent: replyContent,
                          commentDate: commentDate,
                          onAddComment: (String comment) {
                            // Logic để thêm nhận xét
                            print(
                                "Nhận xét được thêm: $comment"); // Thay đổi với logic thực tế
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 40, // Kích thước nút
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFADE25D), // Màu nền nút
                      shape: BoxShape.circle, // Hình tròn
                      border: Border.all(
                          color: Colors.white, width: 2), // Viền trắng
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
          const SizedBox(height: 8), // Khoảng cách giữa avatar và tên
          // Tên học sinh
          Text(
            studentName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333), // Màu chữ
            ),
          ),
          const Text(
            "LỊCH SỬ NHẬN XÉT",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7B7B7B), // Màu chữ
            ),
          ),
        ],
      ),
    );
  }
}