import 'package:flutter/material.dart';

class TeacherClbThemMoiNhanXetBottomSheet extends StatelessWidget {
  final String teacherID; // ID giáo viên
  final String parentName; // Tên phụ huynh
  final String currentDate; // Ngày hiện tại
  final String guardianID; // ID phụ huynh
  final String replyContent; // Nội dung trả lời
  final String commentDate; // Ngày nhận xét
  final Function(String) onAddComment; // Callback để thêm nhận xét

  const TeacherClbThemMoiNhanXetBottomSheet({
    Key? key,
    required this.teacherID,
    required this.parentName,
    required this.currentDate,
    required this.guardianID,
    required this.replyContent,
    required this.commentDate,
    required this.onAddComment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).viewInsets.bottom > 0
          ? MediaQuery.of(context).size.height * 0.8 // Adjust height when keyboard is up
          : 370, // Default height
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          // Header
          const Text(
            "Thêm mới nhận xét",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold , color: Color(0xFF380543)),
            textAlign: TextAlign.center, // Center the header here
          ),
          SizedBox(height: 16),
          // Hiển thị thông tin
          _buildInfoText("Giáo viên:", teacherID),
          SizedBox(height: 8),
          _buildInfoText("Phụ huynh học sinh:", parentName),
          SizedBox(height: 8),
          _buildInfoText("Ngày tạo nhận xét:", currentDate),
          SizedBox(height: 16),
          // TextField cho nhận xét
          TextField(
            controller: commentController,
            maxLines: 4,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFE9EFF7), // Màu nền
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintText: "Nhập nội dung nhận xét...",
              hintStyle: TextStyle(fontSize: 14, fontStyle: FontStyle.italic), // Hint text style
            ),
            style: TextStyle(fontSize: 16), // TextField input text size
          ),
          SizedBox(height: 16),
          // Nút Thêm mới và Hủy
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionButton("Thêm mới", Color(0xFF99D98C), () {
                if (commentController.text.isNotEmpty) {
                  onAddComment(commentController.text); // Gọi callback
                  Navigator.pop(context); // Đóng bottom sheet
                }
              }),
              _buildActionButton("Hủy", Color(0xFFF4778D), () {
                Navigator.pop(context); // Đóng bottom sheet
              }),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to create info text
  Widget _buildInfoText(String label, String value) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF380543)), // Bold for label
            ),
            TextSpan(
              text: " $value",
              style: TextStyle(fontSize: 16, color: Color(0xFF7B7B7B)), // Regular for value
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
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60), // Button padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded corners
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.white), // Button text size
      ),
    );
  }
}