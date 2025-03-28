import 'package:cloud_firestore/cloud_firestore.dart';

class VaccineModel{
  final String? id;
  final String vaccineName;
  final String description;

  VaccineModel({
    this.id,
    required this.vaccineName,
    required this.description
  });

  // Chuyển đổi dữ liệu từ Firestore DocumentSnapshot thành MedicineModel
  factory VaccineModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return VaccineModel(
      id: doc.id,
      vaccineName: data['vaccineName'] ?? '',
      description: data['description'] ?? '',
    );
  }

  // Chuyển đổi MedicineModel thành một Map để lưu trữ trong Firestore
  Map<String, dynamic> toJson() {
    return {
      'vaccineName': vaccineName,
      'description': description
    };
  }
}