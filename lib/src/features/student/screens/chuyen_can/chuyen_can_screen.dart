import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/screens/chuyen_can/xem_chi_tiet_anh_checkin/xem_chi_tiet_anh_checkin_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/chuyen_can/xem_chi_tiet_anh_checkout/xem_chi_tiet_anh_checkout_screen.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../constants/sizes.dart';
import '../../controllers/chuyen_can/chuyen_can_controller.dart';
import '../../controllers/guardian_navigation_menu_controller.dart';
import '../guardian_navigation_menu/bottom_navigation_bar_widget.dart';
import 'chuyen_can_field_widget.dart';

class ChuyenCanScreen extends StatelessWidget {
  const ChuyenCanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());
    final chuyenCanController = Get.put(ChuyenCanController());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tChuyenCan),
        bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
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
                            tChuyenCan,
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
                      height: 600,
                      padding: EdgeInsets.all(t15Size),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(()=> Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0)
                            ),
                            child: WeeklyDatePicker(
                              selectedDay: chuyenCanController.selectedDay.value, // DateTime
                              changeDay: (value) {
                                chuyenCanController.selectedDay.value = value;
                              },
                              backgroundColor: const Color(0xFFCAF0F8),
                              selectedDigitBackgroundColor: const Color(0xFFBA83DE),
                              selectedDigitColor: const Color(0xFF03045E),
                              digitsColor: const Color(0xFF03045E),
                              weekdayTextColor: const Color(0xFF03045E),
                              enableWeeknumberText: false,
                            ),
                          )),
                          SizedBox(height: t10Size,),
                          const Text(
                            tThu5,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                                color: Color(0xFF03045E)
                            ),
                          ),
                          SizedBox(height: t15Size),
                          const ChuyenCanFieldWidget(
                            fillColor: Colors.white,
                            field: tKhungGioVang,
                            fieldColor: Color(0xFFF91313),
                            value: tKhungGioHoatDongTuDo,
                            valueColor: Color(0xFFF91313),
                          ),
                          SizedBox(height: t10Size),
                          const ChuyenCanFieldWidget(
                            fillColor: Color(0xFFE9EFF7),
                            field: tTinhTrang,
                            fieldColor: Colors.black,
                            value: tVangCoPhep,
                            valueColor: Color(0xFF284CB2),
                          ),
                          SizedBox(height: t10Size),
                          ChuyenCanFieldWidget(
                            fillColor: Colors.white,
                            field: tAnhCheckin,
                            fieldColor: Colors.black,
                            value: tXemAnh,
                            valueColor: Colors.black,
                            isButton: true,
                            onPressed: (){
                              Get.to(const XemChiTietAnhCheckinScreen());
                            },
                          ),
                          SizedBox(height: t10Size),
                          ChuyenCanFieldWidget(
                            fillColor: const Color(0xFFE9EFF7),
                            field: tAnhCheckout,
                            fieldColor: Colors.black,
                            value: tXemAnh,
                            valueColor: Colors.black,
                            isButton: true,
                            onPressed: (){
                              Get.to(const XemChiTietAnhCheckoutScreen());
                            },
                          ),
                          SizedBox(height: t10Size),
                          const ChuyenCanFieldWidget(
                            fillColor: Colors.white,
                            field: tThoiGianVaoLop,
                            fieldColor: Colors.black,
                            value: t7h,
                            valueColor: Colors.black,
                          ),
                          SizedBox(height: t10Size),
                          const ChuyenCanFieldWidget(
                            fillColor: Color(0xFFE9EFF7),
                            field: tThoiGianRaKhoiLop,
                            fieldColor: Colors.black,
                            value: t7h30,
                            valueColor: Colors.black,
                          ),
                          SizedBox(height: t10Size),
                          const ChuyenCanFieldWidget(
                            fillColor: Colors.white,
                            field: tLyDo,
                            fieldColor: Colors.black,
                            value: tBiOm,
                            valueColor: Colors.black,
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
