import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HoatDongSuKienController extends GetxController {
  // Selected day for the weekly date picker
  var selectedDay = DateTime.now().obs;

  // Dummy event data, replace with your actual data fetching logic
  var eventsForDay = <Event>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some dummy data
    eventsForDay.value = [
      Event(
        startTime : '6:30',
        endTime : '7:30',
        name: 'Đón trẻ - điểm danh ngày ',
        location: 'Phòng học A',
      ),
      Event(
        startTime : '7:30',
        endTime : '7:40',
        name: 'Tập thể dục buổi sáng',
        location: 'Sân chơi ngoài trời 1',
      ),
      Event(
        startTime : '7:40',
        endTime : '8:30',
        name: 'Ăn sáng ngày ',
        location: 'Căn teen trường khu A1',
      ),
      Event(
        startTime : '9:30',
        endTime : '10:30',
        name: 'Hoạt động tự do/ Giờ chơi tự do ',
        location: 'Khu A201',
      ),
    ];
  }

  // Function to fetch events for a specific day (you can replace with your own API call or logic)
  void fetchEventsForDay(DateTime day) {
    selectedDay.value = day;
    // For now, we simulate data fetching by assigning predefined events
    // Replace this with actual data fetching logic
    eventsForDay.value = [
      Event(
        startTime : '6:30',
        endTime : '7:30',
        name: 'Đón trẻ - điểm danh ngày ',
        location: 'Phòng học A',
      ),
      Event(
        startTime : '7:30',
        endTime : '7:40',
        name: 'Tập thể dục buổi sáng',
        location: 'Sân chơi ngoài trời 1',
      ),
      Event(
        startTime : '7:40',
        endTime : '8:30',
        name: 'Ăn sáng ngày ',
        location: 'Căn teen trường khu A1',
      ),
      Event(
        startTime : '9:30',
        endTime : '10:30',
        name: 'Hoạt động tự do/ Giờ chơi tự do ',
        location: 'Khu A201',
      ),
    ];
  }
}

// Event model to store event data
class Event {
  final String startTime;
  final String endTime;
  final String name;
  final String location;

  Event({required this.startTime , required this.endTime, required this.name, required this.location});
}
