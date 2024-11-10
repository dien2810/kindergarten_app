import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/thuc_don/them_ghi_chu_moi_screen.dart';

import '../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class ChiTietMonAnScreen extends StatelessWidget {
  const ChiTietMonAnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tThucDon),
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
                          tThucDon,
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
                      height: 600,
                      padding: const EdgeInsets.all(t15Size),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: t10Size,),
                          const Text(
                            tChiTietMonAn,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF03045E)
                            ),
                          ),
                          Card(
                              color: const Color(0xFFA6A3A3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                        padding: const EdgeInsets.all(t10Size),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                tTenMon,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                  const Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: t10Size*12,
                                        child: ClipRRect(
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: AssetImage(tThucDonBuaSang)
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              )
                          ),
                          const SizedBox(height: t10Size,),
                           SizedBox(
                             width: double.infinity,
                             child: Card(
                              color: const Color(0xFFF2EDED),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(t10Size),
                                child: Text(
                                  tThanhPhanCoTrongMonAn,
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                ),
                              ),
                             ),
                           ),
                          const Spacer(flex: 1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2058E9),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30)
                                    )
                                ),
                                onPressed: () {
                                  Get.off(const ThemGhiChuMoiScreen());
                                  // final medicine = MedicineModel(
                                  //   prescription: themMoiDanThuocConTroller.prescription.text,
                                  //   note: themMoiDanThuocConTroller.prescription.text,
                                  //   dates: [
                                  //     themMoiDanThuocConTroller.startDate.text,
                                  //     themMoiDanThuocConTroller.endDate.text
                                  //   ],
                                  //   status: tDaGui,
                                  //   medicineDetails: themMoiDanThuocConTroller.listChiTietDonThuoc,
                                  //   studentID: 'student_id_1',
                                  // );
                                  // themMoiDanThuocConTroller.addMedicine(medicine);
                                },
                                child: const Text(
                                  tThemGhiChu,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              const SizedBox(width: t5Size),
                              SizedBox(
                                width: t10Size*13,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF6BC5FF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                      )
                                  ),
                                  child: const Text(
                                    tHuy,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: t10Size,)
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
