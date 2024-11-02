import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/controllers/dan_thuoc/them_moi_dan_thuoc_controller.dart';

import '../../../../../common_widgets/information_input_widget/information_input_with_icon_widget.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class ChiTietDonThuocInputWidget extends StatelessWidget {
  const ChiTietDonThuocInputWidget({
    super.key,
    this.index=0, required this.dosage, required this.name, required this.time
  });

  final int index;
  final String dosage;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    final themMoiDanThuocController = Get.put(ThemMoiDanThuocController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tThuocSo+(index+1).toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
          ),
        ),
        InformationInputWithIconWidget(
          initialValue: themMoiDanThuocController.listChiTietDonThuoc[index].name,
          color: const Color(0xFFC1C7D0),
          title: tTenThuoc,
          hintText: '',
          onChanged: (value) =>
            themMoiDanThuocController.listChiTietDonThuoc[index].name = value,
          // widget: IconButton(
          //   onPressed: (){
          //     themMoiDanThuocController.listChiTietDonThuoc[index].name='';
          //   },
          //   icon: Image.asset(tDanThuocDeleteIcon, width: 24, height: 24),
          // ),
        ),
        const SizedBox(height: t5Size),
        InformationInputWithIconWidget(
          initialValue: themMoiDanThuocController.listChiTietDonThuoc[index].dosage,
          color: Colors.white,
          title: tLieuLuong,
          hintText: '',
          onChanged: (value) =>
            themMoiDanThuocController.listChiTietDonThuoc[index].dosage = value,
        ),
        const SizedBox(height: t5Size),
        InformationInputWithIconWidget(
          initialValue: themMoiDanThuocController.listChiTietDonThuoc[index].time,
          color: const Color(0xFFC1C7D0),
          title: tThoiGian,
          hintText: '',
          onChanged: (value) =>
            themMoiDanThuocController.listChiTietDonThuoc[index].time = value,
          // widget: IconButton(
          //   onPressed: (){
          //     themMoiDanThuocController.listChiTietDonThuoc[index].time = '';
          //   },
          //   icon: Image.asset(tDanThuocDeleteIcon, width: 24, height: 24),
          // ),

        ),
      ],
    );
  }
}