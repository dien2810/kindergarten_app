import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/student/models/vaccine/dose.dart';
import '../../features/student/models/vaccine/vaccine_history_model.dart';

class VaccineHistoryRepository {
  final CollectionReference _vaccineHistoryCollection =
  FirebaseFirestore.instance.collection('vaccinationHistory');

  // Thêm một vaccine history mới
  Future<String> addVaccineHistory(VaccineHistoryModel vaccineHistory) async {
    try {
      DocumentReference docRef = await _vaccineHistoryCollection.add(vaccineHistory.toJson());
      return docRef.id; // Trả về ID của document vừa được thêm
    } catch (e) {
      throw Exception('Error adding vaccine history: $e');
    }
  }

  // Lấy tất cả vaccine history
  Future<List<VaccineHistoryModel>> getAllVaccineHistory() async {
    try {
      QuerySnapshot snapshot = await _vaccineHistoryCollection.get();
      return snapshot.docs
          .map((doc) => VaccineHistoryModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Error fetching vaccine history: $e');
    }
  }

  // Lấy vaccine history theo ID
  Future<VaccineHistoryModel?> getVaccineHistoryById(String id) async {
    try {
      DocumentSnapshot doc = await _vaccineHistoryCollection.doc(id).get();
      if (doc.exists) {
        return VaccineHistoryModel.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      throw Exception('Error fetching vaccine history: $e');
    }
  }

  // Lấy vaccine history theo vaccineID
  Future<List<VaccineHistoryModel>> getVaccineHistoryByVaccineID(
      String vaccineID) async {
    try {
      QuerySnapshot snapshot = await _vaccineHistoryCollection
          .where('vaccineID', isEqualTo: vaccineID)
          .get();
      return snapshot.docs
          .map((doc) => VaccineHistoryModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Error fetching vaccine history by vaccineID: $e');
    }
  }

  // Cập nhật toàn bộ vaccine history
  Future<void> updateVaccineHistory(VaccineHistoryModel vaccineHistory) async {
    try {
      if (vaccineHistory.id == null) {
        throw Exception('Vaccine History ID is required for update');
      }
      await _vaccineHistoryCollection
          .doc(vaccineHistory.id)
          .update(vaccineHistory.toJson());
    } catch (e) {
      throw Exception('Error updating vaccine history: $e');
    }
  }

  // Xóa vaccine history
  Future<void> deleteVaccineHistory(String id) async {
    try {
      await _vaccineHistoryCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Error deleting vaccine history: $e');
    }
  }

  // Thêm một liều tiêm (dose) vào vaccine history
  Future<void> addDoseToVaccineHistory(String historyId, Dose newDose) async {
    try {
      await _vaccineHistoryCollection.doc(historyId).update({
        'doses': FieldValue.arrayUnion([newDose.toJson()])
      });
    } catch (e) {
      throw Exception('Error adding dose to vaccine history: $e');
    }
  }

  // Sửa một liều tiêm (dose) trong vaccine history
  Future<void> updateDoseInVaccineHistory(
      String historyId, Dose oldDose, Dose updatedDose) async {
    try {
      // Lấy dữ liệu hiện tại
      final doc = await _vaccineHistoryCollection.doc(historyId).get();
      if (!doc.exists) {
        throw Exception('Vaccine history not found');
      }
      final vaccineHistory = VaccineHistoryModel.fromFirestore(doc);

      // Tạo danh sách doses mới với liều đã được cập nhật
      final updatedDoses = vaccineHistory.doses.map((dose) {
        return dose.dateAdministered == oldDose.dateAdministered &&
            dose.dose == oldDose.dose // So sánh để tìm liều cần sửa
            ? updatedDose
            : dose;
      }).toList();

      // Cập nhật lại toàn bộ doses
      await _vaccineHistoryCollection.doc(historyId).update({
        'doses': updatedDoses.map((dose) => dose.toJson()).toList(),
      });
    } catch (e) {
      throw Exception('Error updating dose in vaccine history: $e');
    }
  }

  // Xóa một liều tiêm (dose) trong vaccine history
  Future<void> deleteDoseFromVaccineHistory(String historyId, Dose doseToDelete) async {
    try {
      await _vaccineHistoryCollection.doc(historyId).update({
        'doses': FieldValue.arrayRemove([doseToDelete.toJson()])
      });
    } catch (e) {
      throw Exception('Error deleting dose from vaccine history: $e');
    }
  }
}