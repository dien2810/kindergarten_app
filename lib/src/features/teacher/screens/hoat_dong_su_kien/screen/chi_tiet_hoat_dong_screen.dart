import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/sizes.dart';
import 'package:kindergarten_app/src/features/student/models/activities/activities_event.dart';
import 'package:kindergarten_app/src/features/student/models/type_of_activity/type_of_activity_model.dart';

import '../../../../../constants/text_strings.dart';
import 'chi_tiet_hinh_anh_hoat_dong_screen.dart';
import 'chi_tiet_video_hoat_dong_screen.dart';

class TeacherChiTietHoatDongScreen extends StatelessWidget {
  final ActivityEvent activityEvent;
  final TypeOfActivityModel? typeOfActivity;

  const TeacherChiTietHoatDongScreen({super.key, required this.activityEvent, required this.typeOfActivity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: t70Size, // điều chỉnh độ cao header
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
        padding: EdgeInsets.all(t10Size),
        child: SingleChildScrollView(
          child: SizedBox(
            height: t100Size*7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thông tin sự kiện
                _buildSectionTitle('THÔNG TIN SƠ LƯỢC'),
                _buildCard(
                  children: [
                    const Text('Tên hoạt động: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                    Text(activityEvent.activityName, style: _contentStyle), // Content here

                    const SizedBox(height: 8),

                    const Text('Thời gian: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                    Text('${activityEvent.startTime} - ${activityEvent.endTime}', style: _contentStyle),

                    const SizedBox(height: 8),

                    const Text('Thời lượng: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                    Text(activityEvent.duration, style: _contentStyle),

                    const SizedBox(height: 8),

                    const Text('Loại hoạt động: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                    Text(typeOfActivity!.typeName, style: _contentStyle),

                    const SizedBox(height: 8),

                    const Text('Địa điểm: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 ,color: Color(0xFF7B7B7B))),
                    Text(activityEvent.location, style: _contentStyle),
                  ],
                ),
                SizedBox(height: t10Size),

                // Thư viện hình ảnh và video
                _buildSectionTitle('THƯ VIỆN'),
                _buildCard(
                  children: [
                    ListTile(
                      title: const Text('Hình ảnh hoạt động', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                      subtitle: Text('Số lượng:  ${activityEvent.image.length}', style: _contentStyle),
                      trailing: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => TeacherHinhAnhScreen(images: activityEvent.image));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD74971), // Background color
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
                    const Divider(),
                    ListTile(
                      title: const Text('Video hoạt động', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                      trailing: SizedBox(
                        width: 150, // Set the fixed width for the button
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => TeacherVideoScreen(videoLink: activityEvent.videoLive));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD74971), // Background color
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


                SizedBox(height: t10Size),

                // Ghi chú học sinh
                _buildSectionTitle('GHI CHÚ HỌC SINH'),
                _buildCard(
                  children: [
                    const Text(
                      'Học sinh: Nguyễn Văn An',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xFF7B7B7B))),
                    SizedBox(height: t10Size),
                    Text(
                      'Ghi chú: ${activityEvent.studentsNote.isNotEmpty?activityEvent.studentsNote:tKhongCo}',
                      style: _contentStyle,
                    ),
                  ],
                ),
                const Spacer(),

                // Nút quay lại danh sách
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0), // Khoảng cách 30px tới cuối màn hình
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0B2384),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Góc bo tròn 30px
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          'Quay lại danh sách',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hàm để tạo tiêu đề mục lớn
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
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
        margin: const EdgeInsets.symmetric(vertical: 8),
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


