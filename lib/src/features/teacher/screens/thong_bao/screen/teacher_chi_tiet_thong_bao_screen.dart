import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thong_bao/teacher_thong_bao_controller.dart';
import 'package:kindergarten_app/src/repository/teacher_repository/teacher_repository.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/text_strings.dart';

class TeacherChiTietThongBaoScreen extends StatelessWidget {
  final notification;

  const TeacherChiTietThongBaoScreen({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    TeacherThongBaoController controller = TeacherThongBaoController();

    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader2(title: tChiTietThongBao),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: const Icon(
                    Icons.calendar_today,
                    color: Colors.amber,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        notification.dateSent,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                        ),
                      ),
                      FutureBuilder<String>(
                        future: controller.getTeacherName(notification.sentBy),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text(
                              'Loading...',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Error: ${snapshot.error}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                              ),
                            );
                          } else if (snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            );
                          } else {
                            return const Text(
                              'No data available',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            const SizedBox(height: 16),
            Text(
              notification.message.replaceAll("\\n", "\n"),
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.justify,
              softWrap: true,
            ),
            const Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.back();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF380543),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.0),
                      child: Text(
                        tQuayLaiTrangTruoc,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}