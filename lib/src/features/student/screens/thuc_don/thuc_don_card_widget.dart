import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/screens/thuc_don/chi_tiet_mon_an_screen.dart';
import 'package:kindergarten_app/src/features/student/screens/thuc_don/them_ghi_chu_moi_screen.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class ThucDonCardWidget extends StatelessWidget {
  const ThucDonCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(const ChiTietMonAnScreen());
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
                    padding: const EdgeInsets.all(t10Size),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          tTenMon,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
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
                        const SizedBox(height: t5Size,),
                        ElevatedButton(
                          onPressed: (){
                            Get.to(const ThemGhiChuMoiScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFCAF0F8),
                              foregroundColor: const Color(0xFF727070),
                              padding: const EdgeInsets.symmetric(horizontal: t30Size),
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
              const Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: t10Size*14,
                    child: ClipRRect(
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
    );
  }
}