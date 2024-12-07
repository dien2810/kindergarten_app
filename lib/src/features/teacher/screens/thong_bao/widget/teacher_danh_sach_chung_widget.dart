import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thong_bao/teacher_thong_bao_controller.dart';
import '../../../../student/models/notifications/notifications_model.dart';
import '../screen/teacher_chi_tiet_thong_bao_screen.dart';

class TeacherDanhSachChungWidget extends StatelessWidget {
  const TeacherDanhSachChungWidget({Key? key, required this.controller})
      : super(key: key);
  final TeacherThongBaoController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách thông báo'),
      ),
      body: FutureBuilder<List<NotificationsModel>>(
        future: controller.getNotificationsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Không có thông báo nào.'));
          }

          final notifications = snapshot.data!;
          return ListView.separated(
            itemCount: notifications.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => TeacherChiTietThongBaoScreen(notification: notification));
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
