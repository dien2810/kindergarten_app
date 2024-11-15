import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/thong_tin_suc_khoe/thong_tin_suc_khoe_controller.dart';

class ThongTinSucKhoeChungWidget extends StatelessWidget {
  const ThongTinSucKhoeChungWidget({
    super.key,
    required this.controller,
  });

  final ThongTinSucKhoeController controller;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(t10Size),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                tTieuSuGiaDinhHocSinh,
                style: TextStyle(
                    color: Color(0xFF7B7B7B),
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              const SizedBox(height: t10Size),
              const Text(tThongTinTieuSuGiaDinh),
              Obx(()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: RadioListTile<GiaDinhCoBenh>(
                      title: const Text(tKhong),
                      value: GiaDinhCoBenh.khong,
                      groupValue: controller.giaDinhCoBenhStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val){
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
                      onChanged: (val){
                        controller.giaDinhCoBenhStatus.value = val!;
                      },
                    ),
                  ),
                ],
              ),
              ),
              const SizedBox(height: t5Size),
              const Text(
                tTieuSuBanThan,
                style: TextStyle(
                    color: Color(0xFF7B7B7B),
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              const Text(tThongTinTieuSuBanThan),
              const Text(tBenhTruyenNhiem),
              Obx(()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: RadioListTile<TruyenNhiem>(
                      title: const Text(tKhong),
                      value: TruyenNhiem.khong,
                      groupValue: controller.truyenNhiemStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val){
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
                      onChanged: (val){
                        controller.truyenNhiemStatus.value = val!;
                      },
                    ),
                  ),
                ],
              ),
              ),
              const Text(tBenhTimMach),
              Obx(()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: RadioListTile<TimMach>(
                      title: const Text(tKhong),
                      value: TimMach.khong,
                      groupValue: controller.timMachStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val){
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
                      onChanged: (val){
                        controller.timMachStatus.value = val!;
                      },
                    ),
                  ),
                ],
              ),
              ),
              const Text(tDaiThaoDuong),
              Obx(()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: RadioListTile<DaiThaoDuong>(
                      title: const Text(tKhong),
                      value: DaiThaoDuong.khong,
                      groupValue: controller.daiThaoDuongStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val){
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
                      onChanged: (val){
                        controller.daiThaoDuongStatus.value = val!;
                      },
                    ),
                  ),
                ],
              ),
              ),
              const Text(tLao),
              Obx(()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: RadioListTile<Lao>(
                      title: const Text(tKhong),
                      value: Lao.khong,
                      groupValue: controller.laoStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val){
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
                      onChanged: (val){
                        controller.laoStatus.value = val!;
                      },
                    ),
                  ),
                ],
              ),
              ),
              const Text(tHenSuyen),
              Obx(()=> Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: RadioListTile<HenSuyen>(
                      title: const Text(tKhong),
                      value: HenSuyen.khong,
                      groupValue: controller.henSuyenStatus.value,
                      tileColor: Colors.deepPurple.shade50,
                      onChanged: (val){
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
                      onChanged: (val){
                        controller.henSuyenStatus.value = val!;
                      },
                    ),
                  ),
                ],
              ),
              ),
              const Text(tBenhKhac),
              const SizedBox(height: t15Size),
              TextFormField(
                controller: controller.benhKhac,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFDEDBDB),
                  focusColor: Colors.transparent,
                  border: InputBorder.none
                ),
              ),
              const SizedBox(height: t15Size),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: t10Size*20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF03045E),
                      borderRadius: BorderRadius.circular(t50Size),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent
                      ),
                      onPressed: () {
                        controller.updateHealthHistory();

                      },
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
      ),
    );
  }
}