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
      appBar:const GuardianAppBarWithTitleWidget(title: "Chi tiết tin tức"),
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
            const SizedBox(height: 20),
            ...news.subtitles.map((subtitle) {
              String content = subtitle.content.replaceAll('\\n', '\n');
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subtitle.subtitleName == 'none' ? '' : subtitle.subtitleName,
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        children: content.split('\n').map((part) {
                          return TextSpan(
                            text: part + '\n',
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),

          ],
        ),
      ),
    ),
    );
  }
}





