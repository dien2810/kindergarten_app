import 'package:flutter/material.dart';

import '../../../../../constants/text_strings.dart';

class StudentInfoWidget extends StatelessWidget {
  const StudentInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoContainer(tHoTen),
          _buildInfoContainer(tMaHocSinh),
          _buildInfoContainer(tNgaySinh),
          _buildInfoContainer(tGioiTinh),
          _buildInfoContainer(tTruong),
          _buildInfoContainer(tHe),
          _buildInfoContainer(tKhoi),
          _buildInfoContainer(tLop),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(String text) {
    return Container(
      width: 500, // Đặt chiều rộng cố định
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), // Màu nền
        borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)), // Màu chữ tùy chỉnh
      ),
    );
  }
}
