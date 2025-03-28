import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';

import '../../../../../../utils/helper_controller/helper_controller.dart';
import '../../../../../student/models/vaccine/vaccine_model.dart';
import '../../../../controllers/suc_khoe_hoc_sinh/teacher_suc_khoe_hoc_sinh_controller.dart';

class TeacherThemLichSuTiemChungBottomSheet extends StatelessWidget {
  final TeacherSucKhoeHocSinhController controller;
  final BuildContext context;

  const TeacherThemLichSuTiemChungBottomSheet({super.key, required this.controller, required this.context});

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                tThemMoiLichSuTiemChung,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7209B7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Text for vaccine name
              const Text(
                tHoVaTen,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF580B8B),
                ),
              ),
              const SizedBox(height: 8), // space after label
              // Textfield for vaccine name
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: controller.student.studentProfile.name,
                    hintStyle: const TextStyle(
                      color: Color(0xFF7B7B7B),
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16), // space after vaccine name textfield
              // Text for vaccine description
              const Text(
                tTenLoaiVaccine,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF580B8B),
                ),
              ),
              Obx(() {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: DropdownButtonFormField<VaccineModel>(
                    value: controller.selectedVaccine.value,
                    decoration: const InputDecoration(
                      hintText: tNhapTenLoaiVaccine,
                      hintStyle: TextStyle(
                        color: Color(0xFF7B7B7B),
                        fontStyle: FontStyle.italic,
                        fontSize: 16
                      ),
                      border: InputBorder.none,
                    ),
                    items: controller.allVaccines.map((VaccineModel vaccine) {
                      return DropdownMenuItem<VaccineModel>(
                        value: vaccine,
                        child: Text(
                          vaccine.vaccineName,
                          style: const TextStyle(
                              color: Color(0xFF7B7B7B),
                              fontStyle: FontStyle.italic,
                              fontSize: 16
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (VaccineModel? newValue) {
                      controller.selectedVaccine.value = newValue;
                    },
                    validator: (value) => value == null ? tVuiLongChonLoaiVaccine : null,
                  ),
                );
              }),
              const SizedBox(height: 16), // space after vaccine description textfield
              // Row for Add and Cancel buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final BuildContext currentContext = context;
                        await controller.addNewVaccineHistory();
                        Helper.successSnackBar(title: tDaThemThanhCong, message: "$tDaThemLichSuTiemChung $tthanhCong");
                        if (currentContext.mounted) {
                          Navigator.of(currentContext).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF99D98C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 60),
                      ),
                      child: const Text(
                        tThemMoi,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // Cancel button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFA983),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 60),
                      ),
                      child: const Text(
                        tHuy,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
