import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import 'package:kindergarten_app/src/utils/helper_controller/helper_controller.dart';

import '../../features/student/models/student/student_model.dart';

class StudentRepository extends GetxController{
  static StudentRepository get instance => Get.find();
  final CollectionReference _studentCollection = FirebaseFirestore.instance.collection('student');
  final _accountRepo = Get.put(AccountRepository());
  // Thêm một document mới vào Firestore
  Future<StudentModel?> getStudentById() async {
    final snapshot = await _studentCollection.doc(_accountRepo.userId).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return StudentModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addStudent(StudentModel student) async {
    try {
      await _studentCollection.doc(student.id).set(student.toMap(), SetOptions(merge: true));
      Helper.successSnackBar(title: tDaThemThanhCong, message: "Cập nhật học sinh thành công!");
      print("Student added successfully");
    } catch (e) {
      print("Failed to add Student: $e");
      Helper.successSnackBar(title: "Thất bại", message: "Thêm học sinh thất bại!");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteStudent(String studentId) async {
    try {
      await _studentCollection.doc(studentId).delete();
      print("Student deleted successfully");
    } catch (e) {
      print("Failed to delete Student: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateStudent(StudentModel student) async {
    try {
      await _studentCollection.doc(student.id).update(student.toMap());
      print("Student updated successfully");
    } catch (e) {
      print("Failed to update Student: $e");
    }
  }
}