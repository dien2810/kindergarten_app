import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/controllers/tai_khoan/tai_khoan_controller.dart';

class ThongTinHocSinhPhuHuynhScreen extends StatefulWidget {
  const ThongTinHocSinhPhuHuynhScreen({super.key});

  @override
  _ThongTinHocSinhPhuHuynhScreenState createState() => _ThongTinHocSinhPhuHuynhScreenState();
}

class _ThongTinHocSinhPhuHuynhScreenState extends State<ThongTinHocSinhPhuHuynhScreen> {
  @override
  Widget build(BuildContext context) {
    final taiKhoanController = Get.put(TaiKhoanController());
    taiKhoanController.getThongTinPhuHuynhPageData();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            "Thông tin phụ huynh / Giám hộ",
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
                "Thông tin phụ huynh",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildEditableField("Họ và tên", taiKhoanController.controllerHoTen, "Nguyễn Văn Binh"),
              const SizedBox(height: 16),
              _buildEditableField("Ngày sinh", taiKhoanController.controllerNgaySinh, "1/1/1977"),
              const SizedBox(height: 16),
              _buildEditableField("Email", taiKhoanController.controllerEmail, "nguyenvanbinh@gmail.com"),
              const SizedBox(height: 16),
              _buildEditableField("Giới tính", taiKhoanController.controllerGioiTinh, "Nam"),
              const SizedBox(height: 16),
              _buildEditableField("Nghề nghiệp", taiKhoanController.controllerNgheNghiep, "Nông"),
              const SizedBox(height: 16),
              _buildEditableField("Số điện thoại", taiKhoanController.controllerSoDienThoai, "0123456789"),
              const SizedBox(height: 16),
              _buildEditableField("Địa chỉ", taiKhoanController.controllerDiaChi, "1 Vố Văn Ngân, Thủ Đức, TP.HCM"),
              const SizedBox(height: 16),
              _buildEditableField("Tôn giáo", taiKhoanController.controllerTonGiao, "Phật giáo"),
              const SizedBox(height: 16),
              _buildEditableField("Dân tộc", taiKhoanController.controllerDanToc, "Kinh"),
              const SizedBox(height: 40), // Khoảng cách trước phần thông tin học sinh

              // Phần thông tin học sinh
              const Text(
                "Thông tin học sinh",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildStudentInfoField("Họ và tên", taiKhoanController.hoTenHocSinh),
              const SizedBox(height: 16),
              _buildStudentInfoField("Mã học sinh", taiKhoanController.maHocSinh),
              const SizedBox(height: 16),
              _buildStudentInfoField("Lớp", taiKhoanController.lop),
              const SizedBox(height: 40),

              // Button Cập nhật thông tin
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý cập nhật thông tin ở đây
                    taiKhoanController.updateThongTinPhuHuynh();
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