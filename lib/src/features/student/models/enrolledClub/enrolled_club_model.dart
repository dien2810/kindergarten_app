import 'package:get/get.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';

import 'enrolled.dart';

class EnrolledClubModel {
  String? id;
  final List<Enrolled> enrolled;

  EnrolledClubModel({this.id, required this.enrolled});

  // Tạo đối tượng từ Map (Firestore -> Object)
  factory EnrolledClubModel.fromMap(Map<String, dynamic> map) {
    return EnrolledClubModel(
      id: map['id'],
      enrolled: (map['enrolled'] as List<dynamic>)
          .map((e) => Enrolled.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // Chuyển đối tượng thành Map (Object -> Firestore)
  Map<String, dynamic> toMap() {
    return {
      'enrolled': enrolled.map((e) => e.toMap()).toList(),
    };
  }
}