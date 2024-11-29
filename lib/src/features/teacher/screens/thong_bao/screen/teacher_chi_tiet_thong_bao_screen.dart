import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import '../../../../../constants/text_strings.dart';

class TeacherChiTietThongBaoScreen extends StatelessWidget {
  final notification;

  const TeacherChiTietThongBaoScreen({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
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
                      Text(
                        notification.sentBy,
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
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            const SizedBox(height: 16),
            Text(
              notification.message.replaceAll("\\n", "\n"), // Thay thế ký hiệu \n bằng dòng mới
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.justify, // Căn đều nội dung
              softWrap: true, // Cho phép tự động xuống dòng
            ),
            const Spacer(), // Tạo khoảng trống để đẩy nút xuống cuối
            Center( // Căn giữa nút
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back with a post-frame callback
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Get.back(); // Quay lại màn hình trước
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
                        "Quay lại trang trước",
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