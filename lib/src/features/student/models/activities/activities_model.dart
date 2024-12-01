import 'activities_dates.dart';

class ActivitiesModel {
  final String? id;
  final String classID;
  final String semester;
  final Map<String, ActivityDate> dates;

  ActivitiesModel({
    this.id,
    required this.classID,
    required this.semester,
    required this.dates,
  });

  factory ActivitiesModel.fromMap(Map<String, dynamic> map) {
    return ActivitiesModel(
      classID: map['classID'] as String,
      semester: map['semester'] as String,
      dates: map['dates'] != null
          ? (map['dates'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(
          key,
          ActivityDate.fromMap(value as Map<String, dynamic>),
        ),
      )
          : {},
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'classID': classID,
      'semester': semester,
      'dates': dates.map(
            (key, value) => MapEntry(key, value.toMap()),
      ),
    };
  }
}