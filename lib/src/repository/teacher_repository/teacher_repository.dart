import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/teacher/teacher_model.dart';

class TeacherRepository extends GetxController{
  static TeacherRepository get instance => Get.find();
  final CollectionReference _teacherCollection = FirebaseFirestore.instance.collection('teacher');

  Future<TeacherModel?> getTeacherByTeacherId(String teacherId) async {
    final snapshot = await _teacherCollection
        .where('teacherID', isEqualTo: teacherId).limit(1)
        .get();
    if (snapshot.docs.isNotEmpty) {
      final data = snapshot.docs[0].data() as Map<String,dynamic>;
      final teacher = TeacherModel.fromMap(data)..id=snapshot.docs[0].id; // Chuyển đổi dữ liệu thành model
      return teacher;
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  Future<TeacherModel?> getTeacherById(String teacherId) async {
    final snapshot = await _teacherCollection.doc(teacherId).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return TeacherModel.fromMap(data)..id=snapshot.id; // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  Future<TeacherModel?> getTeacherByTeacherID(String teacherId) async {
    final snapshot = await _teacherCollection.where('teacherID', isEqualTo: teacherId).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      final teacherData = snapshot.docs.first.data() as Map<String, dynamic>;
      return TeacherModel.fromMap(teacherData)..id=snapshot.docs.first.id;
    } else {
      return null;
    }
  }

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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getFullNameByTeacherID(String inputTeacherID) async {
    try {
      final snapshot = await _firestore.collection('teacher')
          .where('teacherID', isEqualTo: inputTeacherID)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final teacherData = snapshot.docs.first.data();
        String firstName = teacherData['firstName'] ?? '';
        String lastName = teacherData['lastName'] ?? '';
        return '$firstName $lastName'.trim();
      } else {
        throw Exception("No teacher found with teacherID: $inputTeacherID");
      }
    } catch (e) {
      print("Error fetching teacher full name: $e");
      return "Error fetching teacher full name"; // Trả về chuỗi thông báo lỗi
    }
  }
}