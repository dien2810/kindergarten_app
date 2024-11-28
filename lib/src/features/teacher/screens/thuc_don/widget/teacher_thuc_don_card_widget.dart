import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../screen/teacher_chi_tiet_mon_an_screen.dart';

class TeacherThucDonCardWidget extends StatelessWidget {
  const TeacherThucDonCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const TeacherChiTietMonAnScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFBA83DE),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Màu shadow
              spreadRadius: 1, // Độ lan tỏa
              blurRadius: 5, // Độ mờ
              offset: const Offset(0, 3), // Vị trí shadow (x, y)
            ),
          ],
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
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      tLuaChon,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: t5Size),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(const TeacherChiTietMonAnScreen());
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFCAF0F8),
                        foregroundColor: const Color(0xFF727070),
                        padding: const EdgeInsets.symmetric(horizontal: t40Size),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),

                        ),
                      ),
                      child: const Text(
                        tXemChiTietButton,
                        style: TextStyle(fontSize: 15,
                          color: Color(0xFF727070),
                          fontWeight: FontWeight.bold,)
                        ,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(
                height: t10Size * 14,
                child: ClipRRect(
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(tThucDonBuaSang),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
