import 'package:flutter/material.dart';

class ThongTinTaiKhoanScreen extends StatefulWidget {
  @override
  _ThongTinTaiKhoanScreenState createState() => _ThongTinTaiKhoanScreenState();
}

class _ThongTinTaiKhoanScreenState extends State<ThongTinTaiKhoanScreen> {
  bool _obscurePassword = true; // Biến để kiểm soát hiển thị mật khẩu
  final TextEditingController _passwordController = TextEditingController(text: "12345678"); // Mật khẩu mẫu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            "Thông tin tài khoản",
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
      body: SingleChildScrollView( // Thêm SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // Khoảng cách từ header xuống
              _buildInfoField("Tài khoản", "parents"),
              SizedBox(height: 16),
              _buildPasswordField(),
              SizedBox(height: 16),
              _buildInfoField("Email", "nguyenvanbinh@gmail.com"),
              SizedBox(height: 16),
              _buildInfoField("Số điện thoại", "0123456789"),
              SizedBox(height: 260), // Khoảng cách trước nút
              _buildChangePasswordButton(),
              SizedBox(height: 20), // Khoảng cách dưới cùng
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildInfoField(String label, String hint) {
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
              readOnly: true,
              style: TextStyle(fontSize: 14), // Kích thước chữ cho dữ liệu nhỏ hơn
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

  Widget _buildPasswordField() {
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
            Text("Mật khẩu", style: TextStyle(fontSize: 16)),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              style: TextStyle(fontSize: 14), // Kích thước chữ cho mật khẩu nhỏ hơn
              decoration: InputDecoration(
                hintText: "**********",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword; // Đổi trạng thái
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChangePasswordButton() {
    return ElevatedButton(
      onPressed: () => _showChangePasswordBottomSheet(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0B2384), // Màu nền nút
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
      ),
      child: Center(
        child: Text(
          "Đổi mật khẩu",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
void _showChangePasswordBottomSheet(BuildContext context) {
  double keyboardHeight = MediaQuery.of(context).viewInsets.bottom; // Lấy chiều cao bàn phím

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SingleChildScrollView(
          child: Container(
            // Điều chỉnh chiều cao Bottom Sheet
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 300, // Giảm chiều cao để tránh bàn phím
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "ĐỔI MẬT KHẨU",
                    style: TextStyle(
                      color: Color(0xFFF9BD3A),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField("Nhập mật khẩu cũ", "Mật khẩu cũ"),
                SizedBox(height: 16),
                _buildTextField("Nhập mật khẩu mới", "Mật khẩu mới"),
                SizedBox(height: 16),
                _buildTextField("Nhập lại mật khẩu mới", "Mật khẩu mới"),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0B2384),
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // Xử lý đổi mật khẩu
                          Navigator.pop(context); // Đóng Bottom Sheet
                        },
                        child: Text("Đổi mật khẩu", style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF39647F),
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text("Hủy", style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
Widget _buildTextField(String label, String hint) {
  return TextField(
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      hintStyle: TextStyle(fontSize: 12), // Giảm kích thước chữ hint
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    obscureText: true,
  );
}
