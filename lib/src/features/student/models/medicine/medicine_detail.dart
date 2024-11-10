class MedicineDetail{
  String dosage;
  String name;
  String time;

  MedicineDetail({
    required this.dosage,
    required this.name,
    required this.time,
  });

  // Tạo MedicineDetail từ Map của Firestore
  factory MedicineDetail.fromMap(Map<String, dynamic> map) {
    return MedicineDetail(
      dosage: map['dosage'],
      name: map['name'],
      time: map['time'],
    );
  }

  // Chuyển MedicineDetail thành Map để lưu trữ trong Firestore
  Map<String, dynamic> toMap() {
    return {
      'dosage': dosage,
      'name': name,
      'time': time,
    };
  }
}