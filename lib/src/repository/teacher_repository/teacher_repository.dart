import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/teacher/teacher_model.dart';

class TeacherRepository extends GetxController{
  static TeacherRepository get instance => Get.find();
  final CollectionReference _teacherCollection = FirebaseFirestore.instance.collection('teacher');
  // Thêm một document mới vào Firestore
  Future<TeacherModel?> getTeacherById(String teacherId) async {
    final snapshot = await _teacherCollection.doc(teacherId).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return TeacherModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addTeacher(TeacherModel teacher) async {
    try {
      await _teacherCollection.doc(teacher.id).set(teacher.toMap());
      print("Teacher added successfully");
    } catch (e) {
      print("Failed to add Teacher: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteTeacher(String teacherId) async {
    try {
      await _teacherCollection.doc(teacherId).delete();
      print("Teacher deleted successfully");
    } catch (e) {
      print("Failed to delete Teacher: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateTeacher(TeacherModel teacher) async {
    try {
      await _teacherCollection.doc(teacher.id).update(teacher.toMap());
      print("Teacher updated successfully");
    } catch (e) {
      print("Failed to update Teacher: $e");
    }
  }
}