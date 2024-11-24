class RoutineEntryModel {
  final String? id;
  final String duration;
  final String endTime;
  final String eventName;
  final String location;
  final String note;
  final String startTime;
  final String teacherID;

  RoutineEntryModel({
    this.id,
    required this.duration, required this.endTime, required this.eventName, required this.location, required this.note, required this.startTime, required this.teacherID
  });

  // Tạo từ Map (Firestore)
  factory RoutineEntryModel.fromMap(Map<String, dynamic> map) {
    return RoutineEntryModel(
      duration: map['duration'] ?? '',
      endTime: map['endTime'] ?? '',
      eventName: map['eventName'] ?? '',
      location: map['location'] ?? '',
      note: map['note'] ?? '',
      startTime: map['startTime'] ?? '',
      teacherID: map['teacherID'] ?? '',
    );
  }

  // Chuyển về Map (lưu vào Firestore)
  Map<String, dynamic> toMap() {
    return {
      'duration': duration,
      'endTime': endTime,
      'eventName': eventName,
      'location': location,
      'note': note,
      'startTime': startTime,
      'teacherID': teacherID,
    };
  }
}
