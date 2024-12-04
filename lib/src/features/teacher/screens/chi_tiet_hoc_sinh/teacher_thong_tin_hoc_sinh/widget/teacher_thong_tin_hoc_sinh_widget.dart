import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants/text_strings.dart';
import '../../../../../student/models/student/student_model.dart';
import '../../../../controllers/thong_tin_hoc_sinh/teacher_thong_tin_hoc_sinh_controller.dart';

class TeacherThongTinHocSinhWidget extends StatelessWidget {
  final StudentModel student; // Thêm biến cho đối tượng thông tin học sinh

  const TeacherThongTinHocSinhWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final teacherThongTinHocSinhController = Get.put(TeacherThongTinHocSinhController());
    return FutureBuilder(
      future: teacherThongTinHocSinhController.loadStudentInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity, // Chiều rộng toàn màn hình
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Màu nền
                    borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các widget trong cột
                    children: [
                      const Text(
                        tHoTen, // Hiển thị label
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: teacherThongTinHocSinhController.hoTen,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Loại bỏ viền
                          isDense: true, // Giảm padding mặc định
                          hintText: "Nhập $tHoTen", // Gợi ý nhập
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          // Xử lý khi nội dung thay đổi
                          teacherThongTinHocSinhController.hoTen.text = value;
                          teacherThongTinHocSinhController.studentModel.studentProfile.name = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity, // Chiều rộng toàn màn hình
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Màu nền
                    borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các widget trong cột
                    children: [
                      const Text(
                        tMaHocSinh, // Hiển thị label
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: teacherThongTinHocSinhController.maHocSinh,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Loại bỏ viền
                          isDense: true, // Giảm padding mặc định
                          hintText: "Nhập $tMaHocSinh", // Gợi ý nhập
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          // Xử lý khi nội dung thay đổi
                          teacherThongTinHocSinhController.maHocSinh.text = value;
                          teacherThongTinHocSinhController.studentModel.studentProfile.studentID = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity, // Chiều rộng toàn màn hình
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Màu nền
                    borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các widget trong cột
                    children: [
                      const Text(
                        tMaHocSinh, // Hiển thị label
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: teacherThongTinHocSinhController.ngaySinh,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Loại bỏ viền
                          isDense: true, // Giảm padding mặc định
                          hintText: "Nhập $tNgaySinh", // Gợi ý nhập
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          // Xử lý khi nội dung thay đổi
                          teacherThongTinHocSinhController.ngaySinh.text = value;
                          teacherThongTinHocSinhController.studentModel.studentProfile.dateOfBirth = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity, // Chiều rộng toàn màn hình
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Màu nền
                    borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các widget trong cột
                    children: [
                      const Text(
                        tGioiTinh, // Hiển thị label
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: teacherThongTinHocSinhController.gioiTinh,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Loại bỏ viền
                          isDense: true, // Giảm padding mặc định
                          hintText: "Nhập $tGioiTinh", // Gợi ý nhập
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          // Xử lý khi nội dung thay đổi
                          teacherThongTinHocSinhController.gioiTinh.text = value;
                          teacherThongTinHocSinhController.studentModel.studentProfile.gender = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity, // Chiều rộng toàn màn hình
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Màu nền
                    borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các widget trong cột
                    children: [
                      const Text(
                        tTruong, // Hiển thị label
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: teacherThongTinHocSinhController.truong,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Loại bỏ viền
                          isDense: true, // Giảm padding mặc định
                          hintText: "Nhập $tTruong", // Gợi ý nhập
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          // Xử lý khi nội dung thay đổi
                          teacherThongTinHocSinhController.truong.text = value;
                          teacherThongTinHocSinhController.studentModel.studentProfile.school = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity, // Chiều rộng toàn màn hình
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Màu nền
                    borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các widget trong cột
                    children: [
                      const Text(
                        tHe, // Hiển thị label
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: teacherThongTinHocSinhController.he,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Loại bỏ viền
                          isDense: true, // Giảm padding mặc định
                          hintText: "Nhập $tHe", // Gợi ý nhập
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          // Xử lý khi nội dung thay đổi
                          teacherThongTinHocSinhController.he.text = value;
                          teacherThongTinHocSinhController.studentModel.studentProfile.educationSystem = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity, // Chiều rộng toàn màn hình
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Màu nền
                    borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các widget trong cột
                    children: [
                      const Text(
                        tMaHocSinh, // Hiển thị label
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: teacherThongTinHocSinhController.maHocSinh,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Loại bỏ viền
                          isDense: true, // Giảm padding mặc định
                          hintText: "Nhập $tMaHocSinh", // Gợi ý nhập
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          // Xử lý khi nội dung thay đổi
                          teacherThongTinHocSinhController.maHocSinh.text = value;
                          teacherThongTinHocSinhController.studentModel.studentProfile.studentID = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity, // Chiều rộng toàn màn hình
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Màu nền
                    borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các widget trong cột
                    children: [
                      const Text(
                        tKhoi, // Hiển thị label
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: teacherThongTinHocSinhController.khoi,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Loại bỏ viền
                          isDense: true, // Giảm padding mặc định
                          hintText: "Nhập $tKhoi", // Gợi ý nhập
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          // Xử lý khi nội dung thay đổi
                          teacherThongTinHocSinhController.khoi.text = value;
                          if (int.tryParse(value) != null){
                            teacherThongTinHocSinhController.studentModel.studentProfile.gradeLevel = int.parse(value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity, // Chiều rộng toàn màn hình
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9), // Màu nền
                    borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các widget trong cột
                    children: [
                      const Text(
                        tLop, // Hiển thị label
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: teacherThongTinHocSinhController.lop,
                        readOnly: true,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Loại bỏ viền
                          isDense: true, // Giảm padding mặc định
                          hintText: "Nhập $tLop", // Gợi ý nhập
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}