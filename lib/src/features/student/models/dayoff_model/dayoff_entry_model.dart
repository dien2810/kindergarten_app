class DayoffEntry {
  final String? day;
  final String content;
  final List<String> period;
  final String status;

  DayoffEntry({
    this.day,
    required this.content,
    required this.period,
    required this.status,
  });

  // Chuyển từ Map sang DayoffEntry
  factory DayoffEntry.fromMap(Map<String, dynamic> map) {
    return DayoffEntry(
      content: map['content'] ?? '',
      period: List<String>.from(map['period'] ?? []),
      status: map['status'] ?? '',
    );
  }

  // Chuyển từ DayoffEntry sang Map
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'period': period,
      'status': status,
    };
  }
}
