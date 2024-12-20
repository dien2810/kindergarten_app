import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/student/controllers/ngoai_khoa/ngoai_khoa_controller.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../../models/club/club_model.dart';
import 'chi_tiet_clb_card_screen.dart';

class ClubCard extends StatelessWidget {
  final List<String> backgroundImages = [
    'assets/images/ngoai_khoa_images/ngoai_khoa_card_image_1.png',
    'assets/images/ngoai_khoa_images/ngoai_khoa_card_image_2.png',
    'assets/images/ngoai_khoa_images/ngoai_khoa_card_image_3.png',
    'assets/images/ngoai_khoa_images/ngoai_khoa_card_image_4.png',
  ];

  final String costIcon = 'assets/images/ngoai_khoa_images/price_clb_icon.png';
  final String dateIcon = 'assets/images/ngoai_khoa_images/date_register_ngoai_khoa_icon.png';
  final String participantsIcon = 'assets/images/ngoai_khoa_images/so_luong_dang_ki_clb_icon.png';
  final String timeRemainingIcon = 'assets/images/ngoai_khoa_images/thoi_han_dang_ki_icon.png';
  final String xemChiTietCLBIcon = 'assets/images/ngoai_khoa_images/xem_chi_tiet_clb_icon.png';

  final int backgroundIndex;
  final ClubModel club;

  ClubCard({super.key, required this.backgroundIndex, required this.club});

  @override
  Widget build(BuildContext context) {
    final String backgroundImage = backgroundImages[backgroundIndex % backgroundImages.length];
    final today = Helper.formatDateToString(DateTime.now());
    final dayLeft = Helper.calculateDaysDifference(today, club.closedRegistration);
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: t100Size*2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.only(left: 160.0, right: 10.0, top: 5.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              club.clubName,
              style: const TextStyle(
                fontSize: 18,  // Tăng kích thước chữ ở đây
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 4),
            _buildInfoRow(costIcon, '${club.tuition} VND'),
            const SizedBox(height: 4),
            _buildInfoRow(dateIcon, club.openedRegistration),
            const SizedBox(height: 4),
            _buildInfoRow(participantsIcon, '${club.capacity}'),
            const SizedBox(height: 4),
            _buildInfoRow(timeRemainingIcon, 'Còn $dayLeft ngày'),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 0.0),
                child: TextButton(
                  onPressed: () {
                    final ngoaiKhoaController = Get.put(NgoaiKhoaController());
                    ngoaiKhoaController.club = club;
                    // Pass the backgroundImage to the detail screen
                    Get.to(() =>
                      ChiTietClbCardScreen(backgroundImage: backgroundImage));
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    side: const BorderSide(color: Colors.transparent, width: 0.5),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      Image.asset(xemChiTietCLBIcon, width: 25, height: 25),
                      const SizedBox(width: 5),
                      const Text(
                        'Xem chi tiết',
                        style: TextStyle(color: Colors.blue, fontSize: 16), // Tăng kích thước chữ cho nút
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Phương thức _buildInfoRow giữ nguyên icon hoặc không có icon nếu không truyền, tăng fontSize trong TextStyle
  Widget _buildInfoRow(String iconPath, String text) {
    return Row(
      children: [
        Image.asset(iconPath, width: t10Size, height: t10Size),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,  // Tăng kích thước chữ ở đây
              color: Color(0xFF0B2384),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
