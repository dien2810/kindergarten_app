import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../../common_widgets/cloud_image/cloud_image_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../utils/helper_controller/helper_controller.dart';
import '../../../controllers/chuyen_can/chuyen_can_controller.dart';

class XemChiTietAnhCheckinScreen extends StatelessWidget {
  const XemChiTietAnhCheckinScreen({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    //final guardianNavigationMenuController = Get.put(GuardianNavigationMenuController());
    final chuyenCanController = Get.put(ChuyenCanController());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tChuyenCan),
        //bottomNavigationBar: BottomNavigationBarWidget(controller: guardianNavigationMenuController),
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
                      borderRadius: BorderRadius.all(Radius.circular(25.0))
                  ),
                  child: const TabBar(
                    automaticIndicatorColorAdjustment: false,
                    unselectedLabelColor: Color(0xFF777777),
                    tabs: [
                      Tab(
                          child: Text(
                            tChuyenCan,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: t15Size),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: t100Size*6,
                      padding: EdgeInsets.all(t15Size),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(()=> Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0)
                            ),
                            child: WeeklyDatePicker(
                              selectedDay: chuyenCanController.selectedDay.value, // DateTime
                              changeDay: (value) {
                                chuyenCanController.selectedDay.value = value;
                              },
                              backgroundColor: const Color(0xFFCAF0F8),
                              selectedDigitBackgroundColor: const Color(0xFFBA83DE),
                              selectedDigitColor: const Color(0xFF03045E),
                              digitsColor: const Color(0xFF03045E),
                              weekdayTextColor: const Color(0xFF03045E),
                              enableWeeknumberText: false,
                            ),
                          )),
                          SizedBox(height: t10Size,),
                          Obx(()=>FutureBuilder(
                              future: chuyenCanController.getAbsentByDateTime(
                                  chuyenCanController.selectedDay.value
                              ),
                              builder: (context, snapshot){
                                if (snapshot.connectionState == ConnectionState.waiting){
                                  return const Center(child: CircularProgressIndicator());
                                }
                                else if (snapshot.hasError) {
                                  return Center(child: Text('Error: ${snapshot.error}'));
                                }
                                else if (!snapshot.hasData || snapshot.data==null) {
                                  return const Center(child: Text('Không có dữ liệu.'));
                                }
                                else {
                                  final thu = Helper.formatDateTime(chuyenCanController.selectedDay.value);
                                  final absentDate = snapshot.data!;
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        thu,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 24,
                                            color: Color(0xFF03045E)
                                        ),
                                      ),
                                      SizedBox(height: t15Size),
                                      const Text(
                                        tAnhCheckin,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: t15Size),
                                      Text(
                                        '$tThoiGianVaoLop: ${absentDate.checkinTime}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: t10Size),
                                      CloudImage(
                                        publicId: imageUrl,
                                      ),
                                      // Container(
                                      //   height: t100Size * 2.5,
                                      //   color: const Color(0xFFD9D9D9),
                                      // ),
                                    ],
                                  );
                                }
                              }

                            ),
                          ),
                          SizedBox(height: t15Size),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: t10Size*25,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF03045E),
                                  borderRadius: BorderRadius.circular(t50Size),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    tQuayLaiTrangTruoc,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: "Outfit",
                                        color: tWhiteColor
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  )
                ],
              ),
            )
          ],
        ),
      ),


    );
  }
}
