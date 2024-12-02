import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_color_and_title.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/xin_nghi/teacher_xin_nghi_controller.dart';
import '../../teacher_navigation_menu/teacher_bottom_navigation_bar_widget.dart';

class TeacherChiTietDonXinNghiScreen extends StatefulWidget {
  final String studentId;
  final String date;
  final Map<String, dynamic> details;

  TeacherChiTietDonXinNghiScreen({
    Key? key,
    required this.studentId,
    required this.date,
    required this.details,
  }) : super(key: key);

  @override
  _TeacherChiTietDonXinNghiScreenState createState() => _TeacherChiTietDonXinNghiScreenState();
}

class _TeacherChiTietDonXinNghiScreenState extends State<TeacherChiTietDonXinNghiScreen> {
  late String currentStatus;

  final teacherXinNghiController = Get.find<TeacherXinNghiController>();

  @override
  void initState() {
    super.initState();
    currentStatus = widget.details['status']; // Khởi tạo trạng thái hiện tại
  }

  @override
  Widget build(BuildContext context) {
    // Xử lý activityNames và period
    var activityNames = teacherXinNghiController.getActivityNamesFromPeriod(widget.details['period']);
    var periods = activityNames.isNotEmpty ? activityNames : ['Cả ngày'];

    return Scaffold(
      appBar: const TeacherAppBarWithColorAndTitle(title: tXinNghi, hexColor: "#480CA8"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoBox('Người tạo đơn : Phụ huynhh học sinh ${widget.studentId}', context),
            SizedBox(height: 10),
            _buildInfoBox('Ngày tạo đơn: ${widget.date}', context),
            SizedBox(height: 10),
            _buildInfoBox('Nội dung: ${widget.details['content']}', context),
            SizedBox(height: 10),
            _buildInfoBox('Trạng thái: $currentStatus', context), // Hiện trạng thái hiện tại
            SizedBox(height: 10),
            _buildInfoBox('Các tiết nghỉ trong ngày:', context, children: periods.map((period) {
              return Text(
                period,
                style: TextStyle(fontSize: 16, color: Color(0xFF7B7B7B)),
              );
            }).toList()),
            SizedBox(height: 10),
            _buildInfoBox('Thay đổi trạng thái:', context, children: [
              _buildStatusDropdown(),
            ]),
            Spacer(), // Đẩy nút xuống cuối màn hình
            _buildUpdateButton(context), // Nút Cập nhật
          ],
        ),
      ),
    );
  }

  Widget _buildStatusDropdown() {
    return DropdownButton<String>(
      value: currentStatus,
      icon: const Icon(Icons.arrow_drop_down),
      isExpanded: true,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            currentStatus = newValue; // Cập nhật trạng thái hiện tại
          });
          // Cập nhật trạng thái trong controller
          teacherXinNghiController.updateStatus(widget.studentId, widget.date, newValue);
        }
      },
      items: <String>['Chờ duyệt', 'Đã duyệt']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16, color: Color(0xFF7B7B7B)),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildUpdateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Logic cập nhật có thể được thêm vào đây
        Get.snackbar("Thông báo", "Cập nhật thành công!", snackPosition: SnackPosition.TOP);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF480CA8), // Màu nền của nút
        padding: const EdgeInsets.symmetric(vertical: 15), // Padding cho nút
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Center(
        child: Text(
          "Cập nhật",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, BuildContext context, {List<Widget>? children}) {
    return Container(
      width: MediaQuery.of(context).size.width, // Đặt chiều rộng bằng chiều rộng của thiết bị
      decoration: BoxDecoration(
        color: Color(0xFFDCD2EB),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF7B7B7B)),
          ),
          if (children != null) ...children,
        ],
      ),
    );
  }
}