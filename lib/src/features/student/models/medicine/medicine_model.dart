import 'package:cloud_firestore/cloud_firestore.dart';

import 'medicine_detail.dart';

class MedicineModel{
  final String? id;
  final List<String> dates;
  final List<MedicineDetail> medicineDetails;
  final String note;
  final String prescription;
  String status;
  final String studentID;

  MedicineModel({
    this.id,
    required this.dates,
    required this.medicineDetails,
    required this.note,
    required this.prescription,
    required this.status,
    required this.studentID,
  });

  // Chuyển đổi dữ liệu từ Firestore DocumentSnapshot thành MedicineModel
  factory MedicineModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MedicineModel(
      id: doc.id,
      dates: List<String>.from(data['dates']),
      medicineDetails: (data['medicineDetails'] as List<dynamic>)
          .map((item) => MedicineDetail.fromMap(item as Map<String, dynamic>))
          .toList(),
      note: data['note'],
      prescription: data['prescription'],
      status: data['status'],
      studentID: data['studentID'],
    );
  }

  // Chuyển đổi MedicineModel thành một Map để lưu trữ trong Firestore
  Map<String, dynamic> toJson() {
    return {
      'dates': dates,
      'medicineDetails': medicineDetails.map((detail) => detail.toMap()).toList(),
      'note': note,
      'prescription': prescription,
      'status': status,
      'studentID': studentID,
    };
  }
}