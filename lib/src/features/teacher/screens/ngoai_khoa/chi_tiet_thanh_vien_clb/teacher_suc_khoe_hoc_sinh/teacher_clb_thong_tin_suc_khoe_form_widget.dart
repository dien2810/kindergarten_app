import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/sizes.dart';
import '../../../../../../constants/text_strings.dart';
import '../../../../controllers/suc_khoe_hoc_sinh/teacher_suc_khoe_hoc_sinh_controller.dart';


class TeacherClbThongTinSucKhoeChungWidget extends StatelessWidget {
  const TeacherClbThongTinSucKhoeChungWidget({
    super.key,
    required this.controller,
  });

  final TeacherSucKhoeHocSinhController controller;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.all(t10Size),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: const Color(0xFFC4C4C4)),
      ),
      child: SingleChildScrollView( // Đảm bảo có thể cuộn
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                tTieuSuGiaDinhHocSinh,
                style: TextStyle(
                  color: Color(0xFF380543),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: t10Size),
              const Text(tThongTinTieuSuGiaDinh),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: RadioListTile<GiaDinhCoBenh>(
                      title: const Text(tKhong),
                      value: GiaDinhCoBenh.khong,
                      groupValue: controller.giaDinhCoBenhStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.giaDinhCoBenhStatus.value = val!;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<GiaDinhCoBenh>(
                      title: const Text(tCo),
                      value: GiaDinhCoBenh.co,
                      groupValue: controller.giaDinhCoBenhStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.giaDinhCoBenhStatus.value = val!;
                      },
                    ),
                  ),
                ],
              )),
              const SizedBox(height: t5Size),
              const Text(
                tTieuSuBanThan,
                style: TextStyle(
                  color: Color(0xFF380543),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(tThongTinTieuSuBanThan),
              const Text(tBenhTruyenNhiem),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: RadioListTile<TruyenNhiem>(
                      title: const Text(tKhong),
                      value: TruyenNhiem.khong,
                      groupValue: controller.truyenNhiemStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.truyenNhiemStatus.value = val!;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<TruyenNhiem>(
                      title: const Text(tCo),
                      value: TruyenNhiem.co,
                      groupValue: controller.truyenNhiemStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.truyenNhiemStatus.value = val!;
                      },
                    ),
                  ),
                ],
              )),
              const Text(tBenhTimMach),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: RadioListTile<TimMach>(
                      title: const Text(tKhong),
                      value: TimMach.khong,
                      groupValue: controller.timMachStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.timMachStatus.value = val!;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<TimMach>(
                      title: const Text(tCo),
                      value: TimMach.co,
                      groupValue: controller.timMachStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.timMachStatus.value = val!;
                      },
                    ),
                  ),
                ],
              )),
              const Text(tDaiThaoDuong),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: RadioListTile<DaiThaoDuong>(
                      title: const Text(tKhong),
                      value: DaiThaoDuong.khong,
                      groupValue: controller.daiThaoDuongStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.daiThaoDuongStatus.value = val!;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<DaiThaoDuong>(
                      title: const Text(tCo),
                      value: DaiThaoDuong.co,
                      groupValue: controller.daiThaoDuongStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.daiThaoDuongStatus.value = val!;
                      },
                    ),
                  ),
                ],
              )),
              const Text(tLao),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: RadioListTile<Lao>(
                      title: const Text(tKhong),
                      value: Lao.khong,
                      groupValue: controller.laoStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.laoStatus.value = val!;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<Lao>(
                      title: const Text(tCo),
                      value: Lao.co,
                      groupValue: controller.laoStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.laoStatus.value = val!;
                      },
                    ),
                  ),
                ],
              )),
              const Text(tHenSuyen),
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: RadioListTile<HenSuyen>(
                      title: const Text(tKhong),
                      value: HenSuyen.khong,
                      groupValue: controller.henSuyenStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.henSuyenStatus.value = val!;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<HenSuyen>(
                      title: const Text(tCo),
                      value: HenSuyen.co,
                      groupValue: controller.henSuyenStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val) {
                        controller.henSuyenStatus.value = val!;
                      },
                    ),
                  ),
                ],
              )),
              const Text(tBenhKhac),
              const SizedBox(height: t15Size),
              TextFormField(
                controller: controller.benhKhac,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFDEDBDB),
                  focusColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 0),
                    borderRadius: BorderRadius.circular(t40Size),
                  ),
                ),
              ),
              const SizedBox(height: t15Size),
            ],
          ),
        ),
      ),
    );
  }
}