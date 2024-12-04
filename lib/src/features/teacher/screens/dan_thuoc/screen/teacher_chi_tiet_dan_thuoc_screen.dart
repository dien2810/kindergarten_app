import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/dan_thuoc/teacher_dan_thuoc_controller.dart';

import '../../../../../constants/sizes.dart';
import '../widget/teacher_dan_thuoc_list_tile_widget.dart';

class TeacherChiTietDanThuocScreen extends StatelessWidget {
  const TeacherChiTietDanThuocScreen({
    super.key,
    required this.image,
    required this.color,
    required this.medicine,
    required this.receivedPerson,
    required this.sentGuardian,
    required this.studentID,
    required this.status,
  });

  final String image;
  final MedicineModel medicine;
  final Color color;
  final String receivedPerson;
  final String studentID;
  final String sentGuardian;
  final String status;

  @override
  Widget build(BuildContext context) {
    // Lấy chiều rộng màn hình thiết bị
    final double deviceWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const TeacherAppBarWithTitleHeader2( title: tChiTietDonThuoc),
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: t10Size),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            SizedBox(height: t15Size),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      // Điều chỉnh width theo thiết bị
                      width: deviceWidth * 0.9, // Chiếm 90% chiều rộng thiết bị
                      padding: EdgeInsets.all(t15Size),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.0)),
                        border: Border.all(
                            width: 2, color: const Color(0xFFC4C4C4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            tChiTietDonThuoc,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 24,
                              color: Color(0xFFBA83DE),
                            ),
                          ),
                          SizedBox(height: t10Size),
                          TeacherDanThuocListTileWidget(
                            image: image,
                            title: medicine.prescription,
                            subtitle: medicine.createDate,
                            status: medicine.status,
                            color: color,
                            studentID: medicine.studentID,
                            sentGuardian: medicine.sentGuardian,
                            receivedPerson: medicine.receivedPerson,
                          ),
                          SizedBox(height: t10Size),
                          _buildInformationBox(
                            title: tDonThuoc,
                            value: medicine.prescription,
                            deviceWidth: deviceWidth,
                          ),
                          SizedBox(height: t10Size),
                          _buildInformationBox(
                            title: tGhiChuDanThuoc,
                            value: medicine.note,
                            deviceWidth: deviceWidth,
                          ),
                          SizedBox(height: t10Size),
                          _buildInformationBox(
                            title: tNgayNhanThuoc,
                            value: medicine.createDate,
                            deviceWidth: deviceWidth,
                          ),
                          SizedBox(height: t10Size),
                          _buildInformationBox(
                            title: tHoVaTenPhuHuynhDanThuoc,
                            value: medicine.sentGuardian,
                            deviceWidth: deviceWidth,
                          ),
                          SizedBox(height: t10Size),
                          _buildInformationBox(
                            title: tNguoiNhanDonThuoc,
                            value: medicine.receivedPerson,
                            deviceWidth: deviceWidth,
                          ),
                          SizedBox(height: t15Size),
                          DropdownButtonFormField<String>(
                            onChanged: (newValue) {
                              if (newValue!=null){
                                medicine.status = newValue;
                              }
                            },
                            items: ['Đã gửi', 'Đang thực hiện', 'Đã hoàn thành']
                                .map((status) {
                              return DropdownMenuItem<String>(
                                value: status,
                                child: Container(
                                  width: 300, // Set a fixed width for each item
                                  height:
                                      40, // Set a fixed height for each item
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(
                                        status), // Function to get color based on status
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Rounded corners
                                  ),
                                  alignment: Alignment.center, // Center text
                                  child: Text(
                                    status,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center, // Center text
                                  ),
                                ),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              labelText: medicine.status,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          SizedBox(height: t10Size),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: deviceWidth *
                                  0.8, // Adjust the overall width as needed
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                            0xFF7209B7), // Color for the first button
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(t50Size),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0), // Adjust padding
                                      ),
                                      onPressed: () async {
                                        // Add update functionality here
                                        final teacherDanThuocController = Get.put(TeacherDanThuocController());
                                        await teacherDanThuocController.updateMedicine(medicine);
                                      },
                                      child: const Text(
                                        'Cập Nhật', // Text for the update button
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily: "Outfit",
                                          color:
                                              Colors.white, // White text color
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 30), // Space between buttons
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                            0xFFBA83DE), // Color for the back button
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(t50Size),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0), // Adjust padding
                                      ),
                                      onPressed: () {
                                        Get.back(); // Go back to the previous page
                                      },
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Center the content
                                        children: [
                                          Icon(
                                            Icons
                                                .arrow_back, // Icon for the back button
                                            color: Colors.white, // Icon color
                                          ),
                                          SizedBox(
                                              width:
                                                  8), // Space between icon and text
                                          Text(
                                            'Quay Lại', // Text for the back button
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              fontFamily: "Outfit",
                                              color: Colors
                                                  .white, // White text color
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformationBox({
    required String title,
    required String value,
    required double deviceWidth,
  }) {
    return Container(
      padding: EdgeInsets.all(t10Size),
      width: deviceWidth * 0.98, // Chiếm 90% chiều rộng thiết bị
      decoration: BoxDecoration(
        color: const Color(0xFFF5EDF9),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 14),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}

Color _getStatusColor(String status) {
  switch (status) {
    case 'Đã gửi':
      return const Color(0xFFDAF6F4); // Màu nền cho "Đã gửi"
    case 'Đang thực hiện':
      return const Color(0xFFE8E7FC); // Màu nền cho "Đang thực hiện"
    case 'Đã hoàn thành':
      return const Color(0xFFCFECFF); // Màu nền cho "Đã hoàn thành"
    default:
      return Colors.white; // Màu mặc định nếu không có trạng thái nào khớp
  }
}
