import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../repository/guardian_repository/guardian_repository.dart';
import '../screen/teacher_chi_tiet_nhan_xet_screen.dart';

class TeacherNhanXetCardWidget extends StatelessWidget {
  final String date;
  final String comment;
  final String teacherID;
  final String guardianID;
  final String replyContent;
  final String commentDate;
  final String replyDate;

  const TeacherNhanXetCardWidget({
    super.key,
    required this.date,
    required this.comment,
    required this.teacherID,
    required this.guardianID,
    required this.replyContent,
    required this.commentDate,
    required this.replyDate,
  });

  @override
  Widget build(BuildContext context) {
    final GuardianRepository guardianRepository = Get.put(GuardianRepository());

    return FutureBuilder<String>(
      future: guardianRepository.getFullNameByGuardianId(guardianID),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Text("Error fetching parent name");
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text("Parent not found");
        } else {
          String parentName = snapshot.data!;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: const Color(0xFFE9EFF7),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phụ huynh HS: $parentName",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: Color(0xFF176D88),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Ngày: $date",
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: ElevatedButton(
                          onPressed: () {
                            // Gọi màn hình chi tiết nhận xét
                            Get.to(() => TeacherChiTietNhanXetScreen(
                              date: date,
                              comment: comment,
                              teacherID: teacherID,
                              guardianID: guardianID,
                              replyContent: replyContent,
                              commentDate: commentDate,
                              replyDate: replyDate,
                              parentName: parentName,
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE8E7FC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                            child: Text(
                              "Xem chi tiết",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}