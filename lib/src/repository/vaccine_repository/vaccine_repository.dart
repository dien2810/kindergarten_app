import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/student/models/vaccine/vaccine_model.dart';

class VaccineRepository {
  final CollectionReference _vaccineCollection =
  FirebaseFirestore.instance.collection('vaccine');

  // Thêm một vaccine mới
  Future<void> addVaccine(VaccineModel vaccine) async {
    try {
      await _vaccineCollection.add(vaccine.toJson());
    } catch (e) {
      throw Exception('Error adding vaccine: $e');
    }
  }

  // Lấy tất cả vaccines
  Future<List<VaccineModel>> getAllVaccines() async {
    try {
      QuerySnapshot snapshot = await _vaccineCollection.get();
      return snapshot.docs.map((doc) => VaccineModel.fromFirestore(doc)).toList();
    } catch (e) {
      throw Exception('Error fetching vaccines: $e');
    }
  }

  // Lấy vaccine theo ID
  Future<VaccineModel?> getVaccineById(String id) async {
    try {
      DocumentSnapshot doc = await _vaccineCollection.doc(id).get();
      if (doc.exists) {
        return VaccineModel.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      throw Exception('Error fetching vaccine: $e');
    }
  }

  // Cập nhật vaccine
  Future<void> updateVaccine(VaccineModel vaccine) async {
    try {
      if (vaccine.id == null) {
        throw Exception('Vaccine ID is required for update');
      }
      await _vaccineCollection.doc(vaccine.id).update(vaccine.toJson());
    } catch (e) {
      throw Exception('Error updating vaccine: $e');
    }
  }

  // Xóa vaccine
  Future<void> deleteVaccine(String id) async {
    try {
      await _vaccineCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Error deleting vaccine: $e');
    }
  }
}