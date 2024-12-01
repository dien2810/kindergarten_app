import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/activities/activities_model.dart';

class ActivitiesRepository extends GetxController{
  static ActivitiesRepository get instance => Get.find();
  final CollectionReference _activitiesCollection = FirebaseFirestore.instance.collection('activities');
  // Thêm một document mới vào Firestore
  Future<ActivitiesModel?> getActivitiesById() async {
    final snapshot = await _activitiesCollection.doc('activities_class_id_1').get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return ActivitiesModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addActivities(ActivitiesModel activities) async {
    try {
      await _activitiesCollection.doc(activities.id).set(activities.toMap());
      print("Activities added successfully");
    } catch (e) {
      print("Failed to add Activities: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteActivities(String activitiesId) async {
    try {
      await _activitiesCollection.doc(activitiesId).delete();
      print("Activities deleted successfully");
    } catch (e) {
      print("Failed to delete Activities: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateActivities(ActivitiesModel activities) async {
    try {
      await _activitiesCollection.doc(activities.id).update(activities.toMap());
      print("Activities updated successfully");
    } catch (e) {
      print("Failed to update Activities: $e");
    }
  }
}