import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thong_bao/widget/teacher_them_moi_thong_bao_bottom_sheet.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../student/models/notifications/notifications_model.dart';
import '../../../controllers/thong_bao/teacher_thong_bao_controller.dart';
import '../screen/teacher_chi_tiet_thong_bao_screen.dart';

class TeacherDanhSachDaTaoWidget extends StatelessWidget {
  const TeacherDanhSachDaTaoWidget({super.key, required this.controller});
  final TeacherThongBaoController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(tDanhSachThongBaoDaTao),
      ),
      body: Obx(() {
          return FutureBuilder<List<NotificationsModel>>(
            future: controller.notificationsFuture.value ?? controller.getNotificationsCreatedByTeacher(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Lỗi: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text(tKhongCoThongBaoNao));
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
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              if (notification.id != null) {
                                _showDeleteConfirmationDialog(context, notification.id!);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text(tIDThongBaoKhongHopLe)),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
          });
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Gọi Bottom Sheet để thêm mới thông báo
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return const TeacherThemMoiThongBaoBottomSheet(); // Gọi Bottom Sheet
            },
          );
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        // Thay đổi màu biểu tượng thành trắng
        child: const Icon(
          Icons.add,
          size: 36, // Thay đổi kích thước biểu tượng
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String notificationID) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(tXacNhanXoa),
          content: const Text(tBanCoChacMuonXoaThongBao),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(tHuy),
            ),
            TextButton(
              onPressed: () async {
                await controller.deleteNotification(notificationID);
                await controller.reloadNotifications();
                Get.back();
              },
              child: const Text(tXoa),
            ),
          ],
        );
      },
    );
  }
}
