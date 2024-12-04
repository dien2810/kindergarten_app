import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/sizes.dart';
import '../widget/hoat_dong_widget.dart';
import '../widget/su_kien_widget.dart';


class TeacherHoatDongSuKienScreen extends StatelessWidget {
  const TeacherHoatDongSuKienScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tHoatDongSuKien),
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
              SizedBox(height: t10Size),
              SizedBox(
                height: t100Size*3.25,
                child: TabBarView(
                  children: [
                    const TeacherHoatDongWidget(),
                    TeacherSuKienWidget()
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
