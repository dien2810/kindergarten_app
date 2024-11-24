import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/guardian_navigation_menu_controller.dart';
import 'package:kindergarten_app/src/features/student/screens/dan_thuoc/dan_thuoc_list_view_widget.dart';
import 'package:kindergarten_app/src/features/student/screens/dan_thuoc/them_moi_dan_thuoc/them_moi_dan_thuoc_bottom_sheet.dart';

import '../../../../constants/sizes.dart';
import '../guardian_navigation_menu/bottom_navigation_bar_widget.dart';

class DanThuocScreen extends StatelessWidget {
  const DanThuocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tDanThuoc),
        bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFADE25D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(t50Size)),
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: t30Size,
          ),
          onPressed: (){
            ThemMoiDanThuocBottomSheet.buildShowModalBottomSheet(context);
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
                      height: t100Size*5,
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
                            tLichSuDanThuoc,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 24,
                              color: Color(0xFF03045E)
                            ),
                          ),
                          SizedBox(height: t10Size),
                          const Expanded(
                            child: DanThuocListViewWidget(),
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










