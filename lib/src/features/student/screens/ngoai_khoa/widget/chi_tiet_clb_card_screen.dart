import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/controllers/ngoai_khoa/ngoai_khoa_controller.dart';

import '../../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../utils/helper_controller/helper_controller.dart';

class ChiTietClbCardScreen extends StatelessWidget {
  final String backgroundImage;

  // Constructor to accept the background image from the previous screen
  const ChiTietClbCardScreen({super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    final ngoaiKhoaController = Get.put(NgoaiKhoaController());
    return FutureBuilder(
      future: ngoaiKhoaController.loadTeacherName(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Không có dữ liệu.'));
        }
        else{
          return Scaffold(
            appBar: const GuardianAppBarWithTitleWidget(title: tChiTietCauLacBo),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card for club name, fee, start date, points, and registration status
                    Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(backgroundImage),
                            fit: BoxFit.cover,
                            alignment: Alignment.centerLeft,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.only(left: 160, top: 16, right: 16, bottom: 16), // Adjust padding here
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ngoaiKhoaController.club.clubName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 4),
                            _buildInfoRow('assets/images/ngoai_khoa_images/price_clb_icon.png',
                                '${ngoaiKhoaController.club.tuition} VND'),
                            const SizedBox(height: 4),
                            _buildInfoRow('assets/images/ngoai_khoa_images/date_register_ngoai_khoa_icon.png',
                                ngoaiKhoaController.club.openingDay),
                            const SizedBox(height: 4),
                            _buildAlignedDetailRow('Số người tham gia:',
                                '${ngoaiKhoaController.club.capacity}'),
                            const SizedBox(height: 4),
                            //_buildAlignedDetailRow('Tình trạng:', registrationStatus),
                          ],
                        ),
                      ),
                    ),
                    // Other details
                    _buildAlignedDetailRow('Thời gian đăng kí',
                        '${ngoaiKhoaController.club.openedRegistration} - '
                            '${ngoaiKhoaController.club.closedRegistration}'),
                    _buildAlignedDetailRow('Lớp học', ngoaiKhoaController.club.room),
                    _buildAlignedDetailRow('Giới thiệu', ngoaiKhoaController.club.aboutCourse),
                    _buildAlignedDetailRow('Chủ nhiệm câu lạc bộ', snapshot.data!),
                    _buildScheduleRow('Lịch sinh hoạt', Helper.mapDayOfWeekToString(ngoaiKhoaController.club.dayOfWeek)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await ngoaiKhoaController.enroll();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8AB54A), // Màu nền của nút mới
                            foregroundColor: Colors.white, // Màu chữ
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Bo góc
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Tăng kích thước nút
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min, // Ensures the row is only as wide as the content
                            children: [
                              Text(
                                'Đăng kí',
                                style: TextStyle(
                                  fontSize: 18, // Kích thước chữ lớn hơn
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8), // Space between the text and the icon
                              Icon(
                                Icons.add, // Icon to be added after the text
                                size: 25, // Size of the icon
                                color: Colors.white, // Icon color
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Go back to the previous screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0B2384), // Màu nền của nút
                            foregroundColor: Colors.white, // Màu chữ
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Bo góc
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Tăng kích thước nút
                          ),
                          child: const Text(
                            'Quay lại trang trước',
                            style: TextStyle(
                              fontSize: 18, // Kích thước chữ lớn hơn
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      }
    );
  }

  Widget _buildInfoRow(String iconPath, String text) {
    return Row(
      children: [
        Image.asset(iconPath, width: 16, height: 16),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 16, color: Color(0xFF0B2384))),
      ],
    );
  }

  // Updated method to align details and change text color
  Widget _buildAlignedDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF7B7B7B))),
          const SizedBox(width: 8),
          Flexible(child: Text(value, style: const TextStyle(fontSize: 16, color: Color(0xFF7B7B7B)))),
        ],
      ),
    );
  }

  // Method to display schedule with alternating background colors
  Widget _buildScheduleRow(String label, String schedule) {
    List<String> lines = schedule.split('\n');
    return Column(
      children: lines.map((line) {
        bool isEven = lines.indexOf(line) % 2 == 0;
        return Container(
          color: isEven ? const Color(0xFFF5ECEC) : const Color(0xFFFFBFBE),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(line, style: const TextStyle(fontSize: 16, color: Color(0xFF7B7B7B))),
            ],
          ),
        );
      }).toList(),
    );
  }
}
