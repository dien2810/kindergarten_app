import 'absent_date_entry.dart';

class AbsentModel {
  late String? id;
  late final int amountOfDayOff;
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
    return AbsentModel(
      amountOfDayOff: map['amountOfDayOff'] ?? 0,
      semesterID: map['semesterID'] ?? '',
      dates: (map['dates'] as Map<String, dynamic>? ?? {})
          .map((key, value) => MapEntry(key, AbsentDateEntry.fromMap(value)..day=key)),
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
  @override
  String toString() {
    return 'AbsentModel(id: $id, semesterID: $semesterID, amountOfDayOff: $amountOfDayOff, dates: ${dates.map((key, value) => MapEntry(key, value.toString()))})';
  }
}