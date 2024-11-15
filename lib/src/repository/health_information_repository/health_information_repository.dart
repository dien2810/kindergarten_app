import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/health_information/health_information_model.dart';

class HealthInformationRepository extends GetxController{
  static HealthInformationRepository get instance => Get.find();
  final CollectionReference _healthInformationCollection = FirebaseFirestore.instance.collection('healthInformation');
  // Thêm một document mới vào Firestore
  Future<List<HealthInformationModel>> getHealthInformation(String studentID) async {
    try{
      final snapshot =
      await _healthInformationCollection.where("studentID", isEqualTo: studentID).get();
      print('Snapshot: ${snapshot.docs}');
      final healthInformationData = snapshot.docs.map((e) => HealthInformationModel.fromFirestore(e)).toList();
      return healthInformationData;
    } catch(e){
      print("Fail to catch health information: $e");
      return [];
    }
  }

  Future<HealthInformationModel> getHealthInformationDetails(String studentID) async {
    print(studentID);
    final snapshot =
    await _healthInformationCollection.where("studentID", isEqualTo: studentID).get();
    final healthInformationData = snapshot.docs.map((e) => HealthInformationModel.fromFirestore(e)).single;
    return healthInformationData;
  }

  // Thêm một document vào Firestore
  Future<void> addHealthInformation(HealthInformationModel healthInformation) async {
    try {
      await _healthInformationCollection.doc(healthInformation.id).set(healthInformation.toJson());
      print("Health Information added successfully");
    } catch (e) {
      print("Failed to add health information: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteHealthInformation(String healthInformationId) async {
    try {
      await _healthInformationCollection.doc(healthInformationId).delete();
      print("Health Information deleted successfully");
    } catch (e) {
      print("Failed to delete health information: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateHealthInformation(HealthInformationModel healthInformation) async {
    try {
      await _healthInformationCollection.doc(healthInformation.id).update(healthInformation.toJson());
      print("Health Information updated successfully");
    } catch (e) {
      print("Failed to update Health history: $e");
    }
  }
}