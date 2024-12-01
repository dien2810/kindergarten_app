import 'absent_date_entry.dart';

class AbsentModel {
  final String? id;
  final int amountOfDayOff;
  final String semesterID;
  final Map<String, AbsentDateEntry> dates;

  AbsentModel({
    this.id,
    required this.amountOfDayOff,
    required this.semesterID,
    required this.dates,
  });

  // Tạo từ Map
  factory AbsentModel.fromMap(Map<String, dynamic> map) {
    print(map['dates']);
    return AbsentModel(
      amountOfDayOff: map['amountOfDayOff'] ?? 0,
      semesterID: map['semesterID'] ?? '',
      dates: (map['dates'] as Map<String, dynamic>? ?? {})
          .map((key, value) => MapEntry(key, AbsentDateEntry.fromMap(value))),
    );
  }

  // Chuyển về Map
  Map<String, dynamic> toMap() {
    return {
      'amountOfDayOff': amountOfDayOff,
      'semesterID': semesterID,
      'dates': dates.map((key, value) => MapEntry(key, value.toMap())),
    };
  }
}