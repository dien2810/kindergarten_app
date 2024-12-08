import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_color_and_title.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/xin_nghi/teacher_xin_nghi_controller.dart';

import '../../../../student/models/dayoff_model/dayoff_entry_model.dart';

class TeacherChiTietDonXinNghiScreen extends StatefulWidget {
  final DayoffEntry dayoffEntry;
  final List<String> studentIds;
  final int index;

  const TeacherChiTietDonXinNghiScreen({
    super.key,
    required this.dayoffEntry,
    required this.studentIds,
    required this.index,
  });

  @override
  _TeacherChiTietDonXinNghiScreenState createState() =>
      _TeacherChiTietDonXinNghiScreenState();
}

class _TeacherChiTietDonXinNghiScreenState
    extends State<TeacherChiTietDonXinNghiScreen> {
  final teacherXinNghiController = Get.find<TeacherXinNghiController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Xử lý activityNames và period
    // var activityNames = teacherXinNghiController.getActivityNamesFromPeriod(widget.details['period']);
    // var periods = activityNames.isNotEmpty ? activityNames : ['Cả ngày'];

    return Scaffold(
      appBar: const TeacherAppBarWithColorAndTitle(
          title: tXinNghi, hexColor: "#480CA8"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoBox(
                  'Người tạo đơn: Phụ huynh học sinh ${widget.studentIds[widget.index]}',
                  context),
              const SizedBox(height: 10),
              _buildInfoBox('Ngày tạo đơn: ${widget.dayoffEntry.day}', context),
              const SizedBox(height: 10),
              _buildInfoBox('Nội dung: ${widget.dayoffEntry.content}', context),
              const SizedBox(height: 10),
              _buildInfoBox(
                  'Trạng thái: ${widget.dayoffEntry.status}', context),
              // Hiện trạng thái hiện tại
              const SizedBox(height: 10),
              _buildInfoBox('Các tiết nghỉ trong ngày:', context,
                  children: teacherXinNghiController.routineNames.map((period) {
                    return Text(
                      period,
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFF7B7B7B)),
                    );
                  }).toList()),
              const SizedBox(height: 10),
              _buildInfoBox('Thay đổi trạng thái:', context, children: [
                _buildStatusDropdown(),
              ]),
              const SizedBox(
                height: 20,
              ),
              // Đẩy nút xuống cuối màn hình
              ElevatedButton(
                onPressed: () async {
                  await teacherXinNghiController.updateDayoff();
                  // Logic cập nhật có thể được thêm vào đây
                  Get.snackbar("Thông báo", "Cập nhật thành công!",
                      snackPosition: SnackPosition.TOP);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF480CA8),
                  // Màu nền của nút
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  // Padding cho nút
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
              )
              // Nút Cập nhật
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusDropdown() {
    return Obx(
      () => DropdownButton<String>(
        value: teacherXinNghiController.currentStatus.value,
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        onChanged: (String? newValue) async {
          if (newValue != null) {
            await teacherXinNghiController.updateStatus(
                widget.studentIds[widget.index],
                widget.dayoffEntry.day!,
                newValue);
            teacherXinNghiController.currentStatus.value = newValue;
            // Cập nhật trạng thái trong controller

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
      ),
    );
  }

  Widget _buildInfoBox(String title, BuildContext context,
      {List<Widget>? children}) {
    return Container(
      width: MediaQuery.of(context)
          .size
          .width, // Đặt chiều rộng bằng chiều rộng của thiết bị
      decoration: BoxDecoration(
        color: const Color(0xFFDCD2EB),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7B7B7B)),
          ),
          if (children != null) ...children,
        ],
      ),
    );
  }
}
