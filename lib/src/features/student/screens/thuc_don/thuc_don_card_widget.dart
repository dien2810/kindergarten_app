import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/cloud_image_widget.dart';
import 'package:kindergarten_app/src/features/student/screens/thuc_don/chi_tiet_mon_an_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/thuc_don/them_ghi_chu_moi_screen.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../models/menu/menu_item.dart';

class ThucDonCardWidget extends StatelessWidget {
  const ThucDonCardWidget({
    super.key, required this.menuItem,
  });
  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(ChiTietMonAnScreen(menuItem: menuItem,));
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFA6A3A3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.all(t10Size),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$tTenMon${menuItem.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                          ),
                        ),
                        const Text(
                          tLuaChon,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14
                          ),
                        ),
                        SizedBox(height: t5Size,),
                        ElevatedButton(
                          onPressed: (){
                            Get.to(ThemGhiChuMoiScreen(menuItem: menuItem,));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFCAF0F8),
                              foregroundColor: const Color(0xFF727070),
                              padding: EdgeInsets.symmetric(horizontal: t30Size),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)
                              )
                          ),
                          child: const Text(
                            tThemGhiChu,
                            style: TextStyle(
                                fontSize: 12
                            ),
                          ),
                        )
                      ],
                    )
                ),
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: t90Size,
                    child: ClipRRect(
                      child: CloudImage(
                        publicId: menuItem.image,
                        width: t50Size,
                        height: t90Size,
                        fit: true
                      ),
                      // child: Image(
                      //   fit: BoxFit.cover,
                      //   image: AssetImage(tThucDonBuaSang)
                      // ),
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}