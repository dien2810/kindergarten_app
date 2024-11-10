import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import '../../../controllers/student_document_controller.dart';

class StudentDocumentWidget extends StatelessWidget {
  const StudentDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentDocumentController controller = Get.put(StudentDocumentController());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDocumentField(tHoTenCha),
          _buildDocumentField(tHoTenMe),
          _buildDocumentField(tNgheNghiepCuaCha),
          _buildDocumentField(tNgheNghiepCuaMe),
          GestureDetector(
            onTap: () => controller.pickImage('photo4x6'),
            child: Obx(() => _buildDocumentField(
              "$tAnhHocSinh ${controller.hasPhoto4x6.value ? tDaNop : tBamVaoDeNop}",
              textColor: controller.hasPhoto4x6.value ? Colors.green : Colors.red,  // Đổi màu thành đỏ
            )),
          ),
          GestureDetector(
            onTap: () => controller.pickImage('birthCertificate'),
            child: Obx(() => _buildDocumentField(
              "$tAnhGiayKhaiSinh ${controller.hasBirthCertificate.value ? tDaNop : tBamVaoDeNop}",
              textColor: controller.hasBirthCertificate.value ? Colors.green : Colors.red,  // Đổi màu thành đỏ
            )),
          ),
          GestureDetector(
            onTap: () => controller.pickImage('householdRegistration'),
            child: Obx(() => _buildDocumentField(
              "$tAnhSoHoKhau ${controller.hasHouseholdRegistration.value ? tDaNop : tBamVaoDeNop}",
              textColor: controller.hasHouseholdRegistration.value ? Colors.green : Colors.red,  // Đổi màu thành đỏ
            )),
          ),
        ],
      ),
    );
  }

  // Hàm để tạo khung cho từng dòng văn bản
  Widget _buildDocumentField(String text, {Color textColor = const Color(0xFF505050)}) {  // Màu chữ mặc định là #505050
    return Container(
      width: 500,  // Chiều rộng cố định
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),  // Khoảng cách giữa các container
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),  // Màu nền khung
        borderRadius: BorderRadius.circular(8),  // Bo góc cho container
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: textColor),
        softWrap: true,  // Đảm bảo văn bản tự xuống dòng nếu cần
      ),
    );
  }
}
