import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/tai_khoan/screen/thong_tin_giao_vien_screen.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_1.dart';
import '../../../../../common_widgets/cloud_image/circle_cloud_image_widget.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../authentication/controllers/login_controller.dart';
import 'huong_dan_su_dung_screen.dart';
import 'thong_tin_tai_khoan_screen.dart';

class TeacherTaiKhoanScreen extends StatelessWidget {
  final String urlAvatar = "";

  const TeacherTaiKhoanScreen({super.key}); // URL avatar có thể là chuỗi rỗng

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader1(),
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
            top: t100Size,
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
                    const SizedBox(height: 80),
                    // Button List
                    Column(
                      children: [
                        _buildButton(Icons.account_circle, "Thông tin tài khoản", context),
                        _buildButton(Icons.school, "Thông tin Giáo viên", context),
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
            top: t20Size,
            left: MediaQuery.of(context).size.width / 3,
            child: const CircleAvatar(
              radius: 80, // Kích thước hình tròn
              child: ClipOval(
                child: CircleCloudImageWidget(
                  publicId: 'https://res.cloudinary.com/dv0ehr5z7/image/upload/v1746253986/htv9zhyitvzkyfp8woi1.jpg',
                  fit: true
                ),
              ),
              // backgroundImage: AssetImage(imageUrl), // Ảnh từ asset
            ),
            // child: CircleAvatar(
            //   radius: 60,
            //   backgroundImage: urlAvatar.isNotEmpty
            //       ? NetworkImage(urlAvatar)
            //       : const AssetImage(tTaiKhoanAvatarThayThe) as ImageProvider,
            // ),
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
              MaterialPageRoute(builder: (context) => const TeacherThongTinTaiKhoanScreen()),
            );
          } else if (text == "Thông tin Giáo viên") {
            // Chuyển hướng đến màn hình thông tin học sinh/phụ huynh
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TeacherThongTinScreen()),
            );
          }else if (text == "Hướng dẫn sử dụng") {
            // Chuyển hướng đến màn hình thông tin học sinh/phụ huynh
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TeacherHuongDanSuDungScreen()),
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