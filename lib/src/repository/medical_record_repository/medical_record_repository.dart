import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/student/models/medical_record/medical_record_model.dart';

class MedicalRecordRepository extends GetxController{
  static MedicalRecordRepository get instance => Get.find();
  final CollectionReference _medicalRecordCollection = FirebaseFirestore.instance.collection('medicalRecord');
  // Thêm một document mới vào Firestore
  Future<List<MedicalRecordModel>> getMedicalRecord(String studentID) async {
    try{
      final snapshot =
      await _medicalRecordCollection.where("studentID", isEqualTo: studentID).get();
      print('Snapshot: ${snapshot.docs}');
      final medicalRecordData = snapshot.docs.map((e) => MedicalRecordModel.fromFirestore(e)).toList();
      return medicalRecordData;
    } catch(e){
      print("Fail to catch MedicalRecord: $e");
      return [];
    }
  }

  Future<MedicalRecordModel> getMedicalRecordDetails(String studentID) async {
    print(studentID);
    final snapshot =
    await _medicalRecordCollection.where("studentID", isEqualTo: studentID).get();
    final medicalRecordData = snapshot.docs.map((e) => MedicalRecordModel.fromFirestore(e)).single;
    return medicalRecordData;
  }

  // Thêm một document vào Firestore
  Future<void> addMedicalRecord(MedicalRecordModel medicalRecord) async {
    try {
      await _medicalRecordCollection.doc(medicalRecord.id).set(medicalRecord.toJson());
      print("MedicalRecord added successfully");
    } catch (e) {
      print("Failed to add MedicalRecord: $e");
    }
  }
  // Xóa một document dựa trên Id
  Future<void> deleteMedicalRecord(String medicalRecordId) async {
    try {
      await _medicalRecordCollection.doc(medicalRecordId).delete();
      print("MedicalRecord deleted successfully");
    } catch (e) {
      print("Failed to delete MedicalRecord: $e");
    }
  }
  // Cập nhật một document trong Firestore
  Future<void> updateMedicalRecord(MedicalRecordModel medicalRecord) async {
    try {
      await _medicalRecordCollection.doc(medicalRecord.id).update(medicalRecord.toJson());
      print("MedicalRecord updated successfully");
    } catch (e) {
      print("Failed to update MedicalRecord: $e");
    }
  }
}