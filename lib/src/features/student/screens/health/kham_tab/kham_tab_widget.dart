import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/features/student/screens/health/kham_tab/chuan_doan_widget.dart';

import '../../../../../common_widgets/button_widget/custom_button_widget.dart';
import '../../../../../common_widgets/information_input_widget/information_input_widget.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/thong_tin_suc_khoe/thong_tin_suc_khoe_controller.dart';

class KhamTabWidget extends StatelessWidget {
  const KhamTabWidget({super.key, required this.controller});

  final ThongTinSucKhoeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            tHoSoBenhAn,
            style: TextStyle(
                color: Color(0xFF7B7B7B),
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          SizedBox(height: t10Size),
          const Text(
            tMat,
            style: TextStyle(
                color: Color(0xFF7B7B7B),
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          InformationInput(
            color: Colors.transparent,
            title: tMatPhaiKhongKinh,
            textEditingController: controller.matPhaiKhongKinh,
            defaultInput: tTren10,
          ),
          InformationInput(
            color: const Color(0xFFE9EFF7),
            title: tMatTraiKhongKinh,
            textEditingController: controller.matTraiKhongKinh,
            defaultInput: tTren10,
          ),
          InformationInput(
            color: Colors.transparent,
            title: tMatPhaiCoKinh,
            textEditingController: controller.matPhaiCoKinh,
            defaultInput: tTren10,
          ),
          InformationInput(
            color: const Color(0xFFE9EFF7),
            title: tMatTraiCoKinh,
            textEditingController: controller.matTraiCoKinh,
            defaultInput: tTren10,
          ),
          InformationInput(
            color: Colors.transparent,
            title: tTinhTrangMat,
            textEditingController: controller.tinhTrangMat,
          ),
          SizedBox(height: t10Size),
          const Text(
            tKhac,
            style: TextStyle(
                color: Color(0xFF7B7B7B),
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          SizedBox(height: t10Size),
          InformationInput(
            color: Colors.transparent,
            title: tTinhTrangRang,
            textEditingController: controller.tinhTrangRang,
            //defaultInput: tBinhThuong,
          ),
          InformationInput(
            color: const Color(0xFFE9EFF7),
            title: tTinhTrangTai,
            textEditingController: controller.tinhTrangTai,
            //defaultInput: tBinhThuong,
          ),
          InformationInput(
            color: Colors.transparent,
            title: tBenhLyKhac,
            textEditingController: controller.benhLyKhac,
            //defaultInput: tKhongCo,
          ),
          SizedBox(height: t10Size),
          const Text(
            tChuanDoanCuaBacSi,
            style: TextStyle(
                color: Color(0xFF7B7B7B),
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          SizedBox(height: t10Size),
          ChuanDoanWidget(controller: controller),
          SizedBox(height: t10Size),
          CustomButtonWidget(
            width: t10Size*20,
            color: const Color(0xFF03045E),
            text: tCapNhat,
            onPressed: (){
              controller.updateMedicalRecordKhamTab();
            },
          ),

        ],
      ),
    );
  }
}
