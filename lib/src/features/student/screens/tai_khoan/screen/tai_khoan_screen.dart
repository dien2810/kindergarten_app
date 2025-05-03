import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/tai_khoan/screen/huong_dan_su_dung_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/tai_khoan/screen/thong_tin_hoc_sinh_phu_huynh_screen.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../authentication/controllers/login_controller.dart';
import 'thong_tin_tai_khoan_screen.dart';

class TaiKhoanScreen extends StatelessWidget {
  final String urlAvatar = "";

  const TaiKhoanScreen({super.key}); // URL avatar có thể là chuỗi rỗng

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Header với ảnh nền
          Container(
            height: 900,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tTaiKhoanGuargianHeader),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Card
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            bottom: 0,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 80),
                    // Button List
                    Column(
                      children: [
                        _buildButton(Icons.account_circle, "Thông tin tài khoản", context),
                        _buildButton(Icons.school, "Thông tin Học sinh/Phụ huynh/Giám hộ", context),
                        _buildButton(Icons.help, "Hướng dẫn sử dụng", context),
                        _buildButton(Icons.logout, "Đăng xuất", context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Avatar nằm trên Card
          Positioned(
            top: 150,
            left: MediaQuery.of(context).size.width / 2 - 55,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: urlAvatar.isNotEmpty
                  ? NetworkImage(urlAvatar)
                  : const AssetImage(tTaiKhoanAvatarThayThe) as ImageProvider,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          if (text == "Thông tin tài khoản") {
            // Chuyển hướng đến màn hình thông tin tài khoản
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThongTinTaiKhoanScreen()),
            );
          } else if (text == "Thông tin Học sinh/Phụ huynh/Giám hộ") {
            // Chuyển hướng đến màn hình thông tin học sinh/phụ huynh
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThongTinHocSinhPhuHuynhScreen()),
            );
          }else if (text == "Hướng dẫn sử dụng") {
            // Chuyển hướng đến màn hình thông tin học sinh/phụ huynh
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HuongDanSuDungScreen()),
            );
          }
          else if (text == "Đăng xuất"){
            final loginController = Get.put(LoginController());
            loginController.signOut();
          }
          // Các hành động khác cho các button khác có thể được thực hiện ở đây
        },
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}