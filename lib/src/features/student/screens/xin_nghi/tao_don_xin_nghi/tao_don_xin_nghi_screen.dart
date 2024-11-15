import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/controllers/xin_nghi/tao_don_xin_nghi_controller.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../../constants/sizes.dart';

class TaoDonXinNghiScreen extends StatelessWidget {
  const TaoDonXinNghiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taoDonXinNghiController = Get.put(TaoDonXinNghiController());
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
                            tTaoDonXinNghi,
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
                      height: t150Size*100,
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
                              selectedDay: taoDonXinNghiController.selectedDay.value, // DateTime
                              changeDay: (value) {
                                taoDonXinNghiController.selectedDay.value = value;
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
                          const Text(
                            tThu5,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                                color: Color(0xFF03045E)
                            ),
                          ),
                          Obx(()=> Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RadioListTile<XinNghi>(
                                title: const Text(tNghiCaNgay),
                                value: XinNghi.caNgay,
                                groupValue: taoDonXinNghiController.xinNghiStatus.value,
                                tileColor: Colors.deepPurple.shade50,
                                onChanged: (val){
                                  taoDonXinNghiController.xinNghiStatus.value = val!;
                                },
                              ),
                              RadioListTile<XinNghi>(
                                title: const Text(tNghiTheoTietTrongNgay),
                                value: XinNghi.theoTiet,
                                groupValue: taoDonXinNghiController.xinNghiStatus.value,
                                tileColor: Colors.deepPurple.shade50,
                                onChanged: (val){
                                  taoDonXinNghiController.xinNghiStatus.value = val!;
                                },
                              ),
                            ],
                          ),
                          ),
                          Obx((){
                            print('Render---------');
                            if (taoDonXinNghiController.xinNghiStatus.value == XinNghi.theoTiet){
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: t10Size),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CheckboxListTile(
                                      title: const Text(tNghiCaNgay),
                                      value: taoDonXinNghiController.donTre.value,
                                      tileColor: Colors.deepPurple.shade50,
                                      controlAffinity: ListTileControlAffinity.leading,
                                      onChanged: (val){
                                        taoDonXinNghiController.donTre.value = val!;
                                      },
                                    ),
                                    CheckboxListTile(
                                      title: const Text(tNghiTheoTietTrongNgay),
                                      value: taoDonXinNghiController.tapTheDucBuoiSang.value,
                                      tileColor: Colors.deepPurple.shade50,
                                      controlAffinity: ListTileControlAffinity.leading,
                                      onChanged: (val){
                                        taoDonXinNghiController.tapTheDucBuoiSang.value = val!;
                                      },
                                    ),

                                    SizedBox(height: t5Size,)
                                  ],
                                ),
                              );
                            }
                            return SizedBox(height: t5Size,);
                          }
                          ),
                          SizedBox(height: t15Size,),
                          SizedBox(
                            width: double.infinity,
                            height: t100Size*2,
                            child: Card(
                              color: const Color(0xFFCAF0F8),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(t10Size),
                                child: TextFormField(
                                  maxLines: null,
                                  controller: taoDonXinNghiController.lyDoNghi,
                                  decoration: const InputDecoration(
                                      hintText: tLyDoNghi,
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none
                                      )
                                  ),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: t10Size,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF2058E9),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30)
                                    )
                                ),
                                onPressed: () {

                                },
                                child: Container(
                                  padding: EdgeInsets.all(t15Size),
                                  child: const Text(
                                    tXinNghi,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: t5Size),
                              SizedBox(
                                width: t120Size,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF6BC5FF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                      )
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(t15Size),
                                    child: const Text(
                                      tHuy,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
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
