import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/nhan_xet_hoc_sinh/teacher_nhan_xet_hoc_sinh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/routes/hoc_duong_route.dart';

import '../../chi_tiet_hoc_sinh/teacher_lich_su_nhan_xet/widget/teacher_them_moi_nhan_xet_bottom_sheet.dart';

class ChiTietThanhVienClbBottomSheet extends StatefulWidget {
  final String studentName; // Student's name
  final String imageUrl; // Student's image URL
  final CommentData commentData;

  const ChiTietThanhVienClbBottomSheet({
    Key? key,
    required this.studentName,
    required this.imageUrl,
    required this.commentData,
  }) : super(key: key);

  @override
  State<ChiTietThanhVienClbBottomSheet> createState() =>
      _ChiTietThanhVienClbBottomSheetState();
}

class _ChiTietThanhVienClbBottomSheetState extends State<ChiTietThanhVienClbBottomSheet> {
  late final TeacherThongTinNhanxetController nhanxetController;
  @override
  void initState(){
    super.initState();
    nhanxetController = Get.find<TeacherThongTinNhanxetController>();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery
            .of(context)
            .viewInsets
            .bottom,
        left: 16,
        right: 16,
        top: 12, // Reduced top padding for a more compact look
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 750, // Giảm chiều cao tối đa của BottomSheet
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "Chi tiết thành viên câu lạc bộ",
                style: TextStyle(
                  fontSize: 22, // Reduced font size for title
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF580B8B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12), // Reduced space below the title

              // Circle Avatar for Image
              Center(
                child: CircleAvatar(
                  radius: 90, // Giảm kích thước avatar
                  backgroundImage: widget.imageUrl.startsWith('http')
                      ? NetworkImage(widget.imageUrl)
                      : AssetImage(widget.imageUrl) as ImageProvider,
                ),
              ),
              const SizedBox(height: 12), // Reduced space below the avatar

              // Display student name
              Center(
                child: Text(
                  widget.studentName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12), // Reduced space below the names

              // Bottom buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // First row with 2 buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildButton(
                            'Thông tin cá nhân',
                            HocDuongRoutes.thongTinCaNhanCLB,
                            { 'studentName': widget.studentName, 'imageUrl': widget.imageUrl}
                        ),
                      ),
                      const SizedBox(width: 10), // Space between the buttons
                      Expanded(
                        child: _buildButton(
                          'Thông tin sức khỏe',
                          HocDuongRoutes.thongTinSucKhoeCLB,
                          { 'studentName': widget.studentName, 'imageUrl': widget.imageUrl},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Second row with 2 buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildButton(
                          'Lịch sử nhận xét',
                          HocDuongRoutes.lichSuNhanXetCLB,
                          {
                            'studentName': widget.studentName,
                            'imageUrl': widget.imageUrl
                          }, // Truyền dữ liệu
                        ),
                      ),

                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12), // Reduced space below the buttons

              // Thêm nhận xét mới button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // Evenly space buttons
                  children: [
                    // "Thêm nhận xét mới" button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Hiển thị BottomSheet
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return TeacherThemMoiNhanXetBottomSheet(
                                teacherID: widget.commentData.teacherID,
                                parentName: widget.studentName,
                                currentDate: widget.commentData.currentDate,
                                guardianID: widget.commentData.guardianID,
                                replyContent: widget.commentData.replyContent,
                                commentDate: widget.commentData.commentDate,
                                onAddComment: (String comment) {
                                  print("Nhận xét được thêm: $comment"); // Thay đổi với logic thực tế
                                },
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9317AE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12), // Reduced padding
                        ),
                        child: const Text(
                          "Thêm nhận xét mới",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Reduced font size
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // Space between buttons
                    // "Hủy" button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle cancel
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12), // Reduced padding
                        ),
                        child: const Text(
                          "Hủy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Reduced font size
                          ),
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
Widget _buildButton(String text, String route, Map<String, dynamic> data) {
  return ElevatedButton(
    onPressed: () {
      Get.toNamed(route, arguments: data); // Truyền dữ liệu bằng GetX
      print("Navigating to: $route with arguments: $data");
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF79DBB1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}


