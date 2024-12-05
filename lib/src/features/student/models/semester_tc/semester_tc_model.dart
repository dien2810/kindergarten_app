import 'package:cloud_firestore/cloud_firestore.dart';

class SemesterTcModel {
  final String? id;
  final String semesterName;
  final String startDate;
  final String endDate;

  SemesterTcModel({
    this.id,
    required this.semesterName,
    required this.startDate,
    required this.endDate,
  });

  factory SemesterTcModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return SemesterTcModel(
      id: doc.id,
      semesterName: data['semesterName'] as String,
      startDate: data['startDate'] as String,
      endDate: data['endDate'] as String,
    );
  }

  factory SemesterTcModel.fromMap(Map<String, dynamic> map) {
    return SemesterTcModel(
      semesterName: map['semesterName'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'semesterName': semesterName,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

}
