import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/screens/ngoai_khoa/widget/danh_sach_clb_cua_toi_widget.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/guardian_navigation_menu_controller.dart';
import '../../guardian_navigation_menu/bottom_navigation_bar_widget.dart';
import '../widget/danh_sach_clb_widget.dart';

class NgoaiKhoaScreen extends StatelessWidget {
  const NgoaiKhoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(NgoaiKhoaController());
    final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tNgoaiKhoa),
        bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: t10Size),
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
                          tDanhSachCLB,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          tCLBCuaToi,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: t15Size),
              SizedBox(
                height: t100Size*3.2,
                child: const TabBarView(
                  children: [
                    DanhSachClbWidget(), // Hiển thị widget cho "Danh sách CLB"
                    DanhSachClbCuaToiWidget(), // Hiển thị widget cho "CLB của Tôi"
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
