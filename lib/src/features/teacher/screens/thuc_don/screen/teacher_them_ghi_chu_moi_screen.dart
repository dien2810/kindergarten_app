import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/thuc_don/teacher_them_ghi_chu_moi_controller.dart';

class TeacherThemGhiChuMoiScreen extends StatelessWidget {
  const TeacherThemGhiChuMoiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themMoiGhiChuController = Get.put(TeacherThemGhiChuMoiController());
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const GuardianAppBarWithTitleWidget(title: tThucDon),
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
                            tThucDon,
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
                      height: 600,
                      padding: EdgeInsets.all(t15Size),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(width:2,color:const Color(0xFFC4C4C4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: t10Size,),
                          const Text(
                            tThemGhiChuMoi,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF03045E)
                            ),
                          ),
                          Card(
                              color: const Color(0xFFA6A3A3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                        padding: EdgeInsets.all(t10Size),
                                        child: const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                tTenMon,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      height: t10Size*12,
                                      child: const ClipRRect(
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(tThucDonBuaSang)
                                        ),
                                      ),
                                    )
                                  )
                                ],
                              )
                          ),
                          SizedBox(height: t10Size,),
                          SizedBox(
                            width: double.infinity,
                            height: t100Size*2,
                            child: Card(
                              color: const Color(0xFF2A2424),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(t20Size),
                                child: TextFormField(
                                  maxLines: null,
                                  controller: themMoiGhiChuController.noiDungGhiChu,
                                  decoration: const InputDecoration(
                                    hintText: tNoiDungGhiChu,
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
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
                          const Spacer(flex: 5),
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
                                  padding: EdgeInsets.all(t10Size),
                                  child: const Text(
                                    tThemMoi,
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
                                    padding: EdgeInsets.all(t10Size),
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
                          const Spacer(flex: 1),
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
