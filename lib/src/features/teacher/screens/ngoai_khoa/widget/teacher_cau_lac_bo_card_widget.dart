import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/features/teacher/screens/ngoai_khoa/screen/teacher_danh_sach_thanh_vien_clb_screen.dart';

import '../../../../student/models/club/club_model.dart';

class TeacherCauLacBoCardWidget extends StatelessWidget {
  final ClubModel club; // Nhận club model

  const TeacherCauLacBoCardWidget({
    super.key,
    required this.club,
  });

  @override
  Widget build(BuildContext context) {
    // Lấy chiều rộng của thiết bị
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Chuyển sang trang danh sách học sinh
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeacherDanhSachThanhVienClbScreen(
              clubID: club.id ?? "Unknown Club ID", // Đảm bảo clubID không null
            ),
          ),
        );
      },
      child: Container(
        width: screenWidth, // Đặt chiều rộng của card bằng chiều rộng thiết bị
        margin: const EdgeInsets.symmetric(vertical: 8.0), // Khoảng cách giữa các card
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: const Color(0xFFB5179E), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  club.clubName,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7209B7),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFB5179E),
                  size: 20.0,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Ngày khai giảng: ${club.openingDay}',
              style: const TextStyle(
                color: Color(0xFFB5179E),
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Số lượng: ${club.capacity} học sinh',
              style: const TextStyle(
                color: Color(0xFFB5179E),
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Địa điểm: ${club.room}',
              style: const TextStyle(
                color: Color(0xFFB5179E),
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
