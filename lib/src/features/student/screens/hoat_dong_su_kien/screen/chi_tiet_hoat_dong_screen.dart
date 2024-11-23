import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/hoat_dong_su_kien_controller.dart';
import 'chi_tiet_hinh_anh_hoat_dong_screen.dart';
import 'chi_tiet_video_hoat_dong_screen.dart';

class ChiTietHoatDongScreen extends StatelessWidget {
  final Event event;

  ChiTietHoatDongScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chi Tiết Hoạt Động',
          style: TextStyle(
            color: Color(0xFFD74971), // Set color to D74971
            fontSize: 26, // Increase font size
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin sự kiện
            _buildSectionTitle('THÔNG TIN SƠ LƯỢC'),
            _buildCard(
              children: [
                const Text('Tên hoạt động: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                Text('${event.name}', style: _contentStyle), // Content here

                const SizedBox(height: 8),

                const Text('Thời gian: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                Text('${event.startTime} - ${event.endTime}', style: _contentStyle),

                SizedBox(height: 8),

                const Text('Thời lượng: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                Text('${event.duration}', style: _contentStyle),

                const SizedBox(height: 8),

                Text('Loại hoạt động: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                Text('${event.typeOfActivityName}', style: _contentStyle),

                const SizedBox(height: 8),

                const Text('Địa điểm: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 ,color: Color(0xFF7B7B7B))),
                Text('${event.location}', style: _contentStyle),
              ],
            ),
            SizedBox(height: 16),

            // Thư viện hình ảnh và video
            _buildSectionTitle('THƯ VIỆN'),
            _buildCard(
              children: [
                ListTile(
                  title: Text('Hình ảnh hoạt động', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                  subtitle: Text('Số lượng:  ${event.images.length}', style: _contentStyle),
                  trailing: SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => HinhAnhScreen(images: event.images));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD74971), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Xem chi tiết',
                            style: TextStyle(color: Colors.white), // White text color
                          ),
                          SizedBox(width: 8), // Space between text and icon
                          Icon(
                            Icons.arrow_forward, // Arrow icon
                            color: Colors.white, // Icon color is white
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: const Text('Video hoạt động', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                  trailing: SizedBox(
                    width: 150, // Set the fixed width for the button
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => VideoScreen(videoLink: event.videoLive));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD74971), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Xem video',
                            style: TextStyle(color: Colors.white), // White text color
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.play_arrow, // Play icon
                            color: Colors.white, // Icon color is white
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 16),

            // Ghi chú học sinh
            _buildSectionTitle('GHI CHÚ HỌC SINH'),
            _buildCard(
              children: [
                const Text(
                  'Học sinh: Nguyễn Văn An',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                SizedBox(height: 8),
                Text(
                  'Ghi chú: ${event.studentsNote}',
                  style: _contentStyle,
                ),
              ],
            ),
            Spacer(),

            // Nút quay lại danh sách
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0B2384),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Corner radius of 30
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Quay lại danh sách',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm để tạo tiêu đề mục lớn
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Color(0xFFD74971), // Màu D74971
      ),
    );
  }

  // Hàm để tạo Card chứa nội dung
  Widget _buildCard({required List<Widget> children}) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      widthFactor: 1, // Ensure the card takes the full width of the parent
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }

  // Phong cách chữ nội dung
  final TextStyle _contentStyle = const TextStyle(
 fontSize: 16,color: Color(0xFF7B7B7B)
  );
}


