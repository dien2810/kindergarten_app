class SemesterModel {
  String? id;
  final String semesterName;
  final String startDate;
  final String endDate;

  SemesterModel({
    this.id,
    required this.semesterName,
    required this.startDate,
    required this.endDate,
  });

  // Chuyển từ Map<String, dynamic> sang SemesterModel
  factory SemesterModel.fromMap(Map<String, dynamic> map) {
    return SemesterModel(
      semesterName: map['semesterName'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
    );
  }

  // Chuyển từ SemesterModel sang Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'semesterName': semesterName,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
