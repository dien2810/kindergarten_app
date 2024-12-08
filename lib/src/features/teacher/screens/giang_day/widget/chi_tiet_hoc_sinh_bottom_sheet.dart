import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/circle_cloud_image_widget.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/nhan_xet_hoc_sinh/teacher_nhan_xet_hoc_sinh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/routes/hoc_duong_route.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_chuyen_can/screen/teacher_chuyen_can_hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/teacher_thong_tin_suc_khoe_hoc_sinh_screen.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import '../../../../student/models/student/student_model.dart';
import '../../chi_tiet_hoc_sinh/teacher_lich_su_nhan_xet/screen/teacher_lich_su_nhan_xet_screen.dart';
import '../../chi_tiet_hoc_sinh/teacher_thong_tin_hoc_sinh/screen/teacher_thong_tin_ca_nhan_hoc_sinh_screen.dart';

class ChiTietHocSinhBottomSheet extends StatefulWidget {
  final StudentModel student;

  const ChiTietHocSinhBottomSheet({
    super.key,
    required this.student,
  });

  @override
  State<ChiTietHocSinhBottomSheet> createState() =>
      _ChiTietHocSinhBottomSheetState();
}

class _ChiTietHocSinhBottomSheetState extends State<ChiTietHocSinhBottomSheet> {
  late final TeacherThongTinNhanxetController nhanxetController;
  final AccountRepository accountRepo = Get.put(AccountRepository());
  String? teacherID;

  @override
  void initState() {
    super.initState();
    nhanxetController = Get.find<TeacherThongTinNhanxetController>();
    teacherID = accountRepo.userId;
    if (teacherID != null) {
      nhanxetController.loadCommentsForStudent(widget.student.id!, teacherID!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 12,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 750,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Chi tiết học sinh",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF580B8B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              Center(
                child: CircleAvatar(
                  radius: 50,
                  child: CircleCloudImageWidget(
                    publicId: widget.student.studentDocument.image,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Center(
                child: Text(
                  widget.student.studentProfile.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildButton(
                          'Thông tin cá nhân',
                          HocDuongRoutes.thongTinCaNhan,
                          widget.student,
                        ),
                      ),
                      const SizedBox(width: 10),
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
                  Row(
                    children: [
                      Expanded(
                        child: _buildButton(
                          'Lịch sử nhận xét',
                          HocDuongRoutes.lichSuNhanXet,
                          widget.student,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildButton(
                          'Chuyên cần',
                          HocDuongRoutes.chuyenCan,
                          widget.student,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Logic cho nút "Thêm nhận xét mới"
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9317AE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          "Thêm nhận xét mới",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          "Hủy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
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

  Widget _buildButton(String text, String route, StudentModel student) {
    return ElevatedButton(
      onPressed: () {
        if (route == HocDuongRoutes.thongTinCaNhan) {
          Get.to(() => TeacherThongTinCaNhanHocSinhScreen(
            student: student,
          ));
        } else if (route == HocDuongRoutes.thongTinSucKhoe) {
          Get.to(() => TeacherThongTinSucKhoeHocSinhScreen(student: student));
        } else if (route == HocDuongRoutes.lichSuNhanXet) {
          Get.to(() => TeacherLichSuNhanXetScreen(
            studentName: student.studentProfile.name,
            imageUrl: student.studentDocument.image,
            guardianID: student.studentProfile.studentID,
            studentID: student.studentProfile.studentID,
            teacherID: accountRepo.userId!,
            onAddComment: (String guardianID, String teacherID, String comment) {
              nhanxetController.addComment(guardianID, teacherID, comment);
              print("NHAN NHAN XET: $comment cho học sinh ID: ${student.studentProfile.studentID}");
            },
          ));
        } else if (route == HocDuongRoutes.chuyenCan) {
          Get.to(()=>TeacherChuyenCanHocSinhScreen(
              student: student
          ));
        }
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
}