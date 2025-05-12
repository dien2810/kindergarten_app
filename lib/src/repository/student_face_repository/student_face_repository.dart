import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/student_face/student_face.dart';

class StudentFaceRepository extends GetxController{
  static StudentFaceRepository get instance => Get.find();
  final CollectionReference _studentFaceCollection = FirebaseFirestore.instance.collection('studentFace');
  // Thêm một document mới vào Firestore

  Future<List<StudentFace>> getStudentFaceList() async {
    try {
      final querySnapshot = await _studentFaceCollection.get();

      // Chuyển đổi từng document thành StudentFace
      return querySnapshot.docs
          .map((doc) => StudentFace.fromMap(doc.data() as Map<String, dynamic>)..id = doc.id)
          .toList();
    } catch (e) {
      print('Lỗi khi lấy danh sách khuôn mặt: $e');
      return [];
    }
  }

  Future<StudentFace?> getStudentFaceById(String id) async {
    final snapshot = await _studentFaceCollection.doc(id).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return StudentFace.fromMap(data)..id=snapshot.id; // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addStudentFace(StudentFace studentFace) async {
    try {
      await _studentFaceCollection.doc(studentFace.id).set(studentFace.toMap());
      print("StudentFace added successfully");
    } catch (e) {
      print("Failed to add StudentFace: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteStudentFace(String studentFaceId) async {
    try {
      await _studentFaceCollection.doc(studentFaceId).delete();
      print("StudentFace deleted successfully");
    } catch (e) {
      print("Failed to delete StudentFace: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateStudentFace(StudentFace studentFace) async {
    try {
      await _studentFaceCollection.doc(studentFace.id).update(studentFace.toMap());
      print("StudentFace updated successfully");
    } catch (e) {
      print("Failed to update StudentFace: $e");
    }
  }
}