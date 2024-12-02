class Enrolled {
  final String? id;
  final String clubID;
  final String enrollDate;
  final String enrollStatus;
  final String paymentStatus;

  Enrolled({
    this.id,
    required this.clubID,
    required this.enrollDate,
    required this.enrollStatus,
    required this.paymentStatus,
  });

  // Tạo đối tượng từ Map (Firestore -> Object)
  factory Enrolled.fromMap(Map<String, dynamic> map) {
    return Enrolled(
      clubID: map['clubID'] as String,
      enrollDate: map['enrollDate'] as String,
      enrollStatus: map['enrollStatus'] as String,
      paymentStatus: map['paymentStatus'] as String,
    );
  }

  // Chuyển đối tượng thành Map (Object -> Firestore)
  Map<String, dynamic> toMap() {
    return {
      'clubID': clubID,
      'enrollDate': enrollDate,
      'enrollStatus': enrollStatus,
      'paymentStatus': paymentStatus,
    };
  }
}