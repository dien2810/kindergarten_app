import 'package:flutter/material.dart';

import '../../../../../common_widgets/button_widget/custom_button_widget.dart';
import '../../../../../common_widgets/information_input_widget/information_input_widget.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/thong_tin_suc_khoe_controller.dart';
import 'ghi_chu_widget.dart';

class CoBanTabWidget extends StatelessWidget {
  const CoBanTabWidget({
    super.key,
    required this.controller,
  });

  final ThongTinSucKhoeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            tThongTinSucKhoeCoBan,
            style: TextStyle(
                color: Color(0xFF7B7B7B),
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          InformationInput(
            color: Colors.transparent,
            title: tChieuCao,
            textEditingController: controller.chieuCao,
            defaultInput: tCm,
          ),
          InformationInput(
            color: const Color(0xFFE9EFF7),
            title: tCanNang,
            textEditingController: controller.canNang,
            defaultInput: tKg,
          ),
          InformationInput(
            color: Colors.transparent,
            title: tMach,
            textEditingController: controller.mach,
            defaultInput: tLanTrenPhut,
          ),
          InformationInput(
            color: const Color(0xFFE9EFF7),
            title: tHuyetAp,
            textEditingController: controller.huyetAp,
            defaultInput: tMmHg,
          ),
          InformationInput(
            color: Colors.transparent,
            title: tChiSoBMI,
            textEditingController: controller.chiSoBMI,
          ),
          InformationInput(
            color: const Color(0xFFE9EFF7),
            title: tTheChat,
            textEditingController: controller.theChat,
          ),
          const SizedBox(height: t10Size),
          GhiChuWidget(controller: controller),
          const SizedBox(height: t10Size),
          const CustomButtonWidget(
            width: t10Size*20,
            color: Color(0xFF03045E),
            text: tCapNhat,
          ),
        ],
      ),
    );
  }
}





