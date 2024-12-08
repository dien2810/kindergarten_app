import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/repository/teacher_repository/teacher_repository.dart';

class TeacherChiTietNhanXetScreen extends StatelessWidget {
  final String date;
  final String comment;
  final String teacherID;
  final String guardianID;
  final String replyContent;
  final String commentDate;
  final String replyDate;
  final String parentName;

  const TeacherChiTietNhanXetScreen({
    Key? key,
    required this.date,
    required this.comment,
    required this.teacherID,
    required this.guardianID,
    required this.replyContent,
    required this.commentDate,
    required this.replyDate,
    required this.parentName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TeacherRepository teacherRepository = Get.put(TeacherRepository());

    // In ra giá trị teacherID
    print("Teacher ID: $teacherID");

    return FutureBuilder<String>(
      future: teacherRepository.getFullNameByTeacherID(teacherID),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            appBar: TeacherAppBarWithTitleHeader2(title: tChiTietNhanXet),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return const Scaffold(
            appBar: TeacherAppBarWithTitleHeader2(title: tChiTietNhanXet),
            body: Center(child: Text("Error fetching teacher name")),
          );
        } else {
          String teacherName = snapshot.data!;

          // Lấy chiều rộng của màn hình
          final double screenWidth = MediaQuery.of(context).size.width;

          return Scaffold(
            appBar: const TeacherAppBarWithTitleHeader2(title: tChiTietNhanXet),
            body: Column(
              children: [
                // Khung cho nhận xét
                Container(
                  width: screenWidth,
                  height: 200,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Giáo viên chủ nhiệm Pooh 01 : $teacherName",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Ngày nhận xét: $date",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Nội dung nhận xét: $comment",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Khung cho phản hồi
                Container(
                  width: screenWidth,
                  height: 200,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F0FE),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tên phụ huynh: $parentName",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Ngày phản hồi: $replyDate",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Nội dung phản hồi: $replyContent",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                // Nút quay lại
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF380543),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
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
              ],
            ),
          );
        }
      },
    );
  }
}