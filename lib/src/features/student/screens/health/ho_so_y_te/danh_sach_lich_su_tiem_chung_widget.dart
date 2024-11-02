import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/thong_tin_suc_khoe_controller.dart';

class DanhSachLichSuTiemChungWidget extends StatelessWidget {
  const DanhSachLichSuTiemChungWidget({super.key, required this.controller});

  final ThongTinSucKhoeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap in SingleChildScrollView
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lịch sử tiêm chủng',
            style: TextStyle(
              color: Color(0xFF7B7B7B),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Obx(() {
            // Ensure selectedVaccine.value is not null before checking isNotEmpty
            if (controller.isDetailView.value &&
                controller.selectedVaccine.value?.isNotEmpty == true) {
              final selectedVaccineInfo = controller.vaccineHistory.firstWhere(
                    (vaccine) =>
                vaccine['LoaiVaccine'] == controller.selectedVaccine.value,
                orElse: () => {},
              );
              final vaccineHistoryInfo = selectedVaccineInfo['vaccineHistory_id_1_12'] ??
                  {};
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chi tiết về ${controller.selectedVaccine.value}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: vaccineHistoryInfo['doses']?.length ?? 0,
                    itemBuilder: (context, index) {
                      final vaccineInfo = vaccineHistoryInfo['doses']?[index];
                      return Card(
                        color: index.isEven ? Colors.white : const Color(
                            0xFFE9EFF7),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Liều tiêm: ${vaccineInfo?['dose'] ?? 'N/A'}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Ngày tiêm: ${vaccineInfo?['dateAdministered'] ??
                                    'N/A'}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Vị trí tiêm: ${vaccineInfo?['site'] ?? 'N/A'}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Nơi tiêm: ${vaccineInfo?['provider'] ??
                                    'N/A'}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Phản ứng sau tiêm: ${vaccineInfo?['sideEffects'] ??
                                    'N/A'}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Liều tiếp theo: ${vaccineInfo?['nextDoseDue'] ??
                                    'N/A'}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Tiến độ tiêm: ${vaccineInfo?['vaccinationProgress'] ??
                                    'N/A'}',
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
                    onPressed: () {
                      controller.isDetailView.value = false;
                      controller.selectedVaccine.value = '';
                    },
                    child: const Text('Quay lại danh sách'),
                  ),
                ],
              );
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(
                      const Color(0xFFCAF0F8)),
                  columns: const [
                    DataColumn(label: Text(
                        'STT', style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 18))),
                    DataColumn(label: Text(
                        'Loại vaccine', style: TextStyle(fontWeight: FontWeight
                        .bold, fontSize: 18))),
                    DataColumn(label: Text(
                        'Chi tiết', style: TextStyle(fontWeight: FontWeight
                        .bold, fontSize: 18))),
                  ],
                  rows: List<DataRow>.generate(
                    controller.vaccineHistory.length,
                        (index) {
                      final vaccine = controller.vaccineHistory[index];
                      final rowColor = index.isEven
                          ? Colors.white
                          : const Color(0xFFE9EFF7);
                      return DataRow(
                        color: WidgetStateProperty.all(rowColor),
                        cells: [
                          DataCell(Text(vaccine['STT'] ?? '',
                              style: const TextStyle(fontSize: 18))),
                          DataCell(Text(vaccine['LoaiVaccine'] ?? '',
                              style: const TextStyle(fontSize: 18))),
                          DataCell(
                            TextButton(
                              onPressed: () {
                                controller.isDetailView.value = true;
                                controller.selectedVaccine.value =
                                vaccine['LoaiVaccine'];
                              },
                              child: const Text(
                                'Xem chi tiết',
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