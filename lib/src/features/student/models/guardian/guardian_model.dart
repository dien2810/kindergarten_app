import 'package:cloud_firestore/cloud_firestore.dart';

class GuardianModel {
  final String? id;
  String address;
  String dateOfBirth;
  String email;
  bool emergencyContact;
  String ethnic;
  String gender;
  String guardianFullname;
  String occupation;
  String phoneNumber;
  String religion;
  String studentID;
  String urlAvatar;

  // Constructor
  GuardianModel({
    this.id,
    required this.address,
    required this.dateOfBirth,
    required this.email,
    required this.emergencyContact,
    required this.ethnic,
    required this.gender,
    required this.guardianFullname,
    required this.occupation,
    required this.phoneNumber,
    required this.religion,
    required this.studentID,
    required this.urlAvatar,
  });

  // Factory method to create an instance from a Firestore document map
  factory GuardianModel.fromMap(Map<String, dynamic> map) {
    return GuardianModel(
      address: map['address'],
      dateOfBirth: map['dateOfBirth'],
      email: map['email'],
      emergencyContact: map['emergencyContact'] ?? false,
      ethnic: map['ethnic'],
      gender: map['gender'],
      guardianFullname: map['guardianFullname'],
      occupation: map['occupation'],
      phoneNumber: map['phoneNumber'],
      religion: map['religion'],
      studentID: map['studentID'],
      urlAvatar: map['urlAvatar'],
    );
  }

  // Method to convert the instance into a Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'dateOfBirth': dateOfBirth,
      'email': email,
      'emergencyContact': emergencyContact,
      'ethnic': ethnic,
      'gender': gender,
      'guardianFullname': guardianFullname,
      'occupation': occupation,
      'phoneNumber': phoneNumber,
      'religion': religion,
      'studentID': studentID,
      'urlAvatar': urlAvatar,
    };
  }

  factory GuardianModel.fromSnapShot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    return GuardianModel(
      id: document.id,
      address: data["address"],
      dateOfBirth: data["dateOfBirth"],
      email: data["email"],
      emergencyContact: data["emergencyContact"],
      ethnic: data["ethnic"],
      gender: data["gender"],
      guardianFullname: data["guardianFullname"],
      occupation: data["occupation"],
      phoneNumber: data["phoneNumber"],
      religion: data["religion"],
      studentID: data["studentID"],
      urlAvatar: data["urlAvatar"],
    );
  }
}
