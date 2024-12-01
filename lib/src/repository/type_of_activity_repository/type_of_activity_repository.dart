import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/type_of_activity/type_of_activity_model.dart';



class TypeOfActivityRepository extends GetxController{
  static TypeOfActivityRepository get instance => Get.find();
  final CollectionReference _typeOfActivityCollection = FirebaseFirestore.instance.collection('typeOfActivity');
  // Thêm một document mới vào Firestore
  Future<TypeOfActivityModel?> getTypeOfActivityById(String id) async {
    final snapshot = await _typeOfActivityCollection.doc(id).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      return TypeOfActivityModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  // Thêm một document vào Firestore
  Future<void> addTypeOfActivity(TypeOfActivityModel typeOfActivity) async {
    try {
      await _typeOfActivityCollection.doc(typeOfActivity.id).set(typeOfActivity.toMap());
      print("TypeOfActivity added successfully");
    } catch (e) {
      print("Failed to add TypeOfActivity: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteTypeOfActivity(String typeOfActivityId) async {
    try {
      await _typeOfActivityCollection.doc(typeOfActivityId).delete();
      print("TypeOfActivity deleted successfully");
    } catch (e) {
      print("Failed to delete TypeOfActivity: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateTypeOfActivity(TypeOfActivityModel typeOfActivity) async {
    try {
      await _typeOfActivityCollection.doc(typeOfActivity.id).update(typeOfActivity.toMap());
      print("TypeOfActivity updated successfully");
    } catch (e) {
      print("Failed to update TypeOfActivity: $e");
    }
  }
}