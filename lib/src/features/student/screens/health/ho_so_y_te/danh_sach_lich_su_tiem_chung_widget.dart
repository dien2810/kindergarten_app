import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/thong_tin_suc_khoe_controller.dart';

class DanhSachLichSuTiemChungWidget extends StatelessWidget {
  const DanhSachLichSuTiemChungWidget({super.key, required this.controller});

  final ThongTinSucKhoeController controller;

  @override
  Widget build(BuildContext context) {
    const buttonColor = Color(0xFF03045E);
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: buttonColor, // Màu chữ của Button
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      textStyle: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      controller.isDetailView.value = false;
                      controller.selectedVaccine.value = '';
                    },
                    child: const Text(tQuayLaiDanhSach),
                  ),
                ],
              );
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor:
                      WidgetStateProperty.all(const Color(0xFFCAF0F8)),
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
                          index.isEven ? Colors.white : const Color(0xFFE9EFF7);
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
                                  color: Color(0xFF03045E),
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
