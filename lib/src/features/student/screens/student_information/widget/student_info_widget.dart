import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/controllers/thong_tin_hoc_sinh/thong_tin_hoc_sinh_controller.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class StudentInfoWidget extends StatelessWidget {
  const StudentInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final thongTinHocSinhController = Get.put(ThongTinHocSinhController());
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoContainer(tHoTen, thongTinHocSinhController.hoTen),
            _buildInfoContainer(tMaHocSinh, thongTinHocSinhController.maHocSinh),
            _buildInfoContainer(tNgaySinh, thongTinHocSinhController.ngaySinh),
            _buildInfoContainer(tGioiTinh, thongTinHocSinhController.gioiTinh),
            _buildInfoContainer(tTruong, thongTinHocSinhController.truong),
            _buildInfoContainer(tHe, thongTinHocSinhController.he),
            _buildInfoContainer(tKhoi, thongTinHocSinhController.khoi),
            _buildInfoContainer(tLop, thongTinHocSinhController.lop),
            SizedBox(height: t5Size),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: t10Size*20,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF03045E),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent
                    ),
                    onPressed: () {},
                    child: const Text(
                      tCapNhat,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Outfit",
                          color: tWhiteColor
                      ),
                    ),
                  ),
                ),
              ),
            ),
        
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContainer(String text, TextEditingController textController) {
    return Container(
      width: t100Size*4, // Đặt chiều rộng cố định
      padding: EdgeInsets.all(t10Size),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), // Màu nền
        borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
            ),
          ),
          Expanded(
            flex: 5,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                border: InputBorder.none
              ),
              style: const TextStyle(fontSize: 16, color: Color(0xFF505050)), // Màu chữ tùy chỉnh
            ),
          ),
        ],
      ),
    );
  }
}
