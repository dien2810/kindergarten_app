import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/semester/semester_model.dart';

class SemesterRepository extends GetxController{
  static SemesterRepository get instance => Get.find();
  final CollectionReference _semesterCollection = FirebaseFirestore.instance.collection('semester');
  // Thêm một document mới vào Firestore

  Future<List<SemesterModel>> getSemesterList() async {
    try {
      final querySnapshot = await _semesterCollection.get();

      // Chuyển đổi từng document thành SemesterModel
      return querySnapshot.docs
          .map((doc) => SemesterModel.fromMap(doc.data() as Map<String, dynamic>)..id = doc.id)
          .toList();
    } catch (e) {
      print('Lỗi khi lấy danh sách học kỳ: $e');
      return [];
    }
  }

  Future<SemesterModel?> getSemesterById(String id) async {
    final snapshot = await _semesterCollection.doc(id).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return SemesterModel.fromMap(data)..id=snapshot.id; // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addSemester(SemesterModel semester) async {
    try {
      await _semesterCollection.doc(semester.id).set(semester.toMap());
      print("Semester added successfully");
    } catch (e) {
      print("Failed to add Semester: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteSemester(String semesterId) async {
    try {
      await _semesterCollection.doc(semesterId).delete();
      print("Semester deleted successfully");
    } catch (e) {
      print("Failed to delete Semester: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateSemester(SemesterModel semester) async {
    try {
      await _semesterCollection.doc(semester.id).update(semester.toMap());
      print("Semester updated successfully");
    } catch (e) {
      print("Failed to update Semester: $e");
    }
  }
}