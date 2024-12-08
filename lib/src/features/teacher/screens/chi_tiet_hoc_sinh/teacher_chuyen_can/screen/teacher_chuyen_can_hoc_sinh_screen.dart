import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/circle_cloud_image_widget.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/screens/chi_tiet_hoc_sinh/teacher_chuyen_can/widget/teacher_chuyen_can_card_widget.dart';

import '../../../../../student/models/student/student_model.dart';
import '../../../../controllers/chuyen_can/teacher_chuyen_can_hoc_sinh_controller.dart';

class TeacherChuyenCanHocSinhScreen extends StatelessWidget {
  final StudentModel student;

  const TeacherChuyenCanHocSinhScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final TeacherChuyenCanHocSinhController controller =
        Get.put(TeacherChuyenCanHocSinhController());

    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader2(title: tChuyenCan),
      body: Column(
        children: [
          // Avatar và tên học sinh
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                CircleAvatar(
                    radius: 60,
                    child: CircleCloudImageWidget(
                        publicId: student.studentDocument.image)
                    // backgroundImage: imageUrl.startsWith('http')
                    //     ? NetworkImage(imageUrl)
                    //     : AssetImage(imageUrl) as ImageProvider,
                    ),
                const SizedBox(height: 8),
                Text(
                  student.studentProfile.name,
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
                  "HK 1 2024 - 2025",
                  // chỗ này thay bằng semester_id_1 -> semesterName
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7B7B7B),
                  ),
                ),
              ],
            ),
          ),
          // Danh sách vắng mặt
          Expanded(
            child: FutureBuilder(
                future: controller.fetchAbsentData(student),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('Không có dữ liệu.'));
                  }
                  final absent = snapshot.data;
                  controller.countAbsences();
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      color: Colors.red,
                                      // Color for "Vắng không phép"
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${controller.countWithoutPermission}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    const Text("Vắng không phép",
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // Space between rows
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      color: Colors.blue,
                                      // Color for "Vắng có phép"
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${controller.countWithPermission}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    const Text("Vắng có phép",
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // Space between rows
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      color: Colors.grey,
                                      // Color for "Đến muộn"
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${controller.countLate}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    const Text("Đến muộn",
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: t10Size,
                            ),
                            const Text(
                              // "Học kỳ: ${absent?.semesterID}",
                              "Học kỳ: HK1 2024-2025",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            // Text(
                            //   "Số ngày vắng: ${absent?.amountOfDayOff}",
                            //   style: const TextStyle(
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: absent?.dates.length,
                                // shrinkWrap: true,
                                // physics:
                                //     const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return TeacherChuyenCanCardWidget(
                                    studentName: student.studentProfile
                                        .name, // Pass student name
                                    absentDate: absent!.dates.values
                                        .elementAt(index),
                                  );
                                }
                              ),
                            ),
                            // Convert the mapped results to a List<Widget>
                          ],
                        ),
                      ));
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
    );
  }
}
