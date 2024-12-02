import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/kham_tab/teacher_chuan_doan_widget.dart';

import '../../../../../../../common_widgets/information_input_widget/information_input_widget.dart';
import '../../../../../../../constants/sizes.dart';
import '../../../../../../../constants/text_strings.dart';
import '../../../../../controllers/suc_khoe_hoc_sinh/teacher_suc_khoe_hoc_sinh_controller.dart';


class TeacherClbKhamTabWidget extends StatelessWidget {
  const TeacherClbKhamTabWidget({super.key, required this.controller});

  final TeacherSucKhoeHocSinhController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            tHoSoBenhAn,
            style: TextStyle(
                color: Color(0xFF380543),
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          SizedBox(height: t10Size),
          const Text(
            tMat,
            style: TextStyle(
                color: Color(0xFF380543),
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
            color: const Color(0xFFF2E9F7),
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
            color: const Color(0xFFF2E9F7),
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
                color: Color(0xFF380543),
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          SizedBox(height: t10Size),
          InformationInput(
            color: Colors.transparent,
            title: tTinhTrangRang,
            textEditingController: controller.tinhTrangRang,
            defaultInput: tBinhThuong,
          ),
          InformationInput(
            color: const Color(0xFFF2E9F7),
            title: tTinhTrangTai,
            textEditingController: controller.tinhTrangTai,
            defaultInput: tBinhThuong,
          ),
          InformationInput(
            color: Colors.transparent,
            title: tBenhLyKhac,
            textEditingController: controller.benhLyKhac,
            defaultInput: tKhongCo,
          ),
          SizedBox(height: t10Size),
          const Text(
            tChuanDoanCuaBacSi,
            style: TextStyle(
                color: Color(0xFF380543),
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          SizedBox(height: t10Size),
          TeacherChuanDoanWidget(controller: controller),
          SizedBox(height: t15Size),
          SizedBox(height: t15Size,)
        ],
      ),
    );
  }
}
