import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/thuc_don/thuc_don_controller.dart';
import 'package:kindergarten_app/src/features/student/screens/thuc_don/thuc_don_card_widget.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../constants/sizes.dart';
import '../../controllers/guardian_navigation_menu_controller.dart';
import '../guardian_navigation_menu/bottom_navigation_bar_widget.dart';

class ThucDonScreen extends StatelessWidget {
  const ThucDonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final thucDonController = Get.put(ThucDonController());
    final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tThucDon),
        bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
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
                          Obx(()=> Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0)
                            ),
                            child: WeeklyDatePicker(
                              selectedDay: thucDonController.selectedDay.value, // DateTime
                              changeDay: (value) {
                                thucDonController.selectedDay.value = value;
                              },
                              backgroundColor: const Color(0xFFCAF0F8),
                              selectedDigitBackgroundColor: const Color(0xFFBA83DE),
                              selectedDigitColor: const Color(0xFF03045E),
                              digitsColor: const Color(0xFF03045E),
                              weekdayTextColor: const Color(0xFF03045E),
                              enableWeeknumberText: false,
                            ),
                          )),
                          const SizedBox(height: t10Size,),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (context,index){
                                return const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tBuaSang,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF03045E)
                                      ),
                                    ),
                                    SizedBox(height: t5Size,),
                                    ThucDonCardWidget()
                                  ],
                                );
                              },
                            ),
                          )
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
