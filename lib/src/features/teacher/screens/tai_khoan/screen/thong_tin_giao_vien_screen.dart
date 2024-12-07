import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/tai_khoan/tai_khoan_controller.dart';

class TeacherThongTinScreen extends StatefulWidget {
  const TeacherThongTinScreen({super.key});

  @override
  _TeacherThongTinScreenState createState() => _TeacherThongTinScreenState();
}

class _TeacherThongTinScreenState extends State<TeacherThongTinScreen> {
  @override
  Widget build(BuildContext context) {
    final taiKhoanController = Get.put(TeacherTaiKhoanController());
    taiKhoanController.getThongTinGiaoVienPageData();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            "Thông tin Giáo viên",
            style: TextStyle(
              color: Color(0xFFF9BD3A),
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tiêu đề thông tin phụ huynh
              const Text(
                "Thông tin Giáo viên",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildEditableField("Họ", taiKhoanController.controllerHo, taiKhoanController.controllerHo.text),
              const SizedBox(height: 16),
              _buildEditableField("Tên", taiKhoanController.controllerTen, taiKhoanController.controllerTen.text),
              const SizedBox(height: 16),
              _buildEditableField("Ngày sinh", taiKhoanController.controllerNgaySinh, taiKhoanController.controllerNgaySinh.text),
              const SizedBox(height: 16),
              _buildEditableField("Giới tính", taiKhoanController.controllerGioiTinh, taiKhoanController.controllerGioiTinh.text),
              const SizedBox(height: 16),
              _buildEditableField("Số điện thoại", taiKhoanController.controllerSoDienThoai, taiKhoanController.controllerSoDienThoai.text),
              const SizedBox(height: 40), // Khoảng cách trước phần thông tin học sinh

              // // Phần thông tin học sinh
              // const Text(
              //   "Thông tin học sinh",
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(height: 20),
              // _buildStudentInfoField("Họ và tên", taiKhoanController.hoTenHocSinh),
              // const SizedBox(height: 16),
              // _buildStudentInfoField("Mã học sinh", taiKhoanController.maHocSinh),
              // const SizedBox(height: 16),
              // _buildStudentInfoField("Lớp", taiKhoanController.lop),
              // const SizedBox(height: 40),

              // Button Cập nhật thông tin
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý cập nhật thông tin ở đây
                    taiKhoanController.updateThongTinGiaoVien();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B2384), // Màu nền
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Text(
                      "Cập nhật thông tin",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller, String hint) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6E8E8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 16)),
            TextField(
              controller: controller,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentInfoField(String label, String value) {
    return Container(
      width: double.infinity, // Đặt chiều rộng bằng với thiết bị
      decoration: BoxDecoration(
        color: const Color(0xFFE4E4E4), // Màu nền khác cho thông tin học sinh
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 16)),
            Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}