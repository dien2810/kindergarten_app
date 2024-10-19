import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/login_screen/login_screen.dart';

class AccountModel {
  final String? id;
  final String fullname;
  final String username;
  final String phoneNo;
  final String password;
  final Role role;

  const AccountModel({
    this.id,
    required this.fullname,
    required this.username,
    required this.phoneNo,
    required this.password,
    required this.role
  });
  toJson(){
    return {
      "fullName": fullname,
      "username": username,
      "phoneNumber": phoneNo,
      "password": password,
      "role": role.name.toString()
    };
  }
  //Step 1: Map user fetched from Firebase to UserModel
  factory AccountModel.fromSnapShot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    Role roleType = Role.guardian;
    if (data['role'] == 'guardian'){
      roleType = Role.guardian;
    }
    else {
      if (data['role'] == 'teacher') {
        roleType = Role.teacher;
      }
    }
    return AccountModel(
        id: document.id,
        username: data["username"],
        fullname: data['fullName'],
        phoneNo: data['phoneNumber'],
        password: data['password'],
        role: roleType
    );
  }
}