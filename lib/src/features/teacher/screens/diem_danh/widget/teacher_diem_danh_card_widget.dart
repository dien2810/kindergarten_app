import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


import '../screen/teacher_xem_chi_tiet_anh_screen.dart';

class TeacherDiemDanhCardWidget extends StatefulWidget {
  final String studentName;
  final Map<String, dynamic> attendanceDetails;

  const TeacherDiemDanhCardWidget({
    super.key,
    required this.studentName,
    required this.attendanceDetails,
  });

  @override
  _TeacherDiemDanhCardWidgetState createState() => _TeacherDiemDanhCardWidgetState();
}

class _TeacherDiemDanhCardWidgetState extends State<TeacherDiemDanhCardWidget> {
  late String selectedStatus;
  late String checkinTime;
  late String checkoutTime;

  File? checkinImage;
  File? checkoutImage;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.attendanceDetails['absentStatus'] ?? 'N/A';
    checkinTime = widget.attendanceDetails['checkinTime'] ?? 'N/A';
    checkoutTime = widget.attendanceDetails['checkoutTime'] ?? 'N/A';
    checkinImage = widget.attendanceDetails['checkinImage'] != null && widget.attendanceDetails['checkinImage'] != ""
        ? File(widget.attendanceDetails['checkinImage'])
        : null;
    checkoutImage = widget.attendanceDetails['checkoutImage'] != null && widget.attendanceDetails['checkoutImage'] != ""
        ? File(widget.attendanceDetails['checkoutImage'])
        : null;
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
        SnackBar(content: Text('Thời gian đã được cập nhật!')),
      );
    }
  }

  Future<void> _pickImage(bool isCheckin) async {
    final pickedImage = await showDialog<File?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Chọn phương thức'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {
                final image = await _picker.getImage(source: ImageSource.camera);
                Navigator.pop(context, image != null ? File(image.path) : null);
              },
              child: const Text('Chụp ảnh từ Camera'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                final image = await _picker.getImage(source: ImageSource.gallery);
                Navigator.pop(context, image != null ? File(image.path) : null);
              },
              child: const Text('Chọn ảnh từ Thư viện'),
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
      setState(() {
        if (isCheckin) {
          checkinImage = pickedImage;
          widget.attendanceDetails['checkinImage'] = pickedImage.path; // Cập nhật giá trị trong attendanceDetails
        } else {
          checkoutImage = pickedImage;
          widget.attendanceDetails['checkoutImage'] = pickedImage.path; // Cập nhật giá trị trong attendanceDetails
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(isCheckin ? 'Ảnh Check-in đã được thêm!' : 'Ảnh Check-out đã được thêm!')),
      );
    }
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
                color : Colors.purple,
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
                  dropdownColor: _getStatusColor(selectedStatus).withOpacity(0.1), // Màu nền dropdown
                  style: TextStyle(color: _getStatusColor(selectedStatus)), // Màu chữ
                  items: <String>['vắng không phép', 'vắng có phép', 'đúng giờ', 'đến muộn']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(fontSize: 16)), // Giảm kích thước font chữ
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedStatus = newValue!;
                    });
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
                    // Chuyển đến trang xem ảnh check-in
                    // Chuyển đến trang xem ảnh check-in
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherXemChiTietAnhScreen(
                          image: checkinImage,
                          title: "Chi tiết Ảnh Check-in",
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Ảnh Check-in",
                    style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                if (checkinImage == null || checkinImage!.path.isEmpty) // Hiển thị nút thêm ảnh chỉ khi không có ảnh
                  ElevatedButton(
                    onPressed: () {
                      _pickImage(true); // Thêm ảnh check-in
                      // tiếp theo là lấy cái ảnh này bỏ vào lưu trên data online (xử lý be)
                    },
                    child: const Text("Thêm ảnh checkin"),
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
                    // Chuyển đến trang xem ảnh check-out
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherXemChiTietAnhScreen(
                          image: checkoutImage,
                          title: "Chi tiết Ảnh Check-out",
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Ảnh Check-out",
                    style: TextStyle(color: Colors.red, fontSize: 16, fontWeight:FontWeight.bold  ),
                  ),
                ),
                if (checkoutImage == null || checkoutImage!.path.isEmpty) // Hiển thị nút thêm ảnh chỉ khi không có ảnh
                  ElevatedButton(
                    onPressed: () {
                      _pickImage(false); // Thêm ảnh check-out
                      // tiếp theo là lấy cái ảnh này bỏ vào lưu trên data online (xử lý be)
                    },
                    child: const Text("Thêm ảnh checkout"),
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
                      Text("Check-in: $checkinTime"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _updateTime(context, false),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.purple), // Thêm icon
                      const SizedBox(width: 6),
                      Text("Check-out: $checkoutTime"),
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