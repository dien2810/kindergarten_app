import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherModel {
  late final String? id;
  final String avatar;
  final String dateOfBirth;
  final String firstName;
  final String gender;
  final String lastName;
  final String phone;
  final String teacherID;

  TeacherModel({
    this.id,
    required this.avatar,
    required this.dateOfBirth,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.phone,
    required this.teacherID,
  });

  // Tạo đối tượng từ Map (dùng khi lấy dữ liệu từ Firestore)
  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      avatar: map['avatar'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      firstName: map['firstName'] as String,
      gender: map['gender'] as String,
      lastName: map['lastName'] as String,
      phone: map['phone'] as String,
      teacherID: map['teacherID'] as String,
    );
  }

  // Chuyển đối tượng thành Map (dùng khi lưu dữ liệu vào Firestore)
  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'dateOfBirth': dateOfBirth,
      'firstName': firstName,
      'gender': gender,
      'lastName': lastName,
      'phone': phone,
      'teacherID': teacherID,
    };
  }
  factory TeacherModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return TeacherModel(
      id: doc.id,
      avatar: data['avatar'],
      dateOfBirth: data['dateOfBirth'],
      firstName: data['firstName'],
      gender: data['gender'],
      lastName: data['lastName'],
      phone: data['phone'],
      teacherID: data['teacherID'],
    );
  }

}
