import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import 'package:kindergarten_app/src/constants/colors.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/thong_tin_suc_khoe/thong_tin_suc_khoe_controller.dart';
import 'package:kindergarten_app/src/features/student/screens/health/kham_tab/kham_tab_widget.dart';
import 'package:kindergarten_app/src/features/student/screens/health/thong_tin_suc_khoe_form_widget.dart';

import '../../../../constants/sizes.dart';
import 'co_ban_tab/co_ban_tab_widget.dart';
// loi khuyen bac si tab
import 'package:kindergarten_app/src/features/student/screens/health/ho_so_y_te/loi_khuyen_bac_si_widget.dart';
// lich su tiem chung tab
import 'package:kindergarten_app/src/features/student/screens/health/ho_so_y_te/danh_sach_lich_su_tiem_chung_widget.dart';


class ThongTinSucKhoeScreen extends StatelessWidget {
  const ThongTinSucKhoeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThongTinSucKhoeController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tThongTinSucKhoe),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: t10Size),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
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
                            tThongTinChung,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          )
                      ),
                      Tab(
                          child: Text(
                            tHoSoYTe,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: t15Size),
              SizedBox(
                height: 3.7*t100Size,
                child: TabBarView(
                  children: [
                    ThongTinSucKhoeChungWidget(controller: controller),
                    DefaultTabController(
                      length: 4,
                      child: SingleChildScrollView(
                        child: Container(
                          height: t100Size*6,
                          padding: EdgeInsets.all(t10Size),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TabBar.secondary(
                                automaticIndicatorColorAdjustment: false,
                                unselectedLabelColor: Color(0xFF757575),
                                labelColor: tWhiteColor,
                                indicatorColor: Color(0xFF03045E),
                                indicator: BoxDecoration(
                                    color: Color(0xFF03045E),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                                ),
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  Tab(
                                    child: Center(
                                      child: Text(
                                        tCoBan,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),
                                      ),
                                    )
                                  ),
                                  Tab(
                                      child: Center(
                                        child: Text(
                                          tKham,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16
                                          ),
                                        ),
                                      )
                                  ),
                                  Tab(
                                      child: Center(
                                        child: Text(
                                          tLoiKhuyen,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16
                                          ),
                                        ),
                                      )
                                  ),
                                  Tab(
                                    child: Center(
                                      child: Text(
                                        tTiemChung,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),
                                      ),
                                    )
                                  ),
                                ],
                              ),
                              SizedBox(height: t15Size),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    CoBanTabWidget(controller: controller),
                                    KhamTabWidget(controller: controller),
                                    LoiKhuyenBacSiWidget(controller: controller),
                                    DanhSachLichSuTiemChungWidget(controller: controller),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}




