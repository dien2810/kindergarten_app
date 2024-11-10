import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineModel{
  final String? id;
  final String createDate;
  final String note;
  final String prescription;
  final String receivedPerson;
  final String sentGuardian;
  String status;
  final String studentID;

  MedicineModel({
    this.id,
    required this.createDate,
    required this.note,
    required this.prescription,
    required this.receivedPerson,
    required this.sentGuardian,
    required this.status,
    required this.studentID,
  });

  // Chuyển đổi dữ liệu từ Firestore DocumentSnapshot thành MedicineModel
  factory MedicineModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MedicineModel(
      id: doc.id,
      createDate: data['createDate'],
      // medicineDetails: (data['medicineDetails'] as List<dynamic>)
      //     .map((item) => MedicineDetail.fromMap(item as Map<String, dynamic>))
      //     .toList(),
      note: data['note'],
      prescription: data['prescription'],
      receivedPerson: data['receivedPerson'],
      sentGuardian: data['sentGuardian'],
      status: data['status'],
      studentID: data['studentID'],

    );
  }

  // Chuyển đổi MedicineModel thành một Map để lưu trữ trong Firestore
  Map<String, dynamic> toJson() {
    return {
      'dates': createDate,
      //'medicineDetails': medicineDetails.map((detail) => detail.toMap()).toList(),
      'note': note,
      'prescription': prescription,
      'receivedPerson': receivedPerson,
      'sentGuardian': sentGuardian,
      'status': status,
      'studentID': studentID,
    };
  }
}