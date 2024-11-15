import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalRecordModel{
  final String? id;
  final String dentalConditions;
  final String doctorAdvice;
  final String doctorDiagnosis;
  final String earConditions;
  final String eyeConditions;
  final int leftEye;
  final int leftEyeWithoutGlass;
  final String otherIllness;
  final int rightEye;
  final int rightEyeWithoutGlass;
  final String studentID;

  MedicalRecordModel({
    this.id,
    required this.dentalConditions,
    required this.doctorAdvice,
    required this.doctorDiagnosis,
    required this.earConditions,
    required this.eyeConditions,
    required this.leftEye,
    required this.leftEyeWithoutGlass,
    required this.otherIllness,
    required this.rightEye,
    required this.rightEyeWithoutGlass,
    required this.studentID,
  });

  // Chuyển đổi dữ liệu từ Firestore DocumentSnapshot thành MedicalRecordModel
  factory MedicalRecordModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MedicalRecordModel(
      id: doc.id,
      dentalConditions: data['dentalConditions'],
      // medicineDetails: (data['medicineDetails'] as List<dynamic>)
      //     .map((item) => MedicineDetail.fromMap(item as Map<String, dynamic>))
      //     .toList(),
      doctorAdvice: data['doctorAdvice'],
      doctorDiagnosis: data['doctorDiagnosis'],
      earConditions: data['earConditions'],
      eyeConditions: data['eyeConditions'],
      leftEye: data['leftEye'],
      leftEyeWithoutGlass: data['leftEyeWithoutGlass'],
      otherIllness: data['otherIllness'],
      rightEye: data['rightEye'],
      rightEyeWithoutGlass: data['rightEyeWithoutGlass'],
      studentID: data['studentID'],
    );
  }

  // Chuyển đổi MedicalRecordModel thành một Map để lưu trữ trong Firestore
  Map<String, dynamic> toJson() {
    return {
      'dentalConditions': dentalConditions,
      //'medicineDetails': medicineDetails.map((detail) => detail.toMap()).toList(),
      'doctorAdvice': doctorAdvice,
      'doctorDiagnosis': doctorDiagnosis,
      'earConditions': earConditions,
      'eyeConditions': eyeConditions,
      'leftEye': leftEye,
      'leftEyeWithoutGlass': leftEyeWithoutGlass,
      'otherIllness': otherIllness,
      'rightEye': rightEye,
      'rightEyeWithoutGlass': rightEyeWithoutGlass,
      'studentID': studentID,
    };
  }
}