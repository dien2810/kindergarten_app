import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../student/models/club/club_model.dart';
import '../../../../student/models/club/day_of_week.dart';
import '../../../controllers/ngoai_khoa/teacher_ngoai_khoa_controller.dart';

class TeacherChiTietCauLacBoScreen extends StatefulWidget {
  final String clubId;

  const TeacherChiTietCauLacBoScreen({super.key, required this.clubId});

  @override
  _TeacherChiTietCauLacBoScreenState createState() => _TeacherChiTietCauLacBoScreenState();
}

class _TeacherChiTietCauLacBoScreenState extends State<TeacherChiTietCauLacBoScreen> {
  late ClubModel club;
  late TeacherNgoaiKhoaController clubController;

  @override
  void initState() {
    super.initState();
    clubController = Get.find();
    club = clubController.clubs.firstWhere((club) => club.id == widget.clubId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(club.clubName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thông tin chi tiết câu lạc bộ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Tên câu lạc bộ: ${club.clubName}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Mô tả: ${club.aboutCourse}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Sức chứa: ${club.capacity} học sinh',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Ngày khai giảng: ${club.openingDay}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Địa điểm: ${club.room}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Học phí: ${club.tuition} VND',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Lịch học',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildScheduleList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildScheduleList() {
    return club.dayOfWeek.entries.map((entry) {
      String day = entry.key;
      DayOfWeek schedule = entry.value;

      return Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: const Color(0xFFD1ABEA),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Từ: ${schedule.startTime}',
                  style: const TextStyle(fontSize: 16),
                ),
                SizedBox(width: 16),
                Text(
                  'Đến: ${schedule.endTime}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();
  }
}
