import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/ho_so_y_te/teacher_them_moi_lieu_tiem_bottom_sheet.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/ho_so_y_te/teacher_them_moi_loai_vaccine_bottom_sheet.dart';

import '../../../../../../constants/text_strings.dart';
import '../../../../controllers/suc_khoe_hoc_sinh/teacher_suc_khoe_hoc_sinh_controller.dart';

class TeacherDanhSachLichSuTiemChungWidget extends StatelessWidget {
  const TeacherDanhSachLichSuTiemChungWidget(
      {super.key, required this.controller});

  final TeacherSucKhoeHocSinhController controller;

  @override
  Widget build(BuildContext context) {
    const buttonColor = Color(0xFF7209B7);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            tLichSuTiemChungHeader ,
            style: TextStyle(
              color: Color(0xFF7B7B7B),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          // Button thêm mới loại vaccine
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9ADA7E), // Màu nền button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bo góc button
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding cho button
            ),
            onPressed: () {
              // Gọi BottomSheet khi nhấn nút
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Cho phép BottomSheet cuộn khi có nhiều nội dung
                builder: (BuildContext context) {
                  return const TeacherThemMoiLoaiVaccineBottomSheet();
                },
              );
            },
            child: const Text(
              "Thêm mới loại vaccine",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Obx(() {
            if (controller.isDetailView.value &&
                controller.selectedVaccine.value.isNotEmpty) {
              final vaccineHistoryId = controller.selectedVaccine.value;
              final selectedVaccineHistory =
                  controller.vaccineHistory[vaccineHistoryId] ?? {};
              final vaccineId = selectedVaccineHistory["vaccineID"];
              final vaccineInfo = controller.vaccineData[vaccineId] ?? {};

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$tChiTietVe ${vaccineInfo['vaccineName']} \n ${vaccineInfo['description']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7209B7)
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedVaccineHistory['doses']?.length ?? 0,
                    itemBuilder: (context, index) {
                      final doseInfo = selectedVaccineHistory['doses'][index];
                      return Card(
                        color: index.isEven
                            ? Colors.white
                            : const Color(0xFFE9EFF7),
                        shadowColor: Colors.black,
                        elevation: 4.0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$tLieu ${index + 1} ',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$tNgayTiem ${doseInfo['dateAdministered']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$tLieuLuongVaccine ${doseInfo['dose']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$tViTriTiem ${doseInfo['site']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$tNhaCungCap ${doseInfo['provider']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$tPhanUngSauTiem ${doseInfo['sideEffects']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$tLieuTiepTheo ${doseInfo['nextDoseDue']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '$tTienTrinhTiem ${doseInfo['vaccinationProgress']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  // Thêm hai nút trong cùng một dòng
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, // Màu chữ
                            backgroundColor: buttonColor, // Màu nền
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            controller.isDetailView.value = false;
                            controller.selectedVaccine.value = '';
                          },
                          child: const Text(tQuayLaiDanhSach),
                        ),
                      ),
                      const SizedBox(width: 16), // Khoảng cách giữa hai nút
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFF9ADA7E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return TeacherThemMoiLieuTiemBottomSheet();
                              },
                            );
                          },
                          child: const Text("Thêm mới liều vaccine"),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor:
                  WidgetStateProperty.all(const Color(0xFFE9CEF8)),
                  columns: const [
                    DataColumn(
                      label: Text(
                        tSTTTableColumn,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        tLoaiVaccineTableColumn,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        tChiTietTableColumn,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    controller.selectedVaccineHistory.length,
                        (index) {
                      final vaccineHistory =
                      controller.selectedVaccineHistory[index];
                      final rowColor =
                      index.isEven ? Colors.white : const Color(0xFFF2E9F7);
                      return DataRow(
                        color: WidgetStateProperty.all(rowColor),
                        cells: [
                          DataCell(
                            Text(
                              (index + 1).toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          DataCell(
                            Text(
                              vaccineHistory['LoaiVaccine'] ?? '',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          DataCell(
                            TextButton(
                              onPressed: () {
                                controller.isDetailView.value = true;
                                controller.selectedVaccine.value =
                                vaccineHistory['vaccineHistoryId'];
                              },
                              child: const Text(
                                tXemChiTietButton,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF7209B7),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
