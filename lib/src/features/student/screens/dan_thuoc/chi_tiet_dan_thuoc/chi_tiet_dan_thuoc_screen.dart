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
                          DanThuocListTileWidget(
                            image: image,
                            title: medicine.prescription,
                            subtitle: "${medicine.dates[0]} - ${medicine.dates[1]}",
                            status: medicine.status,
                            color: color,
                          ),
                          const SizedBox(height: t10Size,),
                          InformationWidget(
                              title: tDonThuoc,
                            color: const Color(0xFFDAF6F4),
                            value: medicine.prescription,
                          ),
                          const SizedBox(height: t5Size,),
                          InformationWidget(
                            title: tGhiChuDanThuoc,
                            color: const Color(0xFFDAF6F4),
                            value: medicine.note,
                          ),
                          const SizedBox(height: t5Size,),
                          InformationWidget(
                            title: tNgayUong,
                            color: const Color(0xFFDAF6F4),
                            value: "${medicine.dates[0]} - ${medicine.dates[1]}",
                          ),
                          const SizedBox(height: t10Size,),
                          const Text(
                            tThongTinThuocVaCachSuDung,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold
                            ),
                          ),
                          ...medicine.medicineDetails.asMap().entries.map((entry) {
                            int index = entry.key;
                            var detail = entry.value;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Thuốc số ${index + 1}',
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                InformationWidget(
                                  title: tTenThuoc,
                                  color: const Color(0xFFDAF6F4),
                                  value: detail.name,
                                ),
                                const SizedBox(height: 5),
                                InformationWidget(
                                  title: tLieuLuong,
                                  color: Colors.white,
                                  value: detail.dosage,
                                ),
                                const SizedBox(height: 5),
                                InformationWidget(
                                  title: tThoiGian,
                                  color: const Color(0xFFDAF6F4),
                                  value: detail.time,
                                ),
                                const SizedBox(height: 10),
                              ],
                            );
                          }),
                          Align(
                            alignment: Alignment.center,
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












