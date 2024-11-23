import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HoatDongSuKienController extends GetxController {
  var selectedDay = DateTime.now().obs;
  var eventsForDay = <Event>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEventsForDay(DateTime.now());
  }

  // Lấy danh sách sự kiện cho ngày cụ thể
  void fetchEventsForDay(DateTime day) {
    selectedDay.value = day;
    String linkanh_sample = "https://img.tripi.vn/cdn-cgi/image/width=700,height=700/https://gcs.tripi.vn/public-tripi/tripi-feed/img/474072bni/hinh-anh-cau-be-trai-chong-ma-deo-kinh_111532314.jpg";
    String linkanh_sample2 = "https://cafefcdn.com/203337114487263232/2021/7/1/photo-1-16251087490231855343072.png";
    String linkanh_using_cloudinary =  "https://res.cloudinary.com/demo/image/upload/e_replace_color:gold:17/mypic.jpg";
    String link_videoLive_sample_youtube = "https://www.youtube.com/watch?v=ALcL3MuU4xQ";
    String link_videoLive_sample_notYoutube = "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

    // Dummy data: thay thế bằng logic fetch từ Firebase
    var sampleData = {
      "events": [
        {
          "activityName": "Đón trẻ - điểm danh ngày 23/09/2024",
          "startTime": "6:45",
          "endTime": "7:30",
          "duration": "45 - 60 phút",
          "typeOfActivity": "type_id_sinhhoat1",
          "location": "A201",
          "image": [linkanh_sample, linkanh_sample2, linkanh_using_cloudinary],
          "videoLive": link_videoLive_sample_youtube,
          "studentsNote": {}
        },
        {
          "activityName": "Tập thể dục buổi sáng ngày 23/09/2024",
          "startTime": "7:30",
          "endTime": "7:40",
          "duration": "10 phút",
          "typeOfActivity": "type_id_sinhhoat2",
          "location": "Sân trường khu 1",
          "image": [linkanh_sample2, linkanh_sample, linkanh_sample, linkanh_sample],
          "videoLive": link_videoLive_sample_notYoutube,
          "studentsNote": {}
        },{
          "activityName": "Ăn sáng ngày 23/09/2024",
          "startTime": "7:40",
          "endTime": "8:30",
          "duration": "50 phút",
          "typeOfActivity": "type_id_sinhhoat3",
          "location": "Căn teen trường khu A1",
          "image": [linkanh_sample, linkanh_sample, linkanh_sample],
          "videoLive": link_videoLive_sample_notYoutube,
          "studentsNote": {
          }
        },
        {
          "activityName": "Luyện tập chào hỏi / giao tiếp cơ bản cho bé ",
          "startTime": "8:30",
          "endTime": "8:40",
          "duration": "10 phút",
          "typeOfActivity": "type_id_1",
          "location": "A201",
          "image": [linkanh_sample, linkanh_sample],
          "videoLive": link_videoLive_sample_notYoutube,
          "studentsNote": {}
        },
      ]
    };

    // Map dữ liệu JSON sang danh sách Event và bổ sung typeOfActivityName
    eventsForDay.value = (sampleData['events'] as List).map((eventData) {
      String typeOfActivityName = getTypeOfActivityName(eventData['typeOfActivity']);
      return Event.fromJson({...eventData, 'typeOfActivityName': typeOfActivityName});
    }).toList();
  }

  // Lấy chi tiết sự kiện theo chỉ số
  Event? getEventDetails(int index) {
    if (index >= 0 && index < eventsForDay.length) {
      return eventsForDay[index];
    }
    return null;
  }

  // xử lý lấy loại hoạt động trỏ vào cái chế độ sinh hoạt trong typeOfActivity :
  final Map<String, Map<String, dynamic>> typeOfActivities = {
    "type_id_sinhhoat1": {
      "typeName": "Đón trẻ - điểm danh đầu giờ ",
      "isClub": false,
      "fee": 0,
      "description": "Đón trẻ và điểm danh đầu giờ giúp giáo viên kiểm soát số lượng trẻ có mặt, đảm bảo an toàn, và theo dõi tình hình sức khỏe, tinh thần của trẻ ngay từ đầu ngày."
    },
    "type_id_sinhhoat2": {
      "typeName": "Thể dục buổi sáng",
      "isClub": false,
      "fee": 0,
      "description": "Thể dục buổi sáng rất tốt cho trẻ, giúp cải thiện sức khỏe, tăng cường sự linh hoạt, phát triển cơ bắp, và tăng cường hệ miễn dịch."
    },
    "type_id_sinhhoat3": {
      "typeName": "Ăn sáng",
      "isClub": false,
      "fee": 600000,
      "description": "Trẻ có một bữa sáng nhẹ vào 9h sáng trên trường để đảm bảo năng lượng trong ngày"
    },
    "type_id_sinhhoat4": {
      "typeName": "Hoạt động tự do/ Chơi",
      "isClub": false,
      "fee": 0,
      "description": "hoạt động tự do bao gồm giám sát trẻ chơi tự do trong lớp học, đảm bảo trẻ chơi an toàn trong khu vực"
    },
    "type_id_sinhhoat5": {
      "typeName": "Ăn trưa",
      "isClub": false,
      "fee": 700000,
      "description": "Thời gian ăn trưa giúp trẻ bổ sung năng lượng, phục hồi sức khỏe sau buổi sáng học tập và chơi. "
    },
    "type_id_sinhhoat6": {
      "typeName": "Ngủ trưa",
      "isClub": false,
      "fee": 0,
      "description": "Ngủ trưa giúp trẻ phục hồi sức lực, cải thiện tâm trạng và tăng khả năng tập trung cho các hoạt động buổi chiều. Đây cũng là thời gian quan trọng để trẻ phát triển thể chất và tinh thần"
    },
    "type_id_sinhhoat7": {
      "typeName": "Ăn xế",
      "isClub": false,
      "fee": 300000,
      "description": "Bữa ăn xế giúp trẻ bổ sung năng lượng sau giờ học và vui chơi, giúp trẻ duy trì sự tỉnh táo và tập trung cho các hoạt động tiếp theo"
    },
    "type_id_sinhhoat8": {
      "typeName": "Điểm danh - Trả bé ",
      "isClub": false,
      "fee": 0,
      "description": "Điểm danh và trả bé cho phụ huynh giúp đảm bảo an toàn cho trẻ, xác nhận số lượng trẻ có mặt và tạo sự kết nối giữa giáo viên và phụ huynh."
    }
  };
  String getTypeOfActivityName(String typeId) {
    if (typeOfActivities.containsKey(typeId)) {
      return typeOfActivities[typeId]?['typeName'] ?? 'Chưa xác định';
    }
    return 'Chưa xác định';
  }
}

class Event {
  final String startTime;
  final String endTime;
  final String name;
  final String location;
  final String duration;
  final String typeOfActivity;
  final List<String> images;
  final String videoLive;
  final Map<String, dynamic> studentsNote;
  String? typeOfActivityName;
  Event({
    required this.startTime,
    required this.endTime,
    required this.name,
    required this.location,
    required this.duration,
    required this.typeOfActivity,
    required this.images,
    required this.videoLive,
    required this.studentsNote,
    this.typeOfActivityName,
  });

  // Tạo phương thức từ JSON để dễ dàng ánh xạ dữ liệu từ Firebase
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      name: json['activityName'] as String,
      location: json['location'] as String,
      duration: json['duration'] as String,
      typeOfActivity: json['typeOfActivity'] as String,
      images: List<String>.from(json['image'] as List<dynamic>),
      videoLive: json['videoLive'] as String,
      studentsNote: Map<String, dynamic>.from(json['studentsNote'] ?? {}),
      typeOfActivityName: json['typeOfActivityName'] as String?,
    );
  }


}
