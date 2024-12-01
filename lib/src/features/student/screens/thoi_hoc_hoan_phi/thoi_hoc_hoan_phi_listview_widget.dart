import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/image_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/thoi_hoc_hoan_phi/thoi_hoc_hoan_phi_controller.dart';
import 'package:kindergarten_app/src/features/student/models/hoan_phi/hoan_phi_model.dart';
import 'package:kindergarten_app/src/features/student/screens/thoi_hoc_hoan_phi/chi_tiet_thoi_hoc_hoan_phi/chi_tiet_thoi_hoc_hoan_phi_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/thoi_hoc_hoan_phi/thoi_hoc_hoan_phi_listtile_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/text_strings.dart';

class ThoiHocHoanPhiListviewWidget extends StatelessWidget {
  const ThoiHocHoanPhiListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final thoiHocHoanPhiController = Get.put(ThoiHocHoanPhiController());
    return FutureBuilder<List<ThoiHocHoanPhiModel>>(
        future: thoiHocHoanPhiController.getRefundData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có dữ liệu.'));
          }
          else {
            final refundList = snapshot.data!;
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                String image = '';
                final refund = refundList[index];
                String date = refund.date;
                String formType = refund.formType;
                String status = refund.status;
                Color color = tWhiteColor;
                if (status == tDaGui){
                  color = const Color(0xFFDAF6F4);
                }
                else if (status == tDaTiepNhan) {
                  color = const Color(0xFFE8E7FC);
                }
                else if (status == tDaHuy) {
                  color = const Color(0xFFFFEEEB);
                }
                else if (status == tDaHoanPhi){
                  color = const Color(0xFF9ED0F0);
                }
                else if (status == tChoDuyet){
                  color = const Color(0xFFFFBB72);
                }
                if (formType == 'yêu cầu thôi học'){
                  image = tThoiHocHoanPhiImage1;
                }
                else if (formType == 'hoàn phí CLB'){
                  image = tThoiHocHoanPhiImage2;
                }
                else if (formType == 'hoàn phí sách'){
                  image = tThoiHocHoanPhiImage3;
                }
                else if (formType == 'hoàn phí BHYT'){
                  image = tThoiHocHoanPhiImage4;
                }
                else if (formType == 'hoàn phí đồng phục'){
                  image = tThoiHocHoanPhiImage5;
                }
                return GestureDetector(
                  onTap: (){
                    Get.to(ChiTietThoiHocHoanPhiScreen(
                      image: image,
                      color: color,
                      refund: refund
                    ));
                  },
                  child: ThoiHocHoanPhiListtileWidget(
                    image: image,
                    title: formType,
                    subtitle: date,
                    status: status,
                    color: color,
                  )

                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: refundList.length,
            );
          }

        }
    );
  }
}
