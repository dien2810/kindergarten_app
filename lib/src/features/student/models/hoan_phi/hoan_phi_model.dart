import 'package:cloud_firestore/cloud_firestore.dart';

class ThoiHocHoanPhiModel{
  final String? id;
  final String transferSchoolName;
  final String date;
  final String formType;
  final String guardianID;
  final String reason;
  String status;
  final String studentID;

  ThoiHocHoanPhiModel({
    this.id,
    required this.transferSchoolName,
    required this.date,
    required this.formType,
    required this.guardianID,
    required this.reason,
    required this.status,
    required this.studentID,
  });

  // Chuyển đổi dữ liệu từ Firestore DocumentSnapshot thành MedicineModel
  factory ThoiHocHoanPhiModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ThoiHocHoanPhiModel(
      id: doc.id,
      transferSchoolName: data['TransferschoolName'],
      // medicineDetails: (data['medicineDetails'] as List<dynamic>)
      //     .map((item) => MedicineDetail.fromMap(item as Map<String, dynamic>))
      //     .toList(),
      date: data['date'],
      formType: data['formType'],
      guardianID: data['guardianID'],
      reason: data['reason'],
      status: data['status'],
      studentID: data['studentID'],

    );
  }

  // Chuyển đổi MedicineModel thành một Map để lưu trữ trong Firestore
  Map<String, dynamic> toJson() {
    return {
      'TransferschoolName': transferSchoolName,
      'date': date,
      //'medicineDetails': medicineDetails.map((detail) => detail.toMap()).toList(),
      'formType': formType,
      'guardianID': guardianID,
      'reason': reason,
      'status': status,
      'studentID': studentID,
    };
  }
}