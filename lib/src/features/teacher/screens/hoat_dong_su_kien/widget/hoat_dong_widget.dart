import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/hoat_dong_su_kien/livestream_video_sdk/join_screen.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/hoat_dong_su_kien/teacher_hoat_dong_su_kien_controller.dart';
import '../screen/chi_tiet_hoat_dong_screen.dart';

class TeacherHoatDongWidget extends StatelessWidget {
  const TeacherHoatDongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final hoatDongController = Get.put(TeacherHoatDongSuKienController());

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: t100Size * 20,
                padding: EdgeInsets.all(t15Size),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  border: Border.all(width: 2, color: const Color(0xFFC4C4C4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0)),
                          child: WeeklyDatePicker(
                            selectedDay: hoatDongController.selectedDay.value,
                            // DateTime
                            changeDay: (value) {
                              hoatDongController.fetchEventsForDay(value); // Fetch events for selected day
                            },
                            backgroundColor: const Color(0xFFCAF0F8),
                            selectedDigitBackgroundColor:
                                const Color(0xFFBA83DE),
                            selectedDigitColor: const Color(0xFF03045E),
                            digitsColor: const Color(0xFF03045E),
                            weekdayTextColor: const Color(0xFF03045E),
                            enableWeeknumberText: false,
                          ),
                        )),
                    SizedBox(height: t10Size), // Video button
                    const Row(children: [
                      Expanded(
                        child: Text(
                          tGiamSatHoatDongTrongNgay,
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF767676),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //Navigate to livestream screen
                            // Get.to(() => VideoGiamSatScreen());
                            Get.to(()=>JoinScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD74971),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                tLiveStream,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: t5Size),
                    const Text(
                      tLichSuHoatDong,
                      style: TextStyle(
                        color: Color(0xFF767676),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: t15Size,),
                    Expanded(
                      child: Obx(() {
                        return FutureBuilder(
                            future: hoatDongController.fetchEventsForDay(
                                hoatDongController.selectedDay.value
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Align(
                                  alignment: Alignment.topCenter,
                                  child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Align(
                                  alignment: Alignment.topCenter,
                                  child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return const Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(tKhongCoDuLieu));
                              } else {
                                final listEvent = snapshot.data!;
                                return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        listEvent.length,
                                    itemBuilder: (context, index) {
                                      final event = listEvent[index];
                                      return Container(
                                        margin: const EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          children: [
                                            // Vertical line
                                            Container(
                                              width: 2,
                                              // Width of the vertical line
                                              height: 150,
                                              // Height of the line (now extends through the entire list)
                                              color: const Color(0xFFB2B2B2), // Line color
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${event.startTime} - ${event.endTime}',
                                                  // Concatenate startTime and endTime
                                                  style: const TextStyle(
                                                    color: Color(0xFFD74971),
                                                    fontSize: 16, // Time color
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                // Event Card
                                                Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  elevation: 4,
                                                  child: Container(
                                                    width: t100Size * 1.9,
                                                    // Increased card width
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(event.activityName,
                                                            style: const TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 16)
                                                        ),
                                                        const SizedBox(height: 5),
                                                        Text(event.location),
                                                        const SizedBox(height: 10),
                                                        // Xem chi tiết button with border and background color
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            final typeOfActivity = await hoatDongController.getTypeOfActivity(event);
                                                            hoatDongController.typeOfActivity = typeOfActivity!;
                                                            hoatDongController.eventIndex = index;
                                                            // Navigate to event details page
                                                            Get.to(() => TeacherChiTietHoatDongScreen(
                                                                typeOfActivity: typeOfActivity
                                                            ));
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                const Color(0xFFD74971),
                                                            side:
                                                                const BorderSide(
                                                                    color: Color(0xFFD74971),
                                                                    width: 1
                                                                ),
                                                            // Border width
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(30), // Rounded corners
                                                            ),
                                                          ),
                                                          child: const Text(
                                                              tXemChiTietButton,
                                                              style: TextStyle(color: Colors.white)
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              }
                            });
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
