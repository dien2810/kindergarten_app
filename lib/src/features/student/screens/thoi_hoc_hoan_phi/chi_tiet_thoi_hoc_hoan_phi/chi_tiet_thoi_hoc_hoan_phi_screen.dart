import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/models/hoan_phi/hoan_phi_model.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';
import 'package:kindergarten_app/src/features/student/screens/thoi_hoc_hoan_phi/thoi_hoc_hoan_phi_listtile_widget.dart';

import '../../../../../common_widgets/information_widget/information_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';

class ChiTietThoiHocHoanPhiScreen extends StatelessWidget {
  const ChiTietThoiHocHoanPhiScreen({
    super.key,
    required this.image,
    required this.color,
    required this.refund}
      );

  final String image;
  final ThoiHocHoanPhiModel refund;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tThoiHocVaHoanPhi),
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: t10Size),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  child: const TabBar(
                    automaticIndicatorColorAdjustment: false,
                    unselectedLabelColor: Color(0xFF777777),
                    tabs: [
                      Tab(
                          child: Text(
                            tThoiHocVaHoanPhi,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: t15Size),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(t15Size),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            tChiTietDonThuoc,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                                color: Color(0xFF03045E)
                            ),
                          ),
                          const SizedBox(height: t15Size),
                          ThoiHocHoanPhiListtileWidget(
                            image: image,
                            title: refund.formType,
                            subtitle: refund.date,
                            status: refund.status,
                            color: color
                          ),
                          const SizedBox(height: t10Size,),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFFE8F1FF)
                              )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tLoaiHoanPhi+refund.formType
                                ),
                                const SizedBox(height: t5Size,),
                                Text(
                                    tMaHocSinh+refund.studentID
                                ),
                                const SizedBox(height: t5Size,),
                                Text(
                                    tHoVaTen+refund.formType
                                ),
                                const SizedBox(height: t5Size,),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: t30Size,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: const Color(0xFFE8F1FF)
                                )
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tSoTien,
                                ),
                                Text(
                                  t100000d,
                                  style: TextStyle(
                                      color: Colors.red
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: t50Size,),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: t10Size*25,
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
                                    Get.back();
                                  },
                                  child: const Text(
                                    tQuayLaiTrangTruoc,
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
                  )
                ],
              ),
            )
          ],
        ),
      ),


    );
  }
}












