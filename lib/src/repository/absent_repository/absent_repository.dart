import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/absent/absent_model.dart';
import '../account_repository/account_repository.dart';

class AbsentRepository extends GetxController{
  static AbsentRepository get instance => Get.find();
  final CollectionReference _absentCollection = FirebaseFirestore.instance.collection('absent');
  final _accountRepo = Get.put(AccountRepository());
  // Thêm một document mới vào Firestore

  Future<AbsentModel?> getAbsentByStudentId(String studentId) async {
    final snapshot = await _absentCollection.doc(studentId).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return AbsentModel.fromMap(data)..id=snapshot.id; // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  Future<AbsentModel?> getAbsentById() async {
    print(_accountRepo.userId);
    final snapshot = await _absentCollection.doc(_accountRepo.userId).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return AbsentModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addAbsent(AbsentModel absent) async {
    try {
      await _absentCollection.doc(absent.id).set(absent.toMap());
      print("Absent added successfully");
    } catch (e) {
      print("Failed to add Absent: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteAbsent(String absentId) async {
    try {
      await _absentCollection.doc(absentId).delete();
      print("Absent deleted successfully");
    } catch (e) {
      print("Failed to delete Absent: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateAbsent(AbsentModel absent) async {
    try {
      await _absentCollection.doc(absent.id).update(absent.toMap());
      print("Absent updated successfully");
    } catch (e) {
      print("Failed to update Absent: $e");
    }
  }

  Future<void> updateAbsentByStudentId(String studentId, Map<String, dynamic> updatedData) async {
    try {
      await _absentCollection.doc(studentId).update(updatedData);
      print("Absent updated successfully for student ID: $studentId");
    } catch (e) {
      print("Failed to update absent for student ID: $studentId - Error: $e");
    }
  }
}