import 'dart:convert';

class StudentFace {
  String? id;
  String studentID;
  List modelData;

  StudentFace({
    required this.studentID,
    required this.modelData,
  });

  static StudentFace fromMap(Map<String, dynamic> user) {
    return StudentFace(
      studentID: user['studentID'],
      modelData: jsonDecode(user['modelData']),
    );
  }

  toMap() {
    return {
      'studentID': studentID,
      'modelData': jsonEncode(modelData),
    };
  }
}