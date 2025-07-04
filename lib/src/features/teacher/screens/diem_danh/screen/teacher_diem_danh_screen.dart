import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_color_and_title.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/diem_danh/teacher_diem_danh_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/diem_danh/screen/teacher_diem_danh_tu_dong_screen.dart';
import 'package:kindergarten_app/src/features/teacher/screens/diem_danh/widget/teacher_diem_danh_card_widget.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
import '../../../../../constants/sizes.dart';
import '../../../../student/models/absent/absent_date_entry.dart';

class TeacherDiemDanhScreen extends StatelessWidget {
  const TeacherDiemDanhScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherDiemDanhController = Get.put(TeacherDiemDanhController());
    teacherDiemDanhController.loadAbsent();

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithColorAndTitle(title: tDiemDanh, hexColor: "#7209B7"),
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: t10Size),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            SizedBox(height: t15Size),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Transform.translate(
                      offset: const Offset(0, 0),
                      child: Container(
                        padding: EdgeInsets.all(t15Size),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                          border: Border.all(width: 2, color: const Color(0xFFC4C4C4)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: WeeklyDatePicker(
                                selectedDay: teacherDiemDanhController.selectedDay.value,
                                changeDay: (value) {
                                  teacherDiemDanhController.selectedDay.value = value;
                                },
                                backgroundColor: const Color(0xFFCAF0F8),
                                selectedDigitBackgroundColor: const Color(0xFFBA83DE),
                                selectedDigitColor: const Color(0xFF03045E),
                                digitsColor: const Color(0xFF03045E),
                                weekdayTextColor: const Color(0xFF03045E),
                                enableWeeknumberText: false,
                              ),
                            )),
                            SizedBox(height: t15Size),
                            Obx(() {
                              teacherDiemDanhController.loadAbsent();
                              return FutureBuilder(
                                future: teacherDiemDanhController.fetchAttendance(teacherDiemDanhController.selectedDay.value),
                                builder: (context, snapshot) {
                                  var attendanceData = snapshot.data;
                                  if (snapshot.connectionState == ConnectionState.waiting){
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: attendanceData!.map<Widget>((studentData) {
                                        String studentName = studentData['name'];
                                        var attendanceDetails = studentData['attendanceDetails'];

                                        // Chuyển đổi attendanceDetails thành AttendanceDetail
                                        AttendanceDetail updatedAttendanceDetail = AttendanceDetail.fromMap(attendanceDetails);

                                        return TeacherDiemDanhCardWidget(
                                          studentName: studentName,
                                          attendanceDetails: updatedAttendanceDetail.toMap(), // Chuyển đổi lại thành Map nếu cần
                                          onUpdate: (updatedDetails) {
                                            // Cập nhật thông tin từ card vào controller
                                            teacherDiemDanhController.attendanceRecords[studentData['studentId']]['absentData'] = AbsentDateEntry.fromMap(updatedDetails);
                                          },
                                        );
                                    }).toList(),
                                  );
                                }
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // Hai nút ở footer
            Padding(
              padding: EdgeInsets.all(t10Size),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: t5Size),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0), // Bo góc
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 13.0), // Kích thước nút
                        ),
                        onPressed: () {
                          // Gọi hàm cập nhật trong controller
                          teacherDiemDanhController.updateAttendance();
                        },
                        child: const Text(
                          "Lưu",
                          style: TextStyle(fontSize: 18, color: Colors.white), // Kích thước và màu chữ
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Bo góc
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 5.0), // Kích thước nút
                      ),
                      onPressed: () {
                        Get.to(()=>const TeacherDiemDanhTuDongScreen());
                      },
                      child: const Center(
                        child: Text(
                          tDiemDanhTuDong,
                          style: TextStyle(fontSize: 16, color: Colors.white), // Kích thước và màu chữ
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: t5Size),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF7209B7), // Màu tím
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0), // Bo góc
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15.0), // Kích thước nút
                        ),
                        onPressed: () {
                          // Logic quay lại
                          Get.back();
                        },
                        child: const Text(
                          tQuayLai,
                          style: TextStyle(fontSize: 18, color: Colors.white), // Kích thước và màu chữ
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}