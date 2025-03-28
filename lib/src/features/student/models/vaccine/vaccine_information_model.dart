import 'package:cloud_firestore/cloud_firestore.dart';

class VaccineInformationModel {
  final String? id;
  final String studentID;
  final List<String> vaccineHistory;

  VaccineInformationModel({
    this.id,
    required this.studentID,
    required this.vaccineHistory,
  });

  // Chuyển đổi dữ liệu từ Firestore DocumentSnapshot thành VaccineInformationModel
  factory VaccineInformationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return VaccineInformationModel(
      id: doc.id,
      studentID: data['studentID'] ?? '',
      vaccineHistory: List<String>.from(data['vaccineHistory'] ?? []),
    );
  }

  // Chuyển đổi VaccineInformationModel thành một Map để lưu trữ trong Firestore
  Map<String, dynamic> toJson() {
    return {
      'studentID': studentID,
      'vaccineHistory': vaccineHistory,
    };
  }
}