import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/circle_cloud_image_widget.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_chuyen_can/widget/teacher_chuyen_can_card_widget.dart';

import '../../../../controllers/chuyen_can/teacher_chuyen_can_hoc_sinh_controller.dart';

class TeacherChuyenCanHocSinhScreen extends StatelessWidget {
  final String studentName;
  final String imageUrl;

  const TeacherChuyenCanHocSinhScreen({
    super.key,
    required this.studentName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final TeacherChuyenCanHocSinhController controller =
    Get.put(TeacherChuyenCanHocSinhController());

    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader2(title: tChuyenCan),
      body: Stack(
        children: [
          Column(
            children: [
              // Avatar và tên học sinh
              _buildStudentProfile(context, imageUrl, studentName),
              // Danh sách vắng mặt
              Expanded(
                child: Obx(() {
                  // Get the absent data
                  var absentRecords = controller.absentData;
                  return ListView.builder(
                    itemCount: absentRecords.length,
                    itemBuilder: (context, index) {
                      String studentId = absentRecords.keys.elementAt(index);
                      var studentData = absentRecords[studentId]!;

                      // Get and sort the dates
                      var dates = studentData['dates'] as Map<String, dynamic>;
                      var sortedDates = controller.sortDates(dates); // Sort dates

                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Status Counts Section
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        color: Colors.red, // Color for "Vắng không phép"
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${controller.countWithoutPermission}",
                                          style: const TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                      ),
                                      const Text("Vắng không phép", style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 10), // Space between rows
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        color: Colors.blue, // Color for "Vắng có phép"
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${controller.countWithPermission}",
                                          style: const TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                      ),
                                      const Text("Vắng có phép", style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 10), // Space between rows
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        color: Colors.grey, // Color for "Đến muộn"
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${controller.countLate}",
                                          style: const TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                      ),
                                      const Text("Đến muộn", style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: t20Size,),
                              Text(
                                "Học kỳ: ${studentData['semesterID']}",
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Số ngày vắng: ${studentData['amountOfDayOff']}",
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              // Iterate through the sorted dates
                              ...sortedDates.map<Widget>((dateEntry) {
                                String date = dateEntry.key; // Correctly retrieve the date
                                var details = dateEntry.value;
                                // Create your AbsentDetailCard for each sorted date
                                return TeacherChuyenCanCardWidget(
                                  studentName: studentName, // Pass student name
                                  date: date,
                                  details: studentData['dates'][date],
                                );
                              }), // Convert the mapped results to a List<Widget>
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              // Nút Quay lại
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(); // Quay lại màn hình trước
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
            ],
          ),
        ],
      ),
    );
  }

  // Hàm xây dựng phần avatar và tên học sinh
  Widget _buildStudentProfile(BuildContext context, String imageUrl, String studentName) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            child: CircleCloudImageWidget(publicId: imageUrl)
            // backgroundImage: imageUrl.startsWith('http')
            //     ? NetworkImage(imageUrl)
            //     : AssetImage(imageUrl) as ImageProvider,
          ),
          const SizedBox(height: 8),
          Text(
            studentName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const Text(
            "CHUYÊN CẦN ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7B7B7B),
            ),
          ),
          const Text(
            "HK 1 2024 - 2025", // chỗ này thay bằng semester_id_1 -> semesterName
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7B7B7B),
            ),
          ),
        ],
      ),
    );
  }
}