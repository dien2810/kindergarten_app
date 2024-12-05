import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../models/news/newModel.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel news;

  const NewsDetailScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const GuardianAppBarWithTitleWidget(title: "CHI TIẾT TIN TỨC"),
      body: SingleChildScrollView(
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: FlutterFlowTheme.of(context).title1,
            ),
            const SizedBox(height: 10),
            Text(
              'Ngày tạo: ${news.createDate}',
              style: FlutterFlowTheme.of(context).subtitle2,
            ),
            const SizedBox(height: 20),
            ...news.subtitles.map((subtitle) => Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(

                    subtitle.subtitleName == 'none' ? '': subtitle.subtitleName,
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                  const SizedBox(height: 5),
                  Text(subtitle.content),
                ],
              ),
            )).toList(),
            const SizedBox(height: 20),
            if (news.fileUrl != 'none')
            const SizedBox(height: 20),
            Text(
              'Tác giả: ${news.authorID}',
              style: FlutterFlowTheme.of(context).subtitle2,
            ),
          ],
        ),
      ),
    ),
    );
  }
}
