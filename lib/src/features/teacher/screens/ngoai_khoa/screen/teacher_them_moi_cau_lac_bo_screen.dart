import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import 'package:intl/intl.dart';
import '../../../../../repository/account_repository/account_repository.dart';
import '../../../../../repository/teacher_repository/teacher_repository.dart';
import '../../../../student/models/club/club_model.dart';
import '../../../../student/models/club/day_of_week.dart';
import '../../../controllers/ngoai_khoa/teacher_ngoai_khoa_controller.dart';
import '../../../../../constants/sizes.dart';

class TeacherThemMoiCauLacBoScreen extends StatefulWidget {
  const TeacherThemMoiCauLacBoScreen({super.key});

  @override
  _TeacherThemMoiCauLacBoScreenState createState() => _TeacherThemMoiCauLacBoScreenState();
}

class _TeacherThemMoiCauLacBoScreenState extends State<TeacherThemMoiCauLacBoScreen> {
  final TeacherNgoaiKhoaController clubController = Get.find<TeacherNgoaiKhoaController>();
  final TextEditingController _clubNameController = TextEditingController();
  final TextEditingController _tuitionController = TextEditingController();
  final TextEditingController _openingDayController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();
  final TextEditingController _openedRegistrationController = TextEditingController();
  final TextEditingController _closedRegistrationController = TextEditingController();
  final TextEditingController _aboutCourseController = TextEditingController();
  String? _selectedSemester;

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      setState(() {
        controller.text = formattedDate;
      });
    }
  }

  Future<String?> _showDayPicker(BuildContext context) async {
    final List<String> daysOfWeek = [
      'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy', 'Chủ Nhật'
    ];

    String? selectedDay;
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chọn ngày'),
          content: SingleChildScrollView(
            child: ListBody(
              children: daysOfWeek.map((day) {
                return ListTile(
                  title: Text(day),
                  onTap: () {
                    selectedDay = day;
                    Navigator.of(context).pop(day);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
    return selectedDay;
  }

  String _formatTimeTo24Hours(TimeOfDay time) {
    final int hour = time.hour;
    final int minute = time.minute;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }


  void _addSchedule() async {
    String? selectedDay = await _showDayPicker(context);
    TimeOfDay? startTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    TimeOfDay? endTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (selectedDay != null && startTime != null && endTime != null) {
      String formattedStartTime = _formatTimeTo24Hours(startTime);
      String formattedEndTime = _formatTimeTo24Hours(endTime);
      DayOfWeek newSchedule = DayOfWeek(startTime: formattedStartTime, endTime: formattedEndTime, id: '');

      setState(() {
        clubController.dayOfWeekMap[selectedDay] = newSchedule;
      });

      clubController.update();
      Get.snackbar("Thành công", "Thêm lịch biểu thành công!");
    } else {
      Get.snackbar("Lỗi", "Vui lòng chọn đầy đủ thông tin!");
    }
  }

  void _saveNewClub() async {

    final accountRepo = Get.put(AccountRepository());
    String username = accountRepo.userId;
    final teacherRepo = Get.put(TeacherRepository());
    String teacherID = await teacherRepo.getTeacherIDByTeacherID(username);
    // Lưu câu lạc bộ mới vào Firestore
    final newClub = ClubModel(
      aboutCourse: _aboutCourseController.text,
      capacity: int.tryParse(_capacityController.text) ?? 0,
      closedRegistration: _closedRegistrationController.text,
      clubName: _clubNameController.text,
      openedRegistration: _openedRegistrationController.text,
      openingDay: _openingDayController.text,
      room: _roomController.text,
      semesterID: _selectedSemester!,
      teacherID: teacherID,
      tuition: int.tryParse(_tuitionController.text) ?? 0,
      dayOfWeek: Map.from(clubController.dayOfWeekMap),
    );

    await clubController.addNewClub(newClub);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader2(title: tChiTietCauLacBo),
      body: Padding(
        padding: EdgeInsets.all(t15Size),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEditableRow("Tên câu lạc bộ:", _clubNameController),
              _buildEditableRow("Học phí:", _tuitionController, isNumber: true),
              _buildEditableDateRow("Mở đăng ký từ:", _openedRegistrationController),
              _buildEditableDateRow("Đóng đăng ký vào:", _closedRegistrationController),
              _buildEditableDateRow("Ngày khai giảng:", _openingDayController),
              _buildEditableRow("Phòng học:", _roomController),
              _buildSemesterDropdown(),
              SizedBox(height: t10Size),
              const Text("Mô tả khóa học:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF580B8B))),
              _buildTextField(_aboutCourseController, "Nhập mô tả khóa học"),
              const SizedBox(height: 10),
              const Text("Lịch học:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF580B8B))),
              ..._buildScheduleList(),
              const SizedBox(height: 10 ),
              ElevatedButton(
                onPressed: _addSchedule,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF380543),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("THÊM LỊCH BIỂU MỚI", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: t20Size),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF99D98C),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: _saveNewClub,
                    child: const Text("THÊM MỚI", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFA983),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text("HỦY", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: t10Size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableRow(String title, TextEditingController controller, {bool isNumber = false}) {
    return Container(
        decoration: BoxDecoration(
        color: const Color(0xFFF4E9F7),
    borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.all(8.0),
    margin: const EdgeInsets.symmetric(vertical: 5.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF580B8B),
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: const Color(0xFFF4E9F7),
            hintText: "Nhập $title",
            hintStyle: const TextStyle(fontSize: 16, color: Color(0xFF580B8B)),
          ),
          style: const TextStyle(fontSize: 16, color: Color(0xFF580B8B)),
          minLines: 1,
          maxLines: null,
        ),
      ],
    ),
    );
  }

  Widget _buildEditableDateRow(String title, TextEditingController controller) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF4E9F7),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF580B8B),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Chọn ngày",
                      hintStyle: TextStyle(color: Color(0xFF580B8B)),
                      filled: true,
                      fillColor: Color(0xFFF4E9F7),
                    ),
                    style: const TextStyle(fontSize: 16.0),
                    readOnly: true,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(controller),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterDropdown() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF4E9F7),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              "Học kỳ:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF580B8B),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return DropdownButton<String>(
                value: _selectedSemester,
                isExpanded: true,
                items: clubController.semesters.map((semester) {
                  return DropdownMenuItem<String>(
                    value: semester.id,
                    child: Text(
                      semester.semesterName,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedSemester = newValue;
                  });
                },
                hint: const Text(
                  "Chọn học kỳ",
                  style: TextStyle(fontSize: 14),
                ),
                underline: Container(),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF4E9F7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF580B8B)),
        ),
        style: const TextStyle(color: Color(0xFF580B8B), fontSize: 16.0),
      ),
    );
  }

  List<Widget> _buildScheduleList() {
    return clubController.dayOfWeekMap.entries.map((entry) {
      String day = entry.key;
      DayOfWeek schedule = entry.value;
      String vietnameseDay = clubController.convertDayToVietnamese(day);

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
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: vietnameseDay,
                    isExpanded: true,
                    items: clubController.getDaysOfWeek().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          clubController.dayOfWeekMap.remove(day);
                          clubController.dayOfWeekMap[newValue] = schedule;
                        });
                      }
                    },
                    hint: const Text("Chọn ngày"),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 10),
                const Text("Từ:", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  onPressed: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        schedule.startTime = _formatTimeTo24Hours(pickedTime);
                      });
                    }
                  },
                  child: Text(
                    schedule.startTime.isEmpty ? 'Chưa chọn' : schedule.startTime,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 10),
                const Text("Đến:"),
                const SizedBox(width: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  onPressed: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        schedule.endTime = _formatTimeTo24Hours(pickedTime);
                      });
                    }
                  },
                  child: Text(
                    schedule.endTime.isEmpty ? 'Chưa chọn' : schedule.endTime,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      clubController.dayOfWeekMap.remove(day);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();
  }
}
