import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/medicine/medicine_model.dart';

class MedicineRepository extends GetxController{
  static MedicineRepository get instance => Get.find();
  //final _db = FirebaseFirestore.instance;
  final CollectionReference _medicineCollection = FirebaseFirestore.instance.collection('medicine');
  // Thêm một document medicine mới vào Firestore

  Future<List<MedicineModel>> allMedicineByClassName(String className) async {
    try{
      final snapshot =
      await _medicineCollection.where("receivedPerson", isEqualTo: className).get();
      print('Snapshot: ${snapshot.docs}');
      final medicineData = snapshot.docs.map((e) => MedicineModel.fromFirestore(e)).toList();
      return medicineData;
    } catch(e){
      print("Fail to catch medicines: $e");
      return [];
    }
  }

  Future<List<MedicineModel>> allMedicine(String studentID) async {
    try{
      final snapshot =
        await _medicineCollection.where("studentID", isEqualTo: studentID).get();
      print('Snapshot: ${snapshot.docs}');
      final medicineData = snapshot.docs.map((e) => MedicineModel.fromFirestore(e)).toList();
      return medicineData;
    } catch(e){
      print("Fail to catch medicines: $e");
      return [];
    }
  }
  // Thêm một document medicine mới vào Firestore
  Future<void> addMedicine(MedicineModel medicine) async {
    try {
      await _medicineCollection.doc(medicine.id).set(medicine.toJson());
      print("Medicine added successfully");
    } catch (e) {
      print("Failed to add medicine: $e");
    }
  }
  // Xóa một document medicine dựa trên medicineId
  Future<void> deleteMedicine(String medicineId) async {
    try {
      await _medicineCollection.doc(medicineId).delete();
      print("Medicine deleted successfully");
    } catch (e) {
      print("Failed to delete medicine: $e");
    }
  }
  // Cập nhật một document medicine trong Firestore
  Future<void> updateMedicine(MedicineModel medicine) async {
    try {
      await _medicineCollection.doc(medicine.id).update(medicine.toJson());
      print("Medicine updated successfully");
    } catch (e) {
      print("Failed to update medicine: $e");
    }
  }
}