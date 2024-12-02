import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Thêm Mới Vaccine')),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9ADA7E), // Màu nền button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bo góc button
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding cho button
            ),
            onPressed: () {
              // Gọi BottomSheet khi nhấn nút
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Cho phép BottomSheet cuộn khi có nhiều nội dung
                builder: (BuildContext context) {
                  return const TeacherThemMoiLoaiVaccineBottomSheet();
                },
              );
            },
            child: const Text(
              "Thêm mới loại vaccine",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TeacherThemMoiLoaiVaccineBottomSheet extends StatefulWidget {
  const TeacherThemMoiLoaiVaccineBottomSheet({super.key});

  @override
  State<TeacherThemMoiLoaiVaccineBottomSheet> createState() =>
      _TeacherThemMoiLoaiVaccineBottomSheetState();
}

class _TeacherThemMoiLoaiVaccineBottomSheetState
    extends State<TeacherThemMoiLoaiVaccineBottomSheet> {
  final TextEditingController _tenVaccineController = TextEditingController();
  final TextEditingController _moTaVaccineController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start, // Căn trái các thành phần
            children: [
              // Title header, căn giữa
              const Text(
                "Thêm mới loại vaccine",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7209B7), // Màu chữ header
                ),
                textAlign: TextAlign.center, // Căn giữa tiêu đề
              ),
              const SizedBox(height: 16), // space after title

              // Text for vaccine name
              const Text(
                "Tên loại vaccine",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600, // Làm đậm chữ mô tả
                  color: Color(0xFF580B8B), // Màu chữ
                ),
              ),
              const SizedBox(height: 8), // space after label

              // Textfield for vaccine name
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2E9F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _tenVaccineController,
                  decoration: const InputDecoration(
                    hintText: "Nhập tên loại vaccine",
                    hintStyle: const TextStyle(
                      color: Color(0xFF7B7B7B),
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16), // Kiểu chữ mặc định
                ),
              ),
              const SizedBox(height: 16), // space after vaccine name textfield

              // Text for vaccine description
              const Text(
                "Mô tả loại vaccine",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600, // Làm đậm chữ mô tả
                  color: Color(0xFF580B8B), // Màu chữ
                ),
              ),
              const SizedBox(height: 8), // space after label

              // Textfield for vaccine description
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2E9F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _moTaVaccineController,
                  maxLines: 4, // Cho phép nhập nhiều dòng mô tả
                  decoration: const InputDecoration(
                    hintText: "Nhập mô tả loại vaccine",
                    hintStyle: const TextStyle(
                      color: Color(0xFF7B7B7B),
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16), // Kiểu chữ mặc định
                ),
              ),
              const SizedBox(height: 16), // space after vaccine description textfield

              // Row for Add and Cancel buttons, căn đều
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Căn đều các nút
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        String tenVaccine = _tenVaccineController.text;
                        String moTaVaccine = _moTaVaccineController.text;

                        // Bạn có thể gửi dữ liệu này lên backend hoặc xử lý tại đây
                        print('Tên Vaccine: $tenVaccine');
                        print('Mô Tả Vaccine: $moTaVaccine');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF99D98C), // Màu nút Thêm mới
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 60), // Kích thước nút
                      ),
                      child: const Text(
                        "Thêm mới",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Kích thước chữ nút Thêm mới
                        ),
                      ),
                    ),
                    // Cancel button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Đóng BottomSheet
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFA983), // Màu nút Hủy
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 60), // Kích thước nút
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

void main() => runApp(const MyApp());
