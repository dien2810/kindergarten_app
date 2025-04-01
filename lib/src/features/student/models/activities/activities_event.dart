class ActivityEvent {
  final String activityName;
  final String duration;
  final String endTime;
  final List<String> image;
  final String location;
  final String startTime;
  final Map<String,dynamic> studentsNote;
  final String typeOfActivity;
  String videoLive;

  ActivityEvent({
    required this.activityName,
    required this.duration,
    required this.endTime,
    required this.image,
    required this.location,
    required this.startTime,
    required this.studentsNote,
    required this.typeOfActivity,
    required this.videoLive,
  });

  factory ActivityEvent.fromMap(Map<String, dynamic> map) {
    return ActivityEvent(
      activityName: map['activityName'] as String,
      duration: map['duration'] as String,
      endTime: map['endTime'] as String,
      image: map['image'] != null
          ? List<String>.from(map['image'] as List<dynamic>)
          : [],
      location: map['location'] as String,
      startTime: map['startTime'] as String,
      studentsNote: map['studentsNote'],
      typeOfActivity: map['typeOfActivity'] as String,
      videoLive: map['videoLive'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'activityName': activityName,
      'duration': duration,
      'endTime': endTime,
      'image': image,
      'location': location,
      'startTime': startTime,
      'studentsNote': studentsNote,
      'typeOfActivity': typeOfActivity,
      'videoLive': videoLive,
    };
  }
}