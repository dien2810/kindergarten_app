import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_color_and_title.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/xin_nghi/teacher_xin_nghi_controller.dart';
import 'package:kindergarten_app/src/features/teacher/screens/xin_nghi/screen/teacher_chi_tiet_don_xin_nghi_screen.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
import '../../../../../constants/sizes.dart';
import '../widget/teacher_xin_nghi_card_widget.dart';

class TeacherDanhSachXinNghiScreen extends StatelessWidget {
  const TeacherDanhSachXinNghiScreen({super.key, required this.studentIds});
  final List<String> studentIds;

  @override
  Widget build(BuildContext context) {
    final teacherXinNghiController = Get.put(TeacherXinNghiController());
    teacherXinNghiController.studentIds = studentIds;
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithColorAndTitle(title: tXinNghi, hexColor: "#480CA8"),
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
                                selectedDay: teacherXinNghiController.selectedDay.value,
                                changeDay: (value) {
                                  teacherXinNghiController.selectedDay.value = value; // Cập nhật ngày đã chọn
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
                              return FutureBuilder(
                                future: teacherXinNghiController.fetchEventsForDay(
                                  teacherXinNghiController.selectedDay.value
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting){
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                  else if (snapshot.hasError) {
                                    return Center(child: Text('Error: ${snapshot.error}'));
                                  }
                                  else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                    return const Center(child: Text('Không có dữ liệu.'));
                                  }
                                  final dayoffEntryList = snapshot.data;
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: dayoffEntryList?.length,
                                    itemBuilder: (context, index){
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(() => TeacherChiTietDonXinNghiScreen(
                                            dayoffEntry: dayoffEntryList[index],
                                            studentIds: studentIds,
                                            index: index
                                          ));
                                        },
                                        child: TeacherXinNghiCardWidget(
                                          dayoffEntry: dayoffEntryList![index],
                                          studentIds: studentIds,
                                          index: index
                                        )
                                      );

                                    }

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
          ],
        ),
      ),
    );
  }
}