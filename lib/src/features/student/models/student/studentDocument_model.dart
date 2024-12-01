class StudentDocument {
  late String birthCertificate;
  late String householdRegistration;
  late String image;

  StudentDocument({
    required this.birthCertificate,
    required this.householdRegistration,
    required this.image,
  });

  // Phương thức để chuyển từ Map sang StudentDocument
  factory StudentDocument.fromMap(Map<String, dynamic> map) {
    return StudentDocument(
      birthCertificate: map['birthCertificate'] ?? '',
      householdRegistration: map['householdRegistration'] ?? '',
      image: map['image'] ?? '',
    );
  }

  // Phương thức để chuyển từ StudentDocument sang Map
  Map<String, dynamic> toMap() {
    return {
      'birthCertificate': birthCertificate,
      'householdRegistration': householdRegistration,
      'image': image,
    };
  }
}