import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';

import '../../../../../common_widgets/information_widget/information_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../dan_thuoc_list_tile_widget.dart';


class ChiTietDanThuocScreen extends StatelessWidget {
  const ChiTietDanThuocScreen({
    super.key,
    required this.image,
    required this.color,
    required this.medicine}
  );

  final String image;
  final MedicineModel medicine;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tDanThuoc),
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: t10Size),
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
                            tDanThuoc,
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
            SizedBox(height: t15Size),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(t15Size),
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
                          SizedBox(height: t10Size),
                          DanThuocListTileWidget(
                            image: image,
                            title: medicine.prescription,
                            subtitle: medicine.createDate,
                            status: medicine.status,
                            color: color,
                          ),
                          SizedBox(height: t10Size,),
                          Container(
                            color: const Color(0xFFDAF6F4),
                            height: t80Size,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InformationWidget(
                                title: tDonThuoc,
                                color: const Color(0xFFDAF6F4),
                                value: medicine.prescription,
                              ),
                            ),
                          ),
                          SizedBox(height: t10Size,),
                          Container(
                            color: const Color(0xFFDAF6F4),
                            height: t120Size,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InformationWidget(
                                title: tGhiChuDanThuoc,
                                color: const Color(0xFFDAF6F4),
                                value: medicine.note,
                              ),
                            ),
                          ),
                          SizedBox(height: t10Size,),
                          Container(
                            color: const Color(0xFFDAF6F4),
                            height: t100Size,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InformationWidget(
                                title: tNgayUong,
                                color: const Color(0xFFDAF6F4),
                                value: medicine.createDate,
                              ),
                            ),
                          ),
                          SizedBox(height: t50Size,),
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












