import 'package:get/get.dart';

class HoatDong {
  final String activityName;
  final String startTime;
  final String endTime;
  final String duration;
  final String typeOfActivity;
  final String location;
  final List<String> image;
  final String videoLive;

  HoatDong({
    required this.activityName,
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.typeOfActivity,
    required this.location,
    required this.image,
    required this.videoLive,
  });
}

class HoatDongController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var hoatDongList = <HoatDong>[].obs;
  var videoGiamSatLive = ''.obs;

  final activities = {
    "activities_class_id_1": {
      "semester": "semester_id_1",
      "classID": "class_id_1",
      "dates": {
        "23/09/2024": {
          "videoGiamSatLive": "urlVideoGiamSat",
          "events": [
            {
              "activityName": "Đón trẻ - điểm danh ngày 23/09/2024",
              "startTime": "6:45",
              "endTime": "7:30",
              "duration": "45 - 60 phút",
              "typeOfActivity": "type_id_sinhhoat1",
              "location": "A201",
              "image": ["linkanh1", "linkanh2"],
              "videoLive": "linkvideo/URL",
            },
            // Add more activities here
          ],
        },
        // Add more dates here
      },
    },
  };

  void loadHoatDongForDate(String date) {
    final dateData = (activities as Map<String, dynamic>)["activities_class_id_1"]?["dates"]?[date] as Map<String, dynamic>?;
    if (dateData != null) {
      videoGiamSatLive.value = dateData["videoGiamSatLive"];
      hoatDongList.value = (dateData["events"] as List<dynamic>)
          .map((event) => HoatDong(
        activityName: event["activityName"],
        startTime: event["startTime"],
        endTime: event["endTime"],
        duration: event["duration"],
        typeOfActivity: event["typeOfActivity"],
        location: event["location"],
        image: List<String>.from(event["image"]),
        videoLive: event["videoLive"],
      ))
          .toList();
    } else {
      videoGiamSatLive.value = '';
      hoatDongList.clear();
    }
  }
}
