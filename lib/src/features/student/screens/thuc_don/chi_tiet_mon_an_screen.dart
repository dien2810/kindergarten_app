import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/thuc_don/them_ghi_chu_moi_screen.dart';

import '../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../common_widgets/cloud_image/cloud_image_widget.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../models/menu/menu_item.dart';

class ChiTietMonAnScreen extends StatelessWidget {
  const ChiTietMonAnScreen({super.key, required this.menuItem});
  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
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
                          SizedBox(height: t10Size,),
                          const Text(
                            tChiTietMonAn,
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
                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                        padding: EdgeInsets.all(t10Size),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                '$tTenMon ${menuItem.name}',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
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
                                        child: ClipRRect(
                                          child: CloudImage(
                                              publicId: menuItem.image,
                                              width: t50Size,
                                              height: t90Size,
                                              fit: true
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
                             child: Card(
                              color: const Color(0xFFF2EDED),
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(t10Size),
                                child: Text(
                                  '$tThanhPhanCoTrongMonAn${menuItem.ingredients.toString()}',
                                  style: const TextStyle(
                                    color: Colors.black
                                  ),
                                ),
                              ),
                             ),
                           ),
                          const Spacer(flex: 1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2058E9),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                      )
                                  ),
                                  onPressed: () {
                                    Get.off(ThemGhiChuMoiScreen(menuItem: menuItem,));
                                  },
                                  child: const Text(
                                    tThemGhiChu,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: t5Size),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF6BC5FF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                      )
                                  ),
                                  child: const Text(
                                    tHuy,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: t10Size,)
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
