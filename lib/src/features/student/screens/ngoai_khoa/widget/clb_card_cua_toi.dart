import 'package:flutter/material.dart';
import 'package:kindergarten_app/src/features/student/screens/ngoai_khoa/widget/chi_tiet_clb_card_cua_toi_screen.dart';

class ClubCardCuaToi extends StatelessWidget {
  final List<String> backgroundImages = [
    'assets/images/ngoai_khoa_images/ngoai_khoa_card_image_1.png',
    'assets/images/ngoai_khoa_images/ngoai_khoa_card_image_2.png',
    'assets/images/ngoai_khoa_images/ngoai_khoa_card_image_3.png',
    'assets/images/ngoai_khoa_images/ngoai_khoa_card_image_4.png',
  ];

  final String costIcon = 'assets/images/ngoai_khoa_images/price_clb_icon.png';
  final String dateIcon = 'assets/images/ngoai_khoa_images/date_register_ngoai_khoa_icon.png';
  final String participantsIcon = 'assets/images/ngoai_khoa_images/so_luong_dang_ki_clb_icon.png';
  final String xemChiTietCLBCuaToiIcon = 'assets/images/ngoai_khoa_images/xem_chi_tiet_clb_icon.png';

  final int backgroundIndex;

  ClubCardCuaToi({Key? key, required this.backgroundIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String backgroundImage = backgroundImages[backgroundIndex % backgroundImages.length];

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: 285,
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
            const Text(
              'CLB hội họa',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 4),
            _buildInfoRow(costIcon, '500000 VND'),
            const SizedBox(height: 4),
            _buildInfoRow(dateIcon, '05/09/2024'),
            const SizedBox(height: 4),
            _buildInfoRow(participantsIcon, '20'),
            const SizedBox(height: 4),
            _buildInfoRow('', 'Đã đăng ký ', true),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 0.0),
                child: TextButton(
                  onPressed: () {
                    // Pass the backgroundImage to the detail screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChiTietClbCardCuaToiScreen(backgroundImage: backgroundImage),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    side: const BorderSide(color: Colors.transparent, width: 0.5),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      Image.asset(xemChiTietCLBCuaToiIcon, width: 25, height: 25),
                      const SizedBox(width: 8),
                      const Text('Xem chi tiết', style: TextStyle(color: Colors.blue, fontSize: 16)),
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

  Widget _buildInfoRow(String iconPath, String text, [bool isBold = false]) {
    return Row(
      children: [
        if (iconPath.isNotEmpty) Image.asset(iconPath, width: 16, height: 16),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: isBold ? Colors.green : const Color(0xFF0B2384),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}