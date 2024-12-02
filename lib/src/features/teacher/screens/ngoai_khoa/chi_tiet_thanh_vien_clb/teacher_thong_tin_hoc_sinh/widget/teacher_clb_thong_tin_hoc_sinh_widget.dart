import 'package:flutter/material.dart';

import '../../../../../../../constants/text_strings.dart';
import '../../../../../controllers/thong_tin_hoc_sinh/teacher_thong_tin_hoc_sinh_controller.dart';


class TeacherClbThongTinHocSinhWidget extends StatelessWidget {
  final StudentInfo studentInfo; // Thêm biến cho đối tượng thông tin học sinh

  const TeacherClbThongTinHocSinhWidget({super.key, required this.studentInfo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEditableInfoContainer(tHoTen, studentInfo.hoTen),
            _buildEditableInfoContainer(tMaHocSinh, studentInfo.maHocSinh),
            _buildEditableInfoContainer(tNgaySinh, studentInfo.ngaySinh),
            _buildEditableInfoContainer(tGioiTinh, studentInfo.gioiTinh),
            _buildEditableInfoContainer(tTruong, studentInfo.truong),
            _buildEditableInfoContainer(tHe, studentInfo.he),
            _buildEditableInfoContainer(tKhoi, studentInfo.khoi),
            _buildEditableInfoContainer(tLop, studentInfo.lop),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableInfoContainer(String label, String initialText) {
    final textController = TextEditingController(text: initialText);

    return Container(
      width: double.infinity, // Chiều rộng toàn màn hình
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), // Màu nền
        borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các widget trong cột
        children: [
          Text(
            label, // Hiển thị label
            style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
          ),
          TextField(
            controller: textController,
            style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
            decoration: InputDecoration(
              border: InputBorder.none, // Loại bỏ viền
              isDense: true, // Giảm padding mặc định
              hintText: "Nhập $label", // Gợi ý nhập
              hintStyle: const TextStyle(color: Colors.grey), // Màu của hint text
            ),
            maxLines: null, // Cho phép nhiều dòng
            minLines: 1, // Ít nhất 1 dòng
            onChanged: (value) {
              // Xử lý khi nội dung thay đổi
              print("Nội dung mới: $value");
            },
          ),
        ],
      ),
    );
  }
}