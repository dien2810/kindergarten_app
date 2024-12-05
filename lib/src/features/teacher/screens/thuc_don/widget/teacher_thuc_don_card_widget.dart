import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/cloud_image_widget.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../student/models/menu/menu_item.dart';
import '../screen/teacher_chi_tiet_mon_an_screen.dart';

class TeacherThucDonCardWidget extends StatelessWidget {
  final MenuItem menuItem;
  final DateTime date;
  final int index;

  const TeacherThucDonCardWidget({
    super.key,
    required this.menuItem,
    required this.date,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Kiểm tra nếu menuItem không phải là null
        Get.to(() => TeacherChiTietMonAnScreen(
              menuItem: menuItem,
              date: date,
              index: index,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFBA83DE),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
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
                padding: EdgeInsets.all(t10Size),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tên: ${menuItem.name}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: t5Size),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(() => TeacherChiTietMonAnScreen(
                              menuItem: menuItem,
                              date: date,
                              index: index,
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFCAF0F8),
                        foregroundColor: const Color(0xFF727070),
                        padding: EdgeInsets.symmetric(horizontal: t10Size),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: const Text(
                        tXemChiTietButton,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF727070),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: t10Size * 10,
                height: t10Size * 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CloudImage(publicId: menuItem.image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
