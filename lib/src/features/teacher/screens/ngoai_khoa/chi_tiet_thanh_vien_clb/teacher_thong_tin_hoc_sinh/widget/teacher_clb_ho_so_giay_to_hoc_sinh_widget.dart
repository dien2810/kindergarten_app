import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thong_tin_hoc_sinh/teacher_thong_tin_hoc_sinh_controller.dart';

class TeacherClbHoSoGiayToHocSinhWidget extends StatelessWidget {
  final StudentRecord studentRecord; // Biến cho đối tượng hồ sơ

  const TeacherClbHoSoGiayToHocSinhWidget({super.key, required this.studentRecord});

  @override
  Widget build(BuildContext context) {
    final TeacherThongTinHocSinhController controller = Get.put(TeacherThongTinHocSinhController());

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEditableDocumentField(tHoTenCha, studentRecord.hoTenCha),
            _buildEditableDocumentField(tHoTenMe, studentRecord.hoTenMe),
            _buildEditableDocumentField(tNgheNghiepCuaCha, studentRecord.ngheNghiepCuaCha),
            _buildEditableDocumentField(tNgheNghiepCuaMe, studentRecord.ngheNghiepCuaMe),
            _buildEditableDocumentField(tSoDienThoai, studentRecord.soDienThoai),
            _buildEditableDocumentField(tDiaChiEmail, studentRecord.diaChiEmail),
            _buildEditableDocumentField(tDiaChiThuongTru, studentRecord.diaChiThuongTru),
          ],
        ),
      ),
    );
  }

  // Hàm để tạo khung có thể chỉnh sửa
  Widget _buildEditableDocumentField(String label, String initialText) {
    final textController = TextEditingController(text: initialText);
    final hintText = "Nhập $label"; // Tạo biến gợi ý

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label, // Hiển thị tên thuộc tính
            style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
          ),
          TextField(
            controller: textController,
            style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintText: hintText, // Sử dụng biến gợi ý
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

  // Hàm tạo khung cho văn bản tĩnh
  Widget _buildDocumentField(String text, {Color textColor = const Color(0xFF505050)}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: textColor),
        softWrap: true,
      ),
    );
  }
}