import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';
import '../../../../student/models/menu/menu_item.dart';
import '../../../controllers/thuc_don/teacher_thuc_don_controller.dart';
class TeacherThemMonAnBottomSheet extends StatefulWidget {
  const TeacherThemMonAnBottomSheet({super.key});

  @override
  State<TeacherThemMonAnBottomSheet> createState() => _ThemMonAnBottomSheetState();
}

class _ThemMonAnBottomSheetState extends State<TeacherThemMonAnBottomSheet> {
  final TextEditingController _tenMonAnController = TextEditingController();
  final TextEditingController _nguyenLieuController = TextEditingController();
  final TextEditingController _ngayTaoMonController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedThucDon = "Bữa sáng";
  final List<String> _thucDonOptions = ["Bữa sáng", "Bữa trưa", "Bữa tối"];
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  final TeacherThucDonController _teacherThucDonController = Get.put(TeacherThucDonController());

  @override
  void initState() {
    super.initState();
    _ngayTaoMonController.text = DateFormat('dd-MM-yyyy').format(_selectedDate);
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _ngayTaoMonController.text = DateFormat('dd-MM-yyyy').format(_selectedDate);
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  Future<void> _saveMenuItem() async {
    if (_tenMonAnController.text.isEmpty || _nguyenLieuController.text.isEmpty || _selectedImage == null) {
      Get.snackbar(
        'Thông báo',
        'Vui lòng nhập đầy đủ thông tin',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // String imageUrl = _selectedImage!.path; // URL hình ảnh sau khi upload, ở đây giả sử là path cục bộ
    List<String> ingredients = _nguyenLieuController.text.split(',').map((e) => e.trim()).toList();
    Map<String, String> note = {};
    String imageUrl = await Helper.uploadImage(_selectedImage!);

    MenuItem menuItem = MenuItem(
      image: imageUrl,
      ingredients: ingredients,
      meal: _selectedThucDon,
      name: _tenMonAnController.text,
      note: note,
    );

    await _teacherThucDonController.addMenuItem(_selectedDate, menuItem);

    Get.back(); // Đóng bottom sheet sau khi thêm mới món ăn
    Get.snackbar(
      'Thông báo',
      'Đã thêm món ăn thành công',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Wrap(
        children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Thêm mới món ăn",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF580B8B)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _tenMonAnController,
                decoration: InputDecoration(
                  labelText: "Tên món ăn",
                  labelStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _ngayTaoMonController,
                readOnly: true,
                onTap: _pickDate,
                decoration: InputDecoration(
                  labelText: "Ngày tạo món",
                  labelStyle: const TextStyle(fontSize: 16),
                  suffixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedThucDon,
                items: _thucDonOptions.map((thucDon) => DropdownMenuItem(
                  value: thucDon,
                  child: Text(thucDon, style: const TextStyle(fontSize: 16)),
                )).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedThucDon = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Thực đơn bữa",
                  labelStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nguyenLieuController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Nguyên liệu chính",
                  labelStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Hình ảnh món ăn",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF580B8B)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _selectedImage == null
                      ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload, size: 40, color: Colors.blue),
                        Text("Click here to Upload", style: TextStyle(color: Colors.blue, fontSize: 16)),
                      ],
                    ),
                  )
                      : Image.file(
                    File(_selectedImage!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveMenuItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9317AE), // Màu tím
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                ),
                child: const Center(
                  child: Text("Thêm mới món ăn", style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
