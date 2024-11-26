import 'package:kindergarten_app/src/features/student/models/student/studentDocument_model.dart';
import 'package:kindergarten_app/src/features/student/models/student/studentProfile_model.dart';

class StudentModel {
  final String? id;
  final StudentDocument studentDocument;
  final StudentProfile studentProfile;

  StudentModel({
    this.id,
    required this.studentDocument,
    required this.studentProfile,
  });

  // Phương thức để chuyển từ Map sang StudentModel
  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      studentDocument: StudentDocument.fromMap(map['studentDocument'] ?? {}),
      studentProfile: StudentProfile.fromMap(map['studentProfile'] ?? {}),
    );
  }

  // Phương thức để chuyển từ StudentModel sang Map
  Map<String, dynamic> toMap() {
    return {
      'studentDocument': studentDocument.toMap(),
      'studentProfile': studentProfile.toMap(),
    };
  }
}
