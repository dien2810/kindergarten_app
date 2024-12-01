import 'activities_event.dart';

class ActivityDate {
  final List<ActivityEvent> events;
  final String videoGiamSatLive;

  ActivityDate({
    required this.events,
    required this.videoGiamSatLive,
  });

  factory ActivityDate.fromMap(Map<String, dynamic> map) {
    return ActivityDate(
      events: map['events'] != null
          ? (map['events'] as List<dynamic>)
          .map((e) => ActivityEvent.fromMap(e as Map<String, dynamic>))
          .toList()
          : [],
      videoGiamSatLive: map['videoGiamSatLive'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'events': events.map((e) => e.toMap()).toList(),
      'videoGiamSatLive': videoGiamSatLive,
    };
  }
}
