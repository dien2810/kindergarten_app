import 'package:cloud_firestore/cloud_firestore.dart';

class HealthHistoryModel{
  final String? id;
  final bool asthma;
  final bool cardiovascular;
  final bool diabetes;
  final bool familyHistoryIllness;
  final bool tuberculosis;
  final String infectious;
  final String note;
  final String studentID;

  HealthHistoryModel({
    this.id,
    required this.asthma,
    required this.cardiovascular,
    required this.diabetes,
    required this.familyHistoryIllness,
    required this.tuberculosis,
    required this.infectious,
    required this.note,
    required this.studentID,
});

  // Chuyển đổi dữ liệu từ Firestore DocumentSnapshot thành MedicineModel
  factory HealthHistoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return HealthHistoryModel(
      id: doc.id,
      asthma: data['asthma'],
      cardiovascular: data['cardiovascular'],
      diabetes: data['diabetes'],
      familyHistoryIllness: data['familyHistoryIllness'],
      tuberculosis: data['tuberculosis'],
      infectious: data['infectious'],
      note: data['note'],
      studentID: data['studentID'],
    );
  }

  // Chuyển đổi MedicineModel thành một Map để lưu trữ trong Firestore
  Map<String, dynamic> toJson() {
    return {
      'asthma': asthma,
      'cardiovascular': cardiovascular,
      'diabetes': diabetes,
      'familyHistoryIllness': familyHistoryIllness,
      'tuberculosis': tuberculosis,
      'infectious': infectious,
      'note': note,
      'studentID': studentID,
    };
  }
}