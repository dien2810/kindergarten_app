import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kindergarten_app/src/common_widgets/cloud_image/cloud_image_widget.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/diem_danh/teacher_diem_danh_controller.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';
import 'dart:io';

import '../../../../../constants/text_strings.dart';
import '../screen/teacher_xem_chi_tiet_anh_screen.dart';

class TeacherDiemDanhCardWidget extends StatefulWidget {
  final String studentName;
  final Map<String, dynamic> attendanceDetails;
  final Function(Map<String, dynamic>) onUpdate; // Callback để truyền dữ liệu cập nhật

  const TeacherDiemDanhCardWidget({
    super.key,
    required this.studentName,
    required this.attendanceDetails,
    required this.onUpdate,
  });

  @override
  _TeacherDiemDanhCardWidgetState createState() => _TeacherDiemDanhCardWidgetState();
}

class _TeacherDiemDanhCardWidgetState extends State<TeacherDiemDanhCardWidget> {
  late String selectedStatus;
  late String checkinTime;
  late String checkoutTime;

  String? checkinImage;
  String? checkoutImage;
  late String _selectedDate;

  final ImagePicker _picker = ImagePicker();

  final List<String> statuses = ['vắng không phép', 'vắng có phép', 'đúng giờ', 'đến muộn'];
  @override
  void initState() {
    super.initState();
    selectedStatus = widget.attendanceDetails['absentStatus'] ?? statuses[0];
    checkinTime = widget.attendanceDetails['checkinTime'] ?? 'N/A';
    checkoutTime = widget.attendanceDetails['checkoutTime'] ?? 'N/A';
    checkinImage = widget.attendanceDetails['checkinImage'] != null && widget.attendanceDetails['checkinImage'] != ""
        ? (widget.attendanceDetails['checkinImage'])
        : null;
    checkoutImage = widget.attendanceDetails['checkoutImage'] != null && widget.attendanceDetails['checkoutImage'] != ""
        ? (widget.attendanceDetails['checkoutImage'])
        : null;
    final diemDanhController = Get.put(TeacherDiemDanhController());
    _selectedDate = Helper.formatDateToString(diemDanhController.selectedDay.value);
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'vắng có phép':
        return const Color(0xFF6BC5FF);
      case 'vắng không phép':
        return const Color(0xFFF14F4F);
      case 'đến muộn':
        return const Color(0xFF505050);
      case 'đúng giờ':
        return Colors.green;
      default:
        return Colors.black; // Giá trị mặc định
    }
  }

  void _updateTime(BuildContext context, bool isCheckin) async {
    TimeOfDay initialTime;

    if (isCheckin) {
      if (checkinTime == 'N/A') {
        initialTime = TimeOfDay.now();
      } else {
        List<String> parts = checkinTime.split(':');
        initialTime = TimeOfDay(
          hour: int.parse(parts[0]),
          minute: int.parse(parts[1]),
        );
      }
    } else {
      if (checkoutTime == 'N/A') {
        initialTime = TimeOfDay.now();
      } else {
        List<String> parts = checkoutTime.split(':');
        initialTime = TimeOfDay(
          hour: int.parse(parts[0]),
          minute: int.parse(parts[1]),
        );
      }
    }

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      setState(() {
        String formattedTime = '${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}';
        if (isCheckin) {
          checkinTime = formattedTime;
        } else {
          checkoutTime = formattedTime;
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(tThoiGianDaCapNhat)),
      );
      _updateAttendanceDetails(); // Cập nhật dữ liệu sau khi thay đổi thời gian
    }
  }

  Future<void> _pickImage(bool isCheckin) async {
    final pickedImage = await showDialog<XFile?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(tChonPhuongThuc),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {
                final image = await _picker.pickImage(source: ImageSource.camera);
                Navigator.pop(context, image);
              },
              child: const Text(tChupAnhTuCamera),
            ),
            SimpleDialogOption(
              onPressed: () async {
                final image = await _picker.pickImage(source: ImageSource.gallery);
                Navigator.pop(context, image);
              },
              child: const Text(tChonAnhTuThuVien),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Hủy'),
            ),
          ],
        );
      },
    );

    if (pickedImage != null) {
      setState(() async {
        if (isCheckin) {
          checkinImage = await Helper.uploadImage(pickedImage);
          widget.attendanceDetails['checkinImage'] = checkinImage; // Cập nhật giá trị trong attendanceDetails
        } else {
          checkoutImage = await Helper.uploadImage(pickedImage);
          widget.attendanceDetails['checkoutImage'] = checkoutImage; // Cập nhật giá trị trong attendanceDetails
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(isCheckin ? 'Ảnh Check-in đã được thêm!' : 'Ảnh Check-out đã được thêm!')),
      );
      _updateAttendanceDetails(); // Cập nhật dữ liệu sau khi thêm ảnh
    }
  }

  void _viewImage(BuildContext context, String? image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent, // Nền trong suốt
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              // Hiển thị ảnh
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CloudImage(publicId: image!)
              ),
              // Nút đóng
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng dialog
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateAttendanceDetails() {
    // Cập nhật dữ liệu vào attendanceDetails
    widget.attendanceDetails['absentStatus'] = selectedStatus;
    widget.attendanceDetails['checkinTime'] = checkinTime;
    widget.attendanceDetails['checkoutTime'] = checkoutTime;
    widget.attendanceDetails['checkinImage'] = checkinImage;
    widget.attendanceDetails['checkoutImage'] = checkoutImage;

    // Gọi callback để truyền dữ liệu cập nhật về widget cha
    Map<String, dynamic> absentDateEntryMap = {
      'day': _selectedDate,
      'absentStatus': selectedStatus,
      'absentTime': '',
      'checkinImage': checkinImage,
      'checkinTime': checkinTime,
      'checkoutImage': checkoutImage,
      'checkoutTime': checkoutTime,
      'period': [],
      'reason': ''
    };
    widget.onUpdate(absentDateEntryMap);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.studentName,
              style: const TextStyle(
                fontSize: 20, // Tăng kích thước font chữ
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 8),
            // Trạng thái điểm danh với màu sắc
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Trạng thái:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                DropdownButton<String>(
                  value: selectedStatus,
                  items: statuses.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedStatus = newValue!;
                    });
                    _updateAttendanceDetails(); // Cập nhật dữ liệu khi thay đổi trạng thái
                  },
                ),
              ],
            ),
            // Ảnh Check-in
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (checkinImage != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherXemChiTietAnhScreen(
                            image: checkinImage!,
                            title: tChiTietAnhCheckin,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    tAnhCheckin,
                    style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (checkinImage == null || checkinImage == '') {
                      _pickImage(true); // Thêm ảnh checkin
                    } else {
                      _viewImage(context, checkinImage);
                    }
                  },
                  child: Text(checkinImage != null?tXemAnh:tThemAnhCheckin),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Ảnh Check-out
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (checkoutImage != null && checkoutImage != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherXemChiTietAnhScreen(
                            image: checkoutImage!,
                            title: tChiTietAnhCheckout,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    tAnhCheckout,
                    style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (checkoutImage == null || checkoutImage == '') {
                      _pickImage(true); // Thêm ảnh checkin
                    } else {
                      _viewImage(context, checkinImage);
                    }
                  },
                  child: Text(checkinImage != null?tXemAnh:tThemAnhCheckin),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Thời gian Check-in và Check-out
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _updateTime(context, true),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.purple), // Thêm icon
                      const SizedBox(width: 6),
                      Text(tCheckin + checkinTime),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _updateTime(context, false),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.purple), // Thêm icon
                      const SizedBox(width: 6),
                      Text(tCheckout + checkoutTime),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}