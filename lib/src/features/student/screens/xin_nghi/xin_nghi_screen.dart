import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/xin_nghi/xin_nghi_controller.dart';
import 'package:kindergarten_app/src/features/student/screens/xin_nghi/tao_don_xin_nghi/tao_don_xin_nghi_screen.dart';

import '../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../models/dayoff_model/dayoff_model.dart';

class XinNghiScreen extends StatelessWidget {
  const XinNghiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final xinNghiController = Get.put(XinNghiController());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tXinNghi),
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
                            tDanhSachDonXinNghi,
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
                      height: t100Size*4,
                      padding: EdgeInsets.all(t15Size),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: FutureBuilder<DayoffModel?>(
                              future: xinNghiController.getXinNghiData(),
                              builder: (context,snapshot){
                                // Trạng thái đang tải
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: CircularProgressIndicator());
                                }

                                // Trạng thái lỗi
                                if (snapshot.hasError) {
                                  return Center(child: Text('Error: ${snapshot.error}'));
                                }

                                // Kiểm tra dữ liệu null
                                if (!snapshot.hasData || snapshot.data == null) {
                                  return const Center(child: Text('No Data Available'));
                                }
                                //Có dữ liệu
                                final dayOff = snapshot.data!;
                                final dateEntries = dayOff.dates.entries.toList(); // Lấy tất cả các field
                                return ListView.builder(
                                  itemCount: dateEntries.length,
                                  itemBuilder: (context, index){
                                    final date = dateEntries[index].key;
                                    final details = dateEntries[index].value;
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(t10Size),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: const Color(0xFFE9EFF7)
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    tDon+(index+1).toString(),
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                  Text(
                                                    tNgay+date,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: t5Size,),
                                              Text(
                                                tTrangThai+details.status,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: t5Size,),
                                              Text(
                                                tNgayNghi+date,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(height: t5Size,),
                                              Text(
                                                tNoiDung+details.content,
                                                maxLines: null,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: t10Size)
                                      ],
                                    );
                                  }
                                );
                              },
                            ),
                          ),

                          SizedBox(height: t10Size,),
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
                                    Get.to(()=>const TaoDonXinNghiScreen());
                                  },
                                  child: const Text(
                                    tTaoDonXinNghi,
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
                          SizedBox(height: t30Size,)

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
