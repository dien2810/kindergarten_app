import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/activities/activities_model.dart';

class ActivitiesRepository extends GetxController{
  static ActivitiesRepository get instance => Get.find();
  final CollectionReference _activitiesCollection = FirebaseFirestore.instance.collection('activities');
  // Thêm một document mới vào Firestore
  Future<ActivitiesModel?> getActivitiesById(String id) async {
    final snapshot = await _activitiesCollection.doc(id).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return ActivitiesModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  Future<ActivitiesModel?> getActivitiesByClassId(String classID) async {
    try {
      final snapshot = await _activitiesCollection.where('classID', isEqualTo: classID).get();

      final doc = snapshot.docs.first;
      print("Activity retrieved successfully");
      return ActivitiesModel.fromMap(doc.data() as Map<String, dynamic>)..id = doc.id;
    } catch (e) {
      print("Failed to retrieve activity: $e");
      throw Exception('Error fetching activity: $e');
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