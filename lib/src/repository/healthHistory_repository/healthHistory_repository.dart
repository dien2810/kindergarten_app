import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/health_history/health_history_model.dart';

class HealthHistoryRepository extends GetxController{
  static HealthHistoryRepository get instance => Get.find();
  final CollectionReference _healthHistoryCollection = FirebaseFirestore.instance.collection('healthHistory');
  // Thêm một document mới vào Firestore
  Future<List<HealthHistoryModel>> getHealthHistory(String studentID) async {
    try{
      final snapshot =
      await _healthHistoryCollection.where("studentID", isEqualTo: studentID).get();
      print('Snapshot: ${snapshot.docs}');
      final healthHistoryData = snapshot.docs.map((e) => HealthHistoryModel.fromFirestore(e)).toList();
      return healthHistoryData;
    } catch(e){
      print("Fail to catch health history: $e");
      return [];
    }
  }

  Future<HealthHistoryModel> getHealthHistoryDetails(String studentID) async {
    final snapshot =
    await _healthHistoryCollection.where("studentID", isEqualTo: studentID).get();
    final healthHistoryData = snapshot.docs.map((e) => HealthHistoryModel.fromFirestore(e)).single;
    return healthHistoryData;
  }

  // Thêm một document vào Firestore
  Future<void> addHealthHistory(HealthHistoryModel healthHistory) async {
    try {
      await _healthHistoryCollection.doc(healthHistory.id).set(healthHistory.toJson());
      print("Health History added successfully");
    } catch (e) {
      print("Failed to add health history: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteHealthHistory(String healthHistoryId) async {
    try {
      await _healthHistoryCollection.doc(healthHistoryId).delete();
      print("Health History deleted successfully");
    } catch (e) {
      print("Failed to delete health history: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateHealthHistory(HealthHistoryModel healthHistory) async {
    try {
      await _healthHistoryCollection.doc(healthHistory.id).update(healthHistory.toJson());
      print("Health History updated successfully");
    } catch (e) {
      print("Failed to update Health history: $e");
    }
  }
}