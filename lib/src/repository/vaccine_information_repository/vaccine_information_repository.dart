import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/student/models/vaccine/vaccine_information_model.dart';

class VaccineInformationRepository {
  final CollectionReference _vaccineInfoCollection =
  FirebaseFirestore.instance.collection('vaccinationInformation');

  // Thêm một vaccine information mới
  Future<void> addVaccineInformation(VaccineInformationModel vaccineInfo) async {
    try {
      await _vaccineInfoCollection.add(vaccineInfo.toJson());
    } catch (e) {
      throw Exception('Error adding vaccine information: $e');
    }
  }

  // Lấy tất cả vaccine information
  Future<List<VaccineInformationModel>> getAllVaccineInformation() async {
    try {
      QuerySnapshot snapshot = await _vaccineInfoCollection.get();
      return snapshot.docs
          .map((doc) => VaccineInformationModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Error fetching vaccine information: $e');
    }
  }

  // Lấy vaccine information theo ID
  Future<VaccineInformationModel?> getVaccineInformationById(String id) async {
    try {
      DocumentSnapshot doc = await _vaccineInfoCollection.doc(id).get();
      if (doc.exists) {
        return VaccineInformationModel.fromFirestore(doc);
      }
      return null;
    } catch (e) {
      throw Exception('Error fetching vaccine information: $e');
    }
  }

  // Lấy một VaccineInformation theo studentID (trả về bản ghi đầu tiên nếu có)
  Future<VaccineInformationModel> getVaccineInformationByStudentID(String studentID) async {
    try {
      QuerySnapshot snapshot = await _vaccineInfoCollection
          .where('studentID', isEqualTo: studentID)
          .limit(1) // Giới hạn chỉ lấy 1 bản ghi
          .get();
      return VaccineInformationModel.fromFirestore(snapshot.docs.first);
    } catch (e) {
      throw Exception('Error fetching vaccine information: $e');
    }
  }

  // Cập nhật vaccine information
  Future<void> updateVaccineInformation(VaccineInformationModel vaccineInfo) async {
    try {
      if (vaccineInfo.id == null) {
        throw Exception('Vaccine Information ID is required for update');
      }
      await _vaccineInfoCollection.doc(vaccineInfo.id).update(vaccineInfo.toJson());
    } catch (e) {
      throw Exception('Error updating vaccine information: $e');
    }
  }

  // Xóa vaccine information
  Future<void> deleteVaccineInformation(String id) async {
    try {
      await _vaccineInfoCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Error deleting vaccine information: $e');
    }
  }
}