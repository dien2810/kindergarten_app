import 'package:flutter/material.dart';

import 'package:kindergarten_app/src/constants/text_strings.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/sizes.dart';
import '../widget/teacher_dan_thuoc_list_view_widget.dart';

class TeacherDanThuocScreen extends StatelessWidget {
  const TeacherDanThuocScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2(title: tDanThuoc),
        body: Column(
          children: [
            const Text(
              tChiTietDonThuoc,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: Color(0xFFBA83DE),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: t10Size),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                ),
              ),
            ),
            SizedBox(height: t15Size),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Transform.translate(
                      offset: const Offset(0, 0),
                      child: Container(
                        height: 700,
                        padding: EdgeInsets.all(t15Size),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(35.0)),
                          border: Border.all(
                              width: 2, color: const Color(0xFFC4C4C4)),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TeacherDanThuocListViewWidget(),
                            )
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
    );
  }
}
