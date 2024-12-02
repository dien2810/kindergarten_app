import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/controllers/ngoai_khoa/ngoai_khoa_controller.dart';
import 'package:kindergarten_app/src/features/student/screens/ngoai_khoa/widget/chi_tiet_clb_card_cua_toi_screen.dart';

import '../../../../../constants/sizes.dart';
import '../../../models/enrolledClub/enrolled.dart';

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
  final Enrolled enrolledClub;

  ClubCardCuaToi({super.key, required this.backgroundIndex, required this.enrolledClub});

  @override
  Widget build(BuildContext context) {
    final String backgroundImage = backgroundImages[backgroundIndex % backgroundImages.length];
    final ngoaiKhoaController = Get.put(NgoaiKhoaController());
    return FutureBuilder(
      future: ngoaiKhoaController.getClubById(enrolledClub.clubID),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        else if (!snapshot.hasData || snapshot.data==null) {
          return const Center(child: Text('Không có dữ liệu.'));
        }
        else{
          final club = snapshot.data!;
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            clipBehavior: Clip.hardEdge,
            child: Container(
              width: t100Size*2.5,
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildInfoRow(costIcon, '${club.tuition} VND'),
                  const SizedBox(height: 4),
                  _buildInfoRow(dateIcon, club.openingDay),
                  const SizedBox(height: 4),
                  _buildInfoRow(participantsIcon, '${club.capacity}'),
                  const SizedBox(height: 4),
                  _buildInfoRow('', enrolledClub.enrollStatus, true),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 0.0),
                      child: TextButton(
                        onPressed: () {
                          // Pass the backgroundImage to the detail screen
                          Get.to(() => ChiTietClbCardCuaToiScreen(
                                backgroundImage: backgroundImage,
                                club: club,
                                enrolledClub: enrolledClub,
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

      }

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