import 'package:flutter/material.dart';

class ThongTinHocSinhPhuHuynhScreen extends StatefulWidget {
  @override
  _ThongTinHocSinhPhuHuynhScreenState createState() => _ThongTinHocSinhPhuHuynhScreenState();
}

class _ThongTinHocSinhPhuHuynhScreenState extends State<ThongTinHocSinhPhuHuynhScreen> {
  final TextEditingController _controllerHoTen = TextEditingController();
  final TextEditingController _controllerNgaySinh = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerGioiTinh = TextEditingController();
  final TextEditingController _controllerNgheNghiep = TextEditingController();
  final TextEditingController _controllerSoDienThoai = TextEditingController();
  final TextEditingController _controllerDiaChi = TextEditingController();
  final TextEditingController _controllerTonGiao = TextEditingController();
  final TextEditingController _controllerDanToc = TextEditingController();

  // Thông tin học sinh không cần TextEditingController vì không chỉnh sửa
  final String _hoTenHocsinh = "Nguyễn Văn An";
  final String _maHocsinh = "2111001";
  final String _lop = "Bambo 01";

  @override
  Widget build(BuildContext context) {
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
              Text(
                "Thông tin phụ huynh",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildEditableField("Họ và tên", _controllerHoTen, "Nguyễn Văn Binh"),
              SizedBox(height: 16),
              _buildEditableField("Ngày sinh", _controllerNgaySinh, "1/1/1977"),
              SizedBox(height: 16),
              _buildEditableField("Email", _controllerEmail, "nguyenvanbinh@gmail.com"),
              SizedBox(height: 16),
              _buildEditableField("Giới tính", _controllerGioiTinh, "Nam"),
              SizedBox(height: 16),
              _buildEditableField("Nghề nghiệp", _controllerNgheNghiep, "Nông"),
              SizedBox(height: 16),
              _buildEditableField("Số điện thoại", _controllerSoDienThoai, "0123456789"),
              SizedBox(height: 16),
              _buildEditableField("Địa chỉ", _controllerDiaChi, "1 Vố Văn Ngân, Thủ Đức, TP.HCM"),
              SizedBox(height: 16),
              _buildEditableField("Tôn giáo", _controllerTonGiao, "Phật giáo"),
              SizedBox(height: 16),
              _buildEditableField("Dân tộc", _controllerDanToc, "Kinh"),
              SizedBox(height: 40), // Khoảng cách trước phần thông tin học sinh

              // Phần thông tin học sinh
              Text(
                "Thông tin học sinh",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildStudentInfoField("Họ và tên", _hoTenHocsinh),
              SizedBox(height: 16),
              _buildStudentInfoField("Mã học sinh", _maHocsinh),
              SizedBox(height: 16),
              _buildStudentInfoField("Lớp", _lop),
              SizedBox(height: 40),

              // Button Cập nhật thông tin
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý cập nhật thông tin ở đây
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0B2384), // Màu nền
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    child: Text(
                      "Cập nhật thông tin",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller, String hint) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6E8E8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 16)),
            TextField(
              controller: controller,
              style: TextStyle(fontSize: 14),
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
        color: Color(0xFFE4E4E4), // Màu nền khác cho thông tin học sinh
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 16)),
            Text(
              value,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}