import 'package:cloud_firestore/cloud_firestore.dart';

import 'dose.dart';

class VaccineHistoryModel {
  final String? id;
  final List<Dose> doses;
  final String vaccineID;

  VaccineHistoryModel({
    this.id,
    required this.doses,
    required this.vaccineID,
  });

  // Chuyển đổi dữ liệu từ Firestore DocumentSnapshot thành VaccineHistoryModel
  factory VaccineHistoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return VaccineHistoryModel(
      id: doc.id,
      doses: (data['doses'] as List<dynamic>?)
          ?.map((item) => Dose.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [],
      vaccineID: data['vaccineID'] ?? '',
    );
  }

  // Chuyển đổi VaccineHistoryModel thành một Map để lưu trữ trong Firestore
  Map<String, dynamic> toJson() {
    return {
      'doses': doses.map((dose) => dose.toJson()).toList(),
      'vaccineID': vaccineID,
    };
  }
}