import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherChinhSuaLoiKhuyenBottomSheet extends StatefulWidget {
  const TeacherChinhSuaLoiKhuyenBottomSheet({super.key});

  @override
  State<TeacherChinhSuaLoiKhuyenBottomSheet> createState() =>
      _TeacherChinhSuaLoiKhuyenBottomSheetState();
}

class _TeacherChinhSuaLoiKhuyenBottomSheetState
    extends State<TeacherChinhSuaLoiKhuyenBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 12,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 750,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa các phần tử
            children: [
              // Title header
              const Text(
                "Chỉnh sửa lời khuyên bác sĩ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF580B8B),
                ),
                textAlign: TextAlign.center, // Căn giữa tiêu đề
              ),
              const SizedBox(height: 16), // space after title

              // Textfield for advice input
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2E9F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _controller,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    hintText: "Nhập lời khuyên bác sĩ ở đây...",
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16), // Kiểu chữ mặc định
                ),
              ),
              const SizedBox(height: 16), // space after textfield

              // Row for Update and Cancel buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Nút hủy ở bên phải
                  children: [
                    // Cancel button

                    // Update button
                    ElevatedButton(
                      onPressed: () {
                        // Handle update advice
                        String updatedAdvice = _controller.text;
                        // You can send this to a backend or handle it locally
                        print('Updated Advice: $updatedAdvice');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9317AE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 30), // Giữ kích thước nút đồng nhất
                      ),
                      child: const Text(
                        "Cập nhật lời khuyên",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Kích thước chữ nút Cập nhật
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle cancel action
                        Navigator.of(context).pop(); // Đóng BottomSheet
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFBDBDBD), // Màu xám cho nút hủy
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 60),
                      ),
                      child: const Text(
                        "Hủy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Kích thước chữ nút Hủy
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
