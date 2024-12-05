class DayOfWeek {
  final String? id;
    String startTime;
    String endTime;

  DayOfWeek({
    this.id,
    required this.startTime,
    required this.endTime,
  });

  // Tạo đối tượng từ Map (Firestore -> Object)
  factory DayOfWeek.fromMap(Map<String, dynamic> map) {
    return DayOfWeek(
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
    );
  }

  // Chuyển đối tượng thành Map (Object -> Firestore)
  Map<String, dynamic> toMap() {
    return {
      'startTime': startTime,
      'endTime': endTime,
    };
  }

}