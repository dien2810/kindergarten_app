import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/suc_khoe_hoc_sinh/teacher_suc_khoe_hoc_sinh_controller.dart';

import '../../../../../../constants/text_strings.dart';
import '../../../../../../utils/helper_controller/helper_controller.dart';

class TeacherThemMoiLieuTiemBottomSheet extends StatelessWidget {
  final TeacherSucKhoeHocSinhController controller;

  const TeacherThemMoiLieuTiemBottomSheet({super.key, required this.controller});

  Future<void> selectInjectionDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.ngayTiem.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != controller.ngayTiem.value) {
      controller.ngayTiem.value = picked;
    }
  }

  Future<void> selectNextInjectionDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.lieuTiemTiepTheo.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != controller.lieuTiemTiepTheo.value) {
      controller.lieuTiemTiepTheo.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController lieuLuongTiemController = TextEditingController();
    final TextEditingController viTriTiemController = TextEditingController();
    final TextEditingController nhaCungCapController = TextEditingController();
    final TextEditingController tacDungPhuController = TextEditingController();
    final TextEditingController tienTrinhTiemChungController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        // Thêm SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: t30Size,
            ),
            Center(
              child: Text(
                tThemMoiLieuTiemChungVaccine,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
            ),
            const SizedBox(height: 16),
        // Ngày tiêm
            const Text(
              tNgayTiem,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF580B8B),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => selectInjectionDate(context),
              child: Container(
                width: double.infinity, // Đặt chiều rộng là 100% để khung rộng đầy đủ
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2E9F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Căn giữa các phần tử
                  children: [
                    Obx(()=>Text(
                      DateFormat('dd-MM-yyyy').format(controller.ngayTiem.value),
                      style: const TextStyle(fontSize: 16),
                    )),
                    const Icon(
                      Icons.calendar_today, // Biểu tượng lịch
                      color: Colors.grey, // Màu của biểu tượng
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Liều lượng tiêm
            _buildTextField(tLieuLuongTiem, lieuLuongTiemController),
            const SizedBox(height: 16),
            // Vị trí tiêm
            _buildTextField(tViTriTiem, viTriTiemController),
            const SizedBox(height: 16),
            // Nhà cung cấp
            _buildTextField(tNhaCungCap, nhaCungCapController,
                isExpanded: false),
            const SizedBox(height: 16),
            // Tác dụng phụ
            _buildTextField(tTacDungPhuNeuCo, tacDungPhuController,
                isExpanded: false),
            const SizedBox(height: 16),
            // Liều tiêm tiếp theo
            const Text(
              tLieuTiemTiepTheoNeuCo,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF580B8B),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double
                  .infinity, // Đặt chiều rộng là 100% để khung rộng đầy đủ
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF2E9F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: GestureDetector(
                onTap: () => selectNextInjectionDate(context),
                child: Container(
                  width: double
                      .infinity, // Đặt chiều rộng là 100% để khung rộng đầy đủ
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2E9F7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Căn giữa các phần tử
                    children: [
                      Obx(()=>Text(
                        DateFormat('dd-MM-yyyy').format(controller.lieuTiemTiepTheo.value),
                        style: const TextStyle(
                            fontSize: 17, color: Color(0xFF7B7B7B)),
                      )),
                      const Icon(
                        Icons.calendar_today, // Biểu tượng lịch
                        color: Colors.grey, // Màu của biểu tượng
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tiến trình tiêm chủng
            _buildTextField(
                tTienTrinhTiemChung, tienTrinhTiemChungController),
            const SizedBox(height: 24),
            // Nút Lưu và Hủy
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // Xử lý lưu dữ liệu
                    final BuildContext currentContext = context;
                    await controller.addNewDoseForStudent(
                      controller.ngayTiem.value,
                      lieuLuongTiemController.text,
                      viTriTiemController.text,
                      nhaCungCapController.text,
                      tacDungPhuController.text,
                      controller.lieuTiemTiepTheo.value,
                      tienTrinhTiemChungController.text
                    );
                    Helper.successSnackBar(
                      title: tDaThemThanhCong,
                      message: tThemLieuVaccineThanhCong
                    );
                    if (currentContext.mounted) {
                      Navigator.of(currentContext).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF99D98C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                  ),
                  child: const Text(tThemMoi, style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý hủy
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFA983),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                  ),
                  child: const Text(tHuy, style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isExpanded = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF580B8B),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF2E9F7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "$tNhap $label",
              hintStyle: const TextStyle(
                color: Color(0xFF7B7B7B),
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 16, color: Color(0xFF7B7B7B)),
            minLines: isExpanded ? null : 1,
            maxLines: isExpanded ? null : 1,
          ),
        ),
      ],
    );
  }
}
