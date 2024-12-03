import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thong_bao/teacher_thong_bao_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thong_bao/widget/teacher_danh_sach_chung_widget.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thong_bao/widget/teacher_danh_sach_da_tao_widget.dart';

import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_1.dart';
import '../../../../../constants/sizes.dart';


class TeacherThongBaoScreen extends StatelessWidget {

  const TeacherThongBaoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeacherThongBaoController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader1(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: t10Size),
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 16), // Khoảng cách dưới ảnh
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          ),
                          child: const TabBar(
                            automaticIndicatorColorAdjustment: false,
                            unselectedLabelColor: Color(0xFF777777),
                            tabs: [
                              Tab(
                                child: Text(
                                  tThongBaoChung,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  tThongBaoDaTao,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                TeacherDanhSachChungWidget(controller: controller),
                TeacherDanhSachDaTaoWidget(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
