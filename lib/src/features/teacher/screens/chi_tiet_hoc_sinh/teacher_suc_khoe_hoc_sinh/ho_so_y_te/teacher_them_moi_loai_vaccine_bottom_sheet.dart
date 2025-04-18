import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';

import '../../../../../../utils/helper_controller/helper_controller.dart';
import '../../../../controllers/suc_khoe_hoc_sinh/teacher_suc_khoe_hoc_sinh_controller.dart';

class TeacherThemMoiLoaiVaccineBottomSheet extends StatelessWidget {
  final TeacherSucKhoeHocSinhController controller;
  final BuildContext context;

  const TeacherThemMoiLoaiVaccineBottomSheet({super.key, required this.controller, required this.context});

  @override
  Widget build(BuildContext context) {
    final TextEditingController tenVaccineController = TextEditingController();
    final TextEditingController moTaVaccineController = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 12,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 750,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Căn trái các thành phần
            children: [
              // Title header, căn giữa
              const Text(
                tThemMoiLoaiVaccine,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7209B7), // Màu chữ header
                ),
                textAlign: TextAlign.center, // Căn giữa tiêu đề
              ),
              const SizedBox(height: 16), // space after title
              // Text for vaccine name
              const Text(
                tTenLoaiVaccine,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600, // Làm đậm chữ mô tả
                  color: Color(0xFF580B8B), // Màu chữ
                ),
              ),
              const SizedBox(height: 8), // space after label
              // Textfield for vaccine name
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2E9F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: tenVaccineController,
                  decoration: const InputDecoration(
                    hintText: tNhapTenLoaiVaccine,
                    hintStyle: TextStyle(
                      color: Color(0xFF7B7B7B),
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16), // Kiểu chữ mặc định
                ),
              ),
              const SizedBox(height: 16), // space after vaccine name textfield
              // Text for vaccine description
              const Text(
                tMoTaLoaiVaccine,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600, // Làm đậm chữ mô tả
                  color: Color(0xFF580B8B), // Màu chữ
                ),
              ),
              const SizedBox(height: 8), // space after label
              // Textfield for vaccine description
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2E9F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: moTaVaccineController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: tNhapMoTaLoaiVaccine,
                    hintStyle: TextStyle(
                      color: Color(0xFF7B7B7B),
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16), // Kiểu chữ mặc định
                ),
              ),
              const SizedBox(height: 16), // space after vaccine description textfield
              // Row for Add and Cancel buttons, căn đều
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Căn đều các nút
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final BuildContext currentContext = context; // Lưu context trước await
                        String tenVaccine = tenVaccineController.text;
                        String moTaVaccine = moTaVaccineController.text;
                        await controller.addNewVaccine(tenVaccine, moTaVaccine);
                        Helper.successSnackBar(title: tDaThemThanhCong, message: "$tDaThemVaccine $tenVaccine $tthanhCong");
                        if (currentContext.mounted) {
                          Navigator.of(currentContext).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF99D98C), // Màu nút Thêm mới
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 60), // Kích thước nút
                      ),
                      child: const Text(
                        tThemMoi,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Kích thước chữ nút Thêm mới
                        ),
                      ),
                    ),
                    // Cancel button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Đóng BottomSheet
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFA983), // Màu nút Hủy
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 60), // Kích thước nút
                      ),
                      child: const Text(
                        tHuy,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Kích thước chữ nút Hủy
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
