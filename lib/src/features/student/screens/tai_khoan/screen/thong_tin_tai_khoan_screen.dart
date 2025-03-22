import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/controllers/tai_khoan/tai_khoan_controller.dart';

class ThongTinTaiKhoanScreen extends StatefulWidget {
  const ThongTinTaiKhoanScreen({super.key});

  @override
  _ThongTinTaiKhoanScreenState createState() => _ThongTinTaiKhoanScreenState();
}

class _ThongTinTaiKhoanScreenState extends State<ThongTinTaiKhoanScreen> {
  bool _obscurePassword = true;
  final taiKhoanController = Get.put(TaiKhoanController());

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
          child: FutureBuilder(
            future: taiKhoanController.getAccountDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              else if (!snapshot.hasData || snapshot.data == null) {
                return const Center(child: Text('Không có dữ liệu.'));
              }
              final account = snapshot.data;
              taiKhoanController.passwordController.text = account!.password;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // Khoảng cách từ header xuống
                  _buildInfoField("Tài khoản", account.username),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6E8E8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Mật khẩu", style: TextStyle(fontSize: 16)),
                          TextField(
                            controller: taiKhoanController.passwordController,
                            obscureText: _obscurePassword,
                            style: const TextStyle(fontSize: 14), // Kích thước chữ cho mật khẩu nhỏ hơn
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
                  ),
                  const SizedBox(height: 16),
                  _buildInfoField("Email", taiKhoanController.guardian.email),
                  const SizedBox(height: 16),
                  _buildInfoField("Số điện thoại", account.phoneNo),
                  const SizedBox(height: 260), // Khoảng cách trước nút
                  _buildChangePasswordButton(),
                  const SizedBox(height: 20), // Khoảng cách dưới cùng
                ],
              );
            }
          ),
        ),
      ),
    );
  }
  Widget _buildInfoField(String label, String hint) {
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
              readOnly: true,
              style: const TextStyle(fontSize: 14), // Kích thước chữ cho dữ liệu nhỏ hơn
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

  Widget _buildChangePasswordButton() {
    return ElevatedButton(
      onPressed: () => _showChangePasswordBottomSheet(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0B2384), // Màu nền nút
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: const Center(
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
  final taiKhoanController = Get.put(TaiKhoanController());
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
                const SizedBox(height: 20),
                TextField(
                  controller: taiKhoanController.nhapMatKhauCu,
                  decoration: InputDecoration(
                    labelText: "Nhập mật khẩu cũ",
                    hintText: "Mật khẩu cũ",
                    hintStyle: const TextStyle(fontSize: 12), // Giảm kích thước chữ hint
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: taiKhoanController.nhapMatKhauMoi,
                  decoration: InputDecoration(
                    labelText: "Nhập mật khẩu mới",
                    hintText: "Mật khẩu mới",
                    hintStyle: const TextStyle(fontSize: 12), // Giảm kích thước chữ hint
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: taiKhoanController.nhapLaiMatKhauMoi,
                  decoration: InputDecoration(
                    labelText: "Nhập lại mật khẩu mới",
                    hintText: "Mật khẩu mới",
                    hintStyle: const TextStyle(fontSize: 12), // Giảm kích thước chữ hint
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0B2384),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // Xử lý đổi mật khẩu
                          taiKhoanController.changePassword();
                        },
                        child: const Text("Đổi mật khẩu", style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF39647F),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Hủy", style: TextStyle(fontSize: 16, color: Colors.white)),
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
