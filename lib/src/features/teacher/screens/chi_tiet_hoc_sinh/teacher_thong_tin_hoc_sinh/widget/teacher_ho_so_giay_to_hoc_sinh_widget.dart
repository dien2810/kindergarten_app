import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/features/teacher/controllers/thong_tin_hoc_sinh/teacher_thong_tin_hoc_sinh_controller.dart';

import '../../../../../student/models/student/student_model.dart';

class TeacherHoSoGiayToHocSinhWidget extends StatelessWidget {
  final StudentModel student; // Biến cho đối tượng hồ sơ

  const TeacherHoSoGiayToHocSinhWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final TeacherThongTinHocSinhController controller = Get.put(TeacherThongTinHocSinhController());

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: controller.getGuardianData(student.studentProfile.studentID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            else if (!snapshot.hasData) {
              return const Center(child: Text('Không có dữ liệu.'));
            }
            final guardian = snapshot.data;
            controller.guardianModel = guardian!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        tHoTenCha, // Hiển thị tên thuộc tính
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: controller.hoCha,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: tHoTenCha, // Sử dụng biến gợi ý
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          controller.hoCha.text = value;
                          controller.studentModel.studentProfile.fatherFullname = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        tHoTenMe, // Hiển thị tên thuộc tính
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: controller.hoMe,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: tHoTenMe, // Sử dụng biến gợi ý
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          controller.hoMe.text = value;
                          controller.studentModel.studentProfile.motherFullname = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        tNgheNghiepCuaCha, // Hiển thị tên thuộc tính
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: controller.ngheCha,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: tNgheNghiepCuaCha, // Sử dụng biến gợi ý
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          controller.ngheCha.text = value;
                          controller.studentModel.studentProfile.fatherOccupation = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        tNgheNghiepCuaMe, // Hiển thị tên thuộc tính
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: controller.ngheMe,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: tNgheNghiepCuaMe, // Sử dụng biến gợi ý
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          controller.ngheMe.text = value;
                          controller.studentModel.studentProfile.motherOccupation = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        tSoDienThoai, // Hiển thị tên thuộc tính
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: controller.soDienThoai,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: tSoDienThoai, // Sử dụng biến gợi ý
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          controller.soDienThoai.text = value;
                          controller.guardianModel.phoneNumber = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        tDiaChiEmail, // Hiển thị tên thuộc tính
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: controller.email,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: tDiaChiEmail, // Sử dụng biến gợi ý
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          controller.email.text = value;
                          controller.guardianModel.email = value;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        tDiaChiThuongTru, // Hiển thị tên thuộc tính
                        style: TextStyle(fontSize: 16, color: Color(0xFF505050)),
                      ),
                      TextField(
                        controller: controller.diaChi,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          hintText: tDiaChiThuongTru, // Sử dụng biến gợi ý
                          hintStyle: TextStyle(color: Colors.grey), // Màu của hint text
                        ),
                        maxLines: null, // Cho phép nhiều dòng
                        minLines: 1, // Ít nhất 1 dòng
                        onChanged: (value) {
                          controller.diaChi.text = value;
                          controller.guardianModel.address = value;
                        },
                      ),
                    ],
                  ),
                ),
                // _buildEditableDocumentField(tHoTenCha, student.studentProfile.fatherFullname),
                // _buildEditableDocumentField(tHoTenMe, student.studentProfile.motherFullname),
                // _buildEditableDocumentField(tNgheNghiepCuaCha, student.studentProfile.fatherOccupation),
                // _buildEditableDocumentField(tNgheNghiepCuaMe, student.studentProfile.motherOccupation),
                // _buildEditableDocumentField(tSoDienThoai, guardian!.phoneNumber),
                // _buildEditableDocumentField(tDiaChiEmail, guardian.email),
                // _buildEditableDocumentField(tDiaChiThuongTru, student.studentProfile.name),
                GestureDetector(
                  onTap: () {
                    controller.toggleImage('photo4x6');
                  },
                  child: Obx(() => _buildDocumentField(
                    "$tAnhHocSinh ${controller.hasPhoto4x6.value ? tDaNop : tBamVaoDeNop}",
                    textColor: controller.hasPhoto4x6.value ? Colors.green : Colors.red,
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    controller.toggleImage('birthCertificate');
                  },
                  child: Obx(() => _buildDocumentField(
                    "$tAnhGiayKhaiSinh ${controller.hasBirthCertificate.value ? tDaNop : tBamVaoDeNop}",
                    textColor: controller.hasBirthCertificate.value ? Colors.green : Colors.red,
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    controller.toggleImage('householdRegistration');
                  },
                  child: Obx(() => _buildDocumentField(
                    "$tAnhSoHoKhau ${controller.hasHouseholdRegistration.value ? tDaNop : tBamVaoDeNop}",
                    textColor: controller.hasHouseholdRegistration.value ? Colors.green : Colors.red,
                  )),
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  // Hàm để tạo khung có thể chỉnh sửa
  Widget _buildEditableDocumentField(String label, String initialText) {
    final textController = TextEditingController(text: initialText);
    final hintText = "Nhập $label"; // Tạo biến gợi ý

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label, // Hiển thị tên thuộc tính
            style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
          ),
          TextField(
            controller: textController,
            style: const TextStyle(fontSize: 16, color: Color(0xFF505050)),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              hintText: hintText, // Sử dụng biến gợi ý
              hintStyle: const TextStyle(color: Colors.grey), // Màu của hint text
            ),
            maxLines: null, // Cho phép nhiều dòng
            minLines: 1, // Ít nhất 1 dòng
            onChanged: (value) {
              // Xử lý khi nội dung thay đổi
              print("Nội dung mới: $value");
            },
          ),
        ],
      ),
    );
  }

  // Hàm tạo khung cho văn bản tĩnh
  Widget _buildDocumentField(String text, {Color textColor = const Color(0xFF505050)}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: textColor),
        softWrap: true,
      ),
    );
  }
}