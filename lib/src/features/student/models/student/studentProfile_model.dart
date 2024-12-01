class StudentProfile {
  String studentID;
  late String name;
  late String gender;
  late String dateOfBirth;
  late String school;
  late String educationSystem;
  late String fatherFullname;
  late String fatherOccupation;
  late String motherFullname;
  late String motherOccupation;
  final String studentClass;
  late int gradeLevel;

  StudentProfile({
    required this.studentID,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.school,
    required this.educationSystem,
    required this.fatherFullname,
    required this.fatherOccupation,
    required this.motherFullname,
    required this.motherOccupation,
    required this.studentClass,
    required this.gradeLevel,
  });

  // Phương thức để chuyển từ Map sang StudentProfile
  factory StudentProfile.fromMap(Map<String, dynamic> map) {
    return StudentProfile(
      studentID: map['studentID'] ?? '',
      name: map['name'] ?? '',
      gender: map['gender'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      school: map['school'] ?? '',
      educationSystem: map['educationSystem'] ?? '',
      fatherFullname: map['fatherFullname'] ?? '',
      fatherOccupation: map['fatherOccupation'] ?? '',
      motherFullname: map['motherFullname'] ?? '',
      motherOccupation: map['motherOccupation'] ?? '',
      studentClass: map['class'] ?? '',
      gradeLevel: map['gradeLevel'] ?? 0,
    );
  }

  // Phương thức để chuyển từ StudentProfile sang Map
  Map<String, dynamic> toMap() {
    return {
      'studentID': studentID,
      'name': name,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'school': school,
      'educationSystem': educationSystem,
      'fatherFullname': fatherFullname,
      'fatherOccupation': fatherOccupation,
      'motherFullname': motherFullname,
      'motherOccupation': motherOccupation,
      'class': studentClass,
      'gradeLevel': gradeLevel,
    };
  }
}