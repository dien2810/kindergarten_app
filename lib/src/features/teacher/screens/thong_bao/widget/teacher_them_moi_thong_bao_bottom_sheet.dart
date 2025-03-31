import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../../../../constants/text_strings.dart';
import '../../../controllers/thong_bao/teacher_thong_bao_controller.dart';

class TeacherThemMoiThongBaoBottomSheet extends StatefulWidget {
  const TeacherThemMoiThongBaoBottomSheet({super.key});

  @override
  _TeacherThemMoiThongBaoBottomSheetState createState() =>
      _TeacherThemMoiThongBaoBottomSheetState();
}

class _TeacherThemMoiThongBaoBottomSheetState
    extends State<TeacherThemMoiThongBaoBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String _selectedRecipient = 'Tất cả';
  String _selectedPriority = 'normal';
  final notificationsController = Get.put(TeacherThongBaoController());

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Lấy chiều cao của màn hình và chiều cao của bàn phím

    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).viewInsets.bottom > 0
          ? MediaQuery.of(context).size.height * 0.8 // Adjust height when keyboard is up
          : 670, // Default height
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                tTHEMMOITHONGBAO,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[800],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tiêu đề thông báo
            _buildTextField(tTieuDe, _titleController),
            const SizedBox(height: 16),

            // Loại thông báo
            _buildTextField(tLoaiThongBao, _typeController),
            const SizedBox(height: 16),

            // Nội dung thông báo
            _buildTextField(tNoiDungSp, _contentController, isExpanded: true),
            const SizedBox(height: 16),

            // Loại thông báo
            const Text(
              tDoUuTien,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF580B8B),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF2E9F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: _selectedPriority,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPriority = newValue!;
                  });
                },
                items: <String>['high', 'normal', 'low']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 19, // Giảm kích thước font chữ
                        color: Color(0xFF580B8B), // Màu chữ tùy chỉnh (nếu muốn)
                      ),
                    ),
                  );
                }).toList(),
                dropdownColor: const Color(0xFFF2E9F7), // Màu nền dropdown
                style: const TextStyle(
                  fontSize: 19, // Font chữ hiển thị giá trị đã chọn
                  color: Color(0xFF580B8B),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Người nhận
            const Text(
              tNguoiNhan,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF580B8B),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF2E9F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                value: _selectedRecipient,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRecipient = newValue!;
                  });
                },
                items: <String>[tTatCa, tGiaoVien, tPhuHuynh]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 19, // Giảm kích thước font chữ
                        color: Color(0xFF580B8B), // Màu chữ tùy chỉnh (nếu muốn)
                      ),
                    ),
                  );
                }).toList(),
                dropdownColor: const Color(0xFFF2E9F7), // Màu nền của dropdown menu
                style: const TextStyle(
                  fontSize: 14, // Font chữ của giá trị được chọn
                  color: Color(0xFF580B8B),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Nút Lưu và Hủy
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    await notificationsController.addNewNotificationByTeacher(
                      _titleController.text,
                        _typeController.text,
                      _contentController.text,
                      _selectedPriority,
                      _selectedRecipient
                    );
                    await notificationsController.reloadNotifications();
                    Helper.successSnackBar(
                      title: tDaThemThanhCong,
                      message: tThemThongBaoThanhCong
                    );
                    if (context.mounted){
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF99D98C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                  ),
                  child: const Text(tThemMoi, style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý hủy
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFA983),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                  ),
                  child: const Text(tHuy, style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isExpanded = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF580B8B),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF2E9F7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Nhập $label",
              hintStyle: const TextStyle(
                color: Color(0xFF7B7B7B),
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 16, color: Color(0xFF7B7B7B)),
            minLines: isExpanded ? 3 : 1,
            maxLines: isExpanded ? null : 1,
          ),
        ),
      ],
    );
  }
}