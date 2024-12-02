import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/teacher/screens/thong_bao/widget/teacher_them_moi_thong_bao_bottom_sheet.dart';
import '../../../controllers/thong_bao/teacher_thong_bao_controller.dart'; // Giữ nguyên
import '../screen/teacher_chi_tiet_thong_bao_screen.dart';

class TeacherDanhSachDaTaoWidget extends StatelessWidget {
  final TeacherThongBaoController controller;

  const TeacherDanhSachDaTaoWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final notifications = controller.notifications; // Cập nhật ở đây

        if (notifications.isEmpty) {
          return const Center(child: Text('Không có thông báo nào.'));
        }

        return ListView.separated(
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final notification = notifications[index]; // Cập nhật ở đây
            return GestureDetector(
              onTap: () {
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
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _showDeleteConfirmationDialog(context, notification);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Gọi Bottom Sheet để thêm mới thông báo
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return TeacherThemMoiThongBaoBottomSheet(); // Gọi Bottom Sheet
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

  void _showDeleteConfirmationDialog(
      BuildContext context, CustomNotification notification) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: const Text('Bạn có chắc muốn xóa thông báo này không?'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                controller.notifications.remove(notification);
                Get.back();
              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }
}
