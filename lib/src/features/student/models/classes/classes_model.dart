class ClassesModel {
  final String? id;
  final String className;
  final List<String> students;
  final String teacherID;

  ClassesModel({
    this.id,
    required this.className,
    required this.students,
    required this.teacherID,
  });

  factory ClassesModel.fromMap(Map<String, dynamic> map) {
    return ClassesModel(
      className: map['className'],
      students: map['students'] is List
          ? List<String>.from(map['students'].map((e) => e.toString()))
          : [],
      teacherID: map['teacherID'],
    );
  }

  // Phương thức để chuyển từ StudentModel sang Map
  Map<String, dynamic> toMap() {
    return {
      'className': className,
      'students': students,
      'teacherID': teacherID,
    };
  }
}
