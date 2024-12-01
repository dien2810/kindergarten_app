import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/thoi_hoc_hoan_phi/them_thoi_hoc_hoan_phi/them_thoi_hoc_hoan_phi_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/thoi_hoc_hoan_phi/thoi_hoc_hoan_phi_listview_widget.dart';

import '../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/guardian_navigation_menu_controller.dart';
import '../guardian_navigation_menu/bottom_navigation_bar_widget.dart';

class ThoiHocHoanPhiScreen extends StatelessWidget {
  const ThoiHocHoanPhiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tThoiHocVaHoanPhi),
        bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFADE25D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: t40Size,
          ),
          onPressed: (){
            Get.to(const ThemThoiHocHoanPhiScreen());
          },
        ),
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
            SizedBox(height: t15Size),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: t100Size*6,
                      padding: EdgeInsets.all(t15Size),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ThoiHocHoanPhiListviewWidget(),
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
