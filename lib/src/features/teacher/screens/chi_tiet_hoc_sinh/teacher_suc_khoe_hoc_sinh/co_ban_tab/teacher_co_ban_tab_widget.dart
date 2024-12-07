import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_suc_khoe_hoc_sinh/co_ban_tab/teacher_ghi_chu_widget.dart';
import '../../../../../../common_widgets/information_input_widget/information_input_widget.dart';
import '../../../../../../constants/sizes.dart';
import '../../../../../../constants/text_strings.dart';
import '../../../../controllers/suc_khoe_hoc_sinh/teacher_suc_khoe_hoc_sinh_controller.dart';

class TeacherCoBanTabWidget extends StatelessWidget {
  const TeacherCoBanTabWidget({
    super.key,
    required this.controller,
  });

  final TeacherSucKhoeHocSinhController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            tThongTinSucKhoeCoBan,
            style: TextStyle(
                color: Color(0xFF380543),
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
          // Bảo đảm các widget bên dưới có kích thước hợp lý
          InformationInput(
            color: Colors.transparent,
            title: tChieuCao,
            textEditingController: controller.chieuCao,
            defaultInput: tCm,
          ),
          InformationInput(
            color: const Color(0xFFF2E9F7),
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
            color: const Color(0xFFF2E9F7),
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
            color: const Color(0xFFF2E9F7),
            title: tTheChat,
            textEditingController: controller.theChat,
          ),
          SizedBox(height: t10Size),

          // Thêm phần ghi chú
          TeacherGhiChuWidget(controller: controller),
          SizedBox(height: t10Size),
          // Align(
          //   alignment: Alignment.center,
          //   child: SizedBox(
          //     width: t10Size*20,
          //     child: Container(
          //       decoration: BoxDecoration(
          //         color: const Color(0xFF380543),
          //         borderRadius: BorderRadius.circular(t50Size),
          //       ),
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //             backgroundColor: Colors.transparent
          //         ),
          //         onPressed: () {
          //           controller.updateHealthInformation();
          //         },
          //         child: const Text(
          //           tCapNhat,
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 20,
          //               fontFamily: "Outfit",
          //               color: tWhiteColor
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(height: t20Size ,)
        ],
      ),
    );
  }
}
