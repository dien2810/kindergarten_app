import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/thong_bao/teacher_thong_bao_controller.dart';
import '../screen/teacher_chi_tiet_thong_bao_screen.dart';

class TeacherDanhSachChungWidget extends StatelessWidget {
  final TeacherThongBaoController controller;

  const TeacherDanhSachChungWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final notifications = controller.notificationList;

        if (notifications.isEmpty) {
          return const Center(child: Text('Không có thông báo nào.'));
        }

        return ListView.separated(
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return GestureDetector(
              onTap: () {
                // Chuyển hướng đến trang thông báo chi tiết
                Get.to(() =>
                    TeacherChiTietThongBaoScreen(notification: notification));
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
      }),
    );
  }
}