class AbsentDateEntry {
  final String absentStatus;
  final String absentTime;
  final String checkinImage;
  final String checkinTime;
  final String checkoutImage;
  final String checkoutTime;
  final List<dynamic> period; // String hoặc List<String>
  final String reason;

  AbsentDateEntry({
    required this.absentStatus,
    required this.absentTime,
    required this.checkinImage,
    required this.checkinTime,
    required this.checkoutImage,
    required this.checkoutTime,
    required this.period,
    required this.reason,
  });

  // Tạo từ Map
  factory AbsentDateEntry.fromMap(Map<String, dynamic> map) {
    return AbsentDateEntry(
      absentStatus: map['absentStatus'] ?? '',
      absentTime: map['absentTime'] ?? '',
      checkinImage: map['checkinImage'] ?? '',
      checkinTime: map['checkinTime'] ?? '',
      checkoutImage: map['checkoutImage'] ?? '',
      checkoutTime: map['checkoutTime'] ?? '',
      period: map['period'], // Có thể là String hoặc List<String>
      reason: map['reason'] ?? '',
    );
  }

  // Chuyển về Map
  Map<String, dynamic> toMap() {
    return {
      'absentStatus': absentStatus,
      'absentTime': absentTime,
      'checkinImage': checkinImage,
      'checkinTime': checkinTime,
      'checkoutImage': checkoutImage,
      'checkoutTime': checkoutTime,
      'period': period,
      'reason': reason,
    };
  }
}