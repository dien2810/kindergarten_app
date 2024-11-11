import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/screens/hoat_dong_su_kien/widget/su_kien_widget.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/guardian_navigation_menu_controller.dart';
import '../../guardian_navigation_menu/bottom_navigation_bar_widget.dart';
import '../widget/hoat_dong_widget.dart';


class HoatDongSuKienScreen extends StatelessWidget {
  const HoatDongSuKienScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(NgoaiKhoaController());
    final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tHoatDongSuKien),
        bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: t10Size),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: const TabBar(
                    automaticIndicatorColorAdjustment: false,
                    unselectedLabelColor: Color(0xFF777777),
                    tabs: [
                      Tab(
                        child: Text(
                          tHoatDong,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          tSuKien,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: t15Size),
              SizedBox(
                height: 600,
                child: TabBarView(
                  children: [
                    HoatDongWidget(),
                    SuKienWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
