import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/image_strings.dart';
import 'package:kindergarten_app/src/features/teacher/routes/hoc_duong_route.dart';
import 'package:kindergarten_app/src/features/teacher/screens/dan_thuoc/screen/teacher_dan_thuoc_screen.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_1.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/teacher_navigation_menu_controller.dart';
import '../../giang_day/screen/teacher_giang_day_screen.dart';
import '../../ngoai_khoa/screen/teacher_ngoai_khoa_screen.dart';
import '../../teacher_navigation_menu/teacher_bottom_navigation_bar_widget.dart';
import '../../thuc_don/screen/teacher_thuc_don_screen.dart';


class HocDuongScreen extends StatelessWidget {
  const HocDuongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherNavigationMenuController = Get.put(TeacherNavigationMenuController());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader1(), // Giữ lại Header 1
        body: SingleChildScrollView(  // Dùng SingleChildScrollView để cuộn nếu không gian không đủ
          child: Column(
            children: [
              SizedBox(height: t15Size),

              // Thêm Text "Chức năng"
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Chức năng",
                  style: TextStyle(
                    fontSize: 26,
                    color: Color(0xFF7209B7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20),  // Khoảng cách giữa text và box chứa button

              // Box chứa các button với bo góc và shadow
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, -3), // Shadow position
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width, // Kéo dài box ra hết chiều rộng thiết bị
                  height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - kBottomNavigationBarHeight - 32, // Điều chỉnh chiều cao theo thiết bị
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // GridView chứa các button hình vuông
                      Expanded(
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          children: [
                            _buildIconButton(tThucDonScreenLinkIcon, "Thực đơn", () {
                              Get.to(TeacherThucDonScreen());  // Đổi link cho màn hình thực đơn
                            }),
                            _buildIconButton(tGiangDayScreenLinkIcon, "Giảng dạy", () {
                              Get.to(TeacherGiangDayScreen());  // Đổi link cho màn hình giảng dạy
                            }),
                            _buildIconButton(tNgoaiKhoaScreenLinkIcon, "Ngoại khóa", () {
                              Get.to(TeacherNgoaiKhoaScreen());  // Đổi link cho màn hình ngoại khóa
                            }),
                            _buildIconButton(tDanThuocScreenLinkIcon, "Dặn thuốc", () {
                              Get.to(TeacherDanThuocScreen());  // Đổi link cho màn hình dặn thuốc
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm tạo button hình vuông với icon và text mô tả, với hiệu ứng khi nhấn
  Widget _buildIconButton(String assetPath, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10), // Đảm bảo hiệu ứng không bị cắt
      splashColor: Colors.green.withOpacity(0.9), // Màu hiệu ứng khi nhấn
      highlightColor: Colors.blue.withOpacity(0.9), // Màu khi nhấn lâu
      child: AnimatedScale(
        duration: Duration(milliseconds: 200),  // Thời gian hiệu ứng phóng to
        scale: 1.0,  // Tỷ lệ ban đầu
        onEnd: () {
          // Bạn có thể thêm hiệu ứng phóng to hoặc thu nhỏ tùy thuộc vào logic của bạn
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Căn giữa cả button và text
          children: [
            Container(
              width: 120, // Đảm bảo kích thước 70x70
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFD9D9D9), // Màu nền cho button
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 6,
                    offset: Offset(2, 6), // Vị trí của shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),  // Khoảng cách giữa button và text
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
