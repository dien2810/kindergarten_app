class AbsentDateEntry {
  late String? day;
  String absentStatus;
  String absentTime;
  String checkinImage;
  String checkinTime;
  String checkoutImage;
  String checkoutTime;
  List<dynamic> period; // String hoặc List<String>
  String reason;

  AbsentDateEntry({
    this.day,
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
  @override
  String toString() {
    return 'AbsentDateEntry(period: $period, absentTime: $absentTime, absentStatus: $absentStatus, checkinImage: $checkinImage, checkoutImage: $checkoutImage, checkinTime: $checkinTime, checkoutTime: $checkoutTime, reason: $reason)';
  }
}