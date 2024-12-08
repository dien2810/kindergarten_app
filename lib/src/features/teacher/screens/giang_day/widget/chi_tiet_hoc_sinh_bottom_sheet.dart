import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/circle_cloud_image_widget.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/nhan_xet_hoc_sinh/teacher_nhan_xet_hoc_sinh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/routes/hoc_duong_route.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_chuyen_can/screen/teacher_chuyen_can_hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/teacher_thong_tin_suc_khoe_hoc_sinh_screen.dart';

import '../../../../student/models/student/student_model.dart';
import '../../chi_tiet_hoc_sinh/teacher_lich_su_nhan_xet/widget/teacher_them_moi_nhan_xet_bottom_sheet.dart';
import '../../chi_tiet_hoc_sinh/teacher_thong_tin_hoc_sinh/screen/teacher_thong_tin_ca_nhan_hoc_sinh_screen.dart';

class ChiTietHocSinhBottomSheet extends StatefulWidget {
  final StudentModel student;
  final CommentData commentData;

  const ChiTietHocSinhBottomSheet({
    super.key,
    required this.student,
    required this.commentData,
  });

  @override
  State<ChiTietHocSinhBottomSheet> createState() =>
      _ChiTietHocSinhBottomSheetState();
}

class _ChiTietHocSinhBottomSheetState extends State<ChiTietHocSinhBottomSheet> {
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
                "Chi tiết học sinh",
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
                  child: CircleCloudImageWidget(
                    publicId: widget.student.studentDocument.image
                  )
                  // backgroundImage: widget.imageUrl.startsWith('http')
                  //     ? NetworkImage(widget.imageUrl)
                  //     : AssetImage(widget.imageUrl) as ImageProvider,
                ),
              ),
              const SizedBox(height: 12), // Reduced space below the avatar

              // Display student name
              Center(
                child: Text(
                  widget.student.studentProfile.name,
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
                            HocDuongRoutes.thongTinCaNhan,
                            widget.student
                        ),
                      ),
                      const SizedBox(width: 10), // Space between the buttons
                      Expanded(
                        child: _buildButton(
                          'Thông tin sức khỏe',
                          HocDuongRoutes.thongTinSucKhoe,
                          widget.student,
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
                          HocDuongRoutes.lichSuNhanXet,
                          widget.student, // Truyền dữ liệu
                        ),
                      ),
                      const SizedBox(width: 10), // Space between the buttons
                      Expanded(
                        child: _buildButton(
                          'Chuyên cần',
                          HocDuongRoutes.chuyenCan,
                          widget.student
                          , // Truyền dữ liệu
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
                                parentName: widget.student.studentProfile.name,
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
  Widget _buildButton(String text, String route, StudentModel student) {
    return ElevatedButton(
      onPressed: () {
        if (route == HocDuongRoutes.thongTinCaNhan){
          Get.to(()=>TeacherThongTinCaNhanHocSinhScreen(
            student: student,
          ));
        }
        else if (route == HocDuongRoutes.thongTinSucKhoe){
          Get.to(()=>TeacherThongTinSucKhoeHocSinhScreen(student: student));
        }
        // else if (route == HocDuongRoutes.lichSuNhanXet){
        //   Get.to(()=>TeacherLichSuNhanXetScreen(
        //     studentName: student.studentProfile.name,
        //     imageUrl: student.studentDocument.image,
        //     guardianID: student.studentProfile.studentID,
        //     replyContent: comment.replyContent,
        //     commentDate: comment.commentDate,
        //     teacherID: comment.teacherID,
        //     studentID: student.studentProfile.studentID,
        //     onAddComment: comment.
        //   ));
        // }
        else if (route == HocDuongRoutes.chuyenCan){
          Get.to(()=>TeacherChuyenCanHocSinhScreen(
            student: student
          ));
        }

        // Get.toNamed(route, arguments: data); // Truyền dữ liệu bằng GetX
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


