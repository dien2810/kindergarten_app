import 'dayoff_entry_model.dart';

class DayoffModel{
  final String? id;
  final Map<String, DayoffEntry> dates;

  DayoffModel({
    this.id,
    required this.dates
  });

  // Chuyển từ Map sang DayoffModel
  factory DayoffModel.fromMap(Map<String, dynamic> map) {
    final datesMap = map['dates'] as Map<String, dynamic>? ?? {};
    final convertedDates = datesMap.map(
          (key, value) => MapEntry(key, DayoffEntry.fromMap(value)),
    );
    return DayoffModel(id: map['id'], dates: convertedDates);
  }

  // Chuyển từ DayoffModel sang Map
  Map<String, dynamic> toMap() {
    final datesMap = dates.map(
          (key, value) => MapEntry(key, value.toMap()),
    );

    return {'dates': datesMap};
  }
}