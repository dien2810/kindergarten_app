import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TeacherThemMoiNhanXetBottomSheet extends StatelessWidget {
  final String teacherID;
  final String parentName;
  final String guardianID;
  final Function(String, String, String) onAddComment;

  const TeacherThemMoiNhanXetBottomSheet({
    Key? key,
    required this.teacherID,
    required this.parentName,
    required this.guardianID,
    required this.onAddComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).viewInsets.bottom > 0
          ? MediaQuery.of(context).size.height * 0.8
          : 370,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          const Text(
            "Thêm mới nhận xét",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF380543)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Hiển thị thông tin
          _buildInfoText("Giáo viên:", teacherID),
          const SizedBox(height: 8),
          _buildInfoText("Phụ huynh học sinh:", parentName),
          const SizedBox(height: 8),
          _buildInfoText("Ngày tạo nhận xét:", DateFormat('dd-MM-yyyy').format(DateTime.now())),
          const SizedBox(height: 16),

          // TextField cho nhận xét
          TextField(
            controller: commentController,
            maxLines: 4,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE9EFF7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintText: "Nhập nội dung nhận xét...",
              hintStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),

          // Nút Thêm mới và Hủy
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionButton("Thêm mới", const Color(0xFF99D98C), () {
                if (commentController.text.isNotEmpty) {
                  // Gọi hàm callback để thêm nhận xét
                  onAddComment(guardianID, teacherID, commentController.text);
                  Navigator.pop(context);
                } else {
                  // Hiển thị thông báo nếu nhận xét rỗng
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Vui lòng nhập nội dung nhận xét.")),
                  );
                }
              }),
              _buildActionButton("Hủy", const Color(0xFFF4778D), () {
                Navigator.pop(context);
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoText(String label, String value) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF380543)),
            ),
            TextSpan(
              text: " $value",
              style: const TextStyle(fontSize: 16, color: Color(0xFF7B7B7B)),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create buttons
  Widget _buildActionButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}