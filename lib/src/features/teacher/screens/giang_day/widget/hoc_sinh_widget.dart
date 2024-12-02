import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/nhan_xet_hoc_sinh/teacher_nhan_xet_hoc_sinh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/giang_day/widget/chi_tiet_hoc_sinh_bottom_sheet.dart';

import '../../../controllers/nhan_xet_hoc_sinh/teacher_nhan_xet_hoc_sinh_controller.dart'; // Import the ChiTietHocSinhBottomSheet

class HocSinhWidget extends StatelessWidget {
  // Khai báo tham số cho constructor
  final String imageUrl;
  final String tenHocSinh;

  const HocSinhWidget({
    Key? key,
    required this.imageUrl,
    required this.tenHocSinh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TeacherThongTinNhanxetController  nhanxetController= Get.put(TeacherThongTinNhanxetController());
    return GestureDetector(
      onTap: () {
        // Hành động khi nhấn nút
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            // Pass both imageUrl and tenHocSinh to ChiTietHocSinhBottomSheet
            return ChiTietHocSinhBottomSheet(
              studentName: tenHocSinh,
              imageUrl: imageUrl,
              commentData: nhanxetController.commentData, // Use data from the controller
            );
          },
        );
      },
      child: Container(
        width: 170,
        height: 205,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white, // Màu nền tổng thể của widget
          borderRadius: BorderRadius.circular(16.0), // Bo góc cho viền widget
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Màu shadow
              blurRadius: 8.0, // Độ mờ của shadow
              offset: const Offset(0, 4), // Vị trí shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Ảnh trong khung hình tròn
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: CircleAvatar(
                  radius: 60, // Kích thước hình tròn
                  backgroundImage: AssetImage(imageUrl), // Ảnh từ asset
                ),
              ),
            ),
            // Tên học sinh trong khung nền màu #34053A
            Container(
              width: double.infinity,
              height: 62.0, // Chiều cao cố định cho khung tên
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              decoration: const BoxDecoration(
                color: Color(0xFF34053A), // Màu nền khung tên
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ), // Bo góc cho khung tên
              ),
              child: Text(
                tenHocSinh.length > 70 ? '${tenHocSinh.substring(0, 70)}...' : tenHocSinh,
                style: const TextStyle(
                  fontSize: 16.0, // Font chữ lớn hơn
                  fontWeight: FontWeight.bold, // Đậm hơn để rõ nét
                  color: Colors.white, // Màu chữ
                ),
                textAlign: TextAlign.center, // Căn giữa chữ trong khung
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
