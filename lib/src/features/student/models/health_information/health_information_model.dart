import 'package:cloud_firestore/cloud_firestore.dart';

class HealthInformationModel{
  final String? id;
  final int height;
  final int weight;
  final int pulse;
  final String bloodpressure;
  final int BMIIndex;
  final String physicalType;
  final String note;
  final String studentID;
  final String vaccineInformation;

  HealthInformationModel({
    this.id,
    required this.height,
    required this.weight,
    required this.pulse,
    required this.bloodpressure,
    required this.BMIIndex,
    required this.physicalType,
    required this.note,
    required this.studentID,
    required this.vaccineInformation,
  });

  // Chuyển đổi dữ liệu từ Firestore DocumentSnapshot thành Model
  factory HealthInformationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return HealthInformationModel(
      id: doc.id,
      height: data['height'],
      weight: data['weight'],
      pulse: data['pulse'],
      bloodpressure: data['bloodpressure'],
      BMIIndex: data['BMIIndex'],
      physicalType: data['physicalType'],
      note: data['note'],
      studentID: data['studentID'],
      vaccineInformation: data['vaccineInformation'],
    );
  }

  // Chuyển đổi Model thành một Map để lưu trữ trong Firestore
  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'pulse': pulse,
      'bloodpressure': bloodpressure,
      'BMIIndex': BMIIndex,
      'physicalType': physicalType,
      'note': note,
      'studentID': studentID,
    };
  }
}