import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/common_widgets/app_bar_widgets/teacher_app_bar_with_title_header_2.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';
import '../../../controllers/ngoai_khoa/teacher_ngoai_khoa_controller.dart';
import '../../../../../constants/sizes.dart';
import 'package:intl/intl.dart';


class TeacherChiTietCauLacBoScreen extends StatefulWidget {
  final String clubId;

  const TeacherChiTietCauLacBoScreen({super.key, required this.clubId});

  @override
  _TeacherChiTietCauLacBoScreenState createState() => _TeacherChiTietCauLacBoScreenState();
}

class _TeacherChiTietCauLacBoScreenState extends State<TeacherChiTietCauLacBoScreen> {
  late ClubModel club;
  late TeacherNgoaiKhoaController clubController;

  late TextEditingController _clubNameController;
  late TextEditingController _tuitionController;
  late TextEditingController _openingDayController;
  late TextEditingController _capacityController;
  late TextEditingController _roomController;
  late TextEditingController _openedRegistrationController;
  late TextEditingController _closedRegistrationController;
  late TextEditingController _aboutCourseController;

  String? _selectedSemester;

  @override
  void initState() {
    super.initState();
    clubController = Get.find();

    club = clubController.clubs.firstWhere((club) => club.clubId == widget.clubId);

    _clubNameController = TextEditingController(text: club.clubName);
    _tuitionController = TextEditingController(text: club.tuition.toString());
    _openingDayController = TextEditingController(text: club.openingDay);
    _capacityController = TextEditingController(text: club.capacity.toString());
    _roomController = TextEditingController(text: club.room);
    _openedRegistrationController = TextEditingController(text: club.openedRegistration);
    _closedRegistrationController = TextEditingController(text: club.closedRegistration);
    _aboutCourseController = TextEditingController(text: club.aboutCourse);
    _selectedSemester = club.semesterID;
  }

  @override
  void dispose() {
    _clubNameController.dispose();
    _tuitionController.dispose();
    _openingDayController.dispose();
    _capacityController.dispose();
    _roomController.dispose();
    _openedRegistrationController.dispose();
    _closedRegistrationController.dispose();
    _aboutCourseController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final updatedClub = club.copyWith(
      clubName: _clubNameController.text,
      tuition: int.parse(_tuitionController.text),
      openingDay: _openingDayController.text,
      capacity: int.parse(_capacityController.text),
      room: _roomController.text,
      openedRegistration: _openedRegistrationController.text,
      closedRegistration: _closedRegistrationController.text,
      aboutCourse: _aboutCourseController.text,
      semesterID: _selectedSemester,
    );

    Get.back();
  }
  /// chọn ngày trong icon lịch biểu
  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context, // Đảm bảo context được truyền vào
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Định dạng ngày theo kiểu dd/MM/yyyy
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      controller.text = formattedDate; // Cập nhật giá trị cho TextField
    }
  }

  void _removeSchedule(String day) {
    setState(() {
      club.dayOfWeek.remove(day);
    });
  }

  String formatTime(String time) {
    final parts = time.split(':');
    int hour = int.parse(parts[0]);
    if (hour < 12) {
      return time; // Giữ nguyên nếu là AM
    } else {
      return '${hour + 12}:${parts[1]}'; // Chuyển sang 24 giờ
    }
  }

  // Hàm để thêm lịch biểu mới
  void _addSchedule() {
    setState(() {
      club.dayOfWeek['Thứ 6'] = DayOfWeek(startTime: '09:00', endTime: '11:00'); // Thêm lịch biểu mới
    });
  }
  void _checkCapacityLimit() {
    String value = _capacityController.text;
    if (value.length > 19) {
      _showErrorDialog(context, "Số lượng thành viên quá lớn!");
      _capacityController.text = value.substring(0, 19); // Giới hạn chiều dài
    }
  }



  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Lỗi"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Đóng"),
            ),
          ],
        );
      },
    );
  }

  // Hàm chuyển đổi thời gian sang định dạng 24 giờ
  String _formatTimeTo24Hours(TimeOfDay time) {
    final int hour = time.hour;
    final int minute = time.minute;
    final formattedHour = hour < 10 ? '0$hour' : '$hour';
    final formattedMinute = minute < 10 ? '0$minute' : '$minute';
    return '$formattedHour:$formattedMinute';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TeacherAppBarWithTitleHeader2(title: tChiTietCauLacBo),
      body: Column( // Thay đổi từ SingleChildScrollView sang Column
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(t15Size),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Khung chứa thông tin
                    _buildEditableRow("Tên câu lạc bộ:", _clubNameController),
                    _buildEditableRow("Học phí:", _tuitionController, isNumber: true),
                    _buildEditableDateRow("Mở đăng ký từ:", _openedRegistrationController),
                    _buildEditableDateRow("Đóng đăng ký vào:", _closedRegistrationController),
                    _buildEditableDateRow("Ngày khai giảng:", _openingDayController),
                    _buildMemberCountRow(_capacityController),
                    _buildRoomRow(),
                    _buildSemesterDropdown(),
                    SizedBox(height: t10Size),
                    const Text("Mô tả khóa học:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF580B8B))),
                    SizedBox(height: t5Size),
                    _buildTextField(_aboutCourseController, "Nhập mô tả khóa học"),
                    SizedBox(height: t10Size),

                    // Phần lịch học
                    const Text("Lịch học:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF580B8B))),
                    ..._buildScheduleList(),
                    SizedBox(height: t20Size),

                    // Nút "Thêm lịch biểu mới"
                    ElevatedButton(
                      onPressed: _addSchedule,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF380543), // Màu nền cho nút
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("THÊM LỊCH BIỂU MỚI", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(height: t20Size),
                  ],
                ),
              ),
            ),
          ),
          // Nút chỉnh sửa và quay lại ở dưới cùng
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn giữa các nút
            children: [
              const SizedBox(width: 2,),
              ElevatedButton(
                onPressed: _saveChanges, // Tăng kích thước chữ
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA983), // Màu chỉnh sửa
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text("CHỈNH SỬA", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () => Get.back(), // Tăng kích thước chữ
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7B7B7B), // Màu quay lại
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text("QUAY LẠI", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              const SizedBox(width: 2,),
            ],
          ),
          SizedBox(height: t10Size), // Khoảng cách dưới cùng
        ],
      ),
    );
  }
  Widget _buildEditableRow(String title, TextEditingController controller, {bool isNumber = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4E9F7), // Màu nền cho container
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
              color: Color(0xFF580B8B), // Màu chữ cho tiêu đề
            ),
          ),
          const SizedBox(height: 4), // Khoảng cách giữa tiêu đề và TextField
          TextField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            inputFormatters: isNumber
                ? [FilteringTextInputFormatter.digitsOnly]
                : [],
            decoration: InputDecoration(
              border: InputBorder.none, // Ẩn viền của TextField
              filled: true,
              fillColor: const Color(0xFFF4E9F7), // Màu nền cho TextField
              hintText: "Nhập $title",
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFF580B8B), // Màu chữ cho hint
              ),
            ),
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF580B8B), // Màu chữ cho TextField
            ),
            minLines: 1, // Số dòng tối thiểu
            maxLines: null, // Cho phép TextField mở rộng xuống dòng
            onChanged: (value) {
              if (isNumber) {
                // Kiểm tra nếu trường học phí không để trống
                if (value.isEmpty) {
                  // Hiển thị thông báo lỗi cho trường hợp để trống
                  _showErrorDialog(context, 'Học phí không được để trống.');
                  return;
                }
                // Kiểm tra nếu giá trị là số và không vượt quá quy định
                final int? parsedValue = int.tryParse(value);
                if (parsedValue != null && parsedValue > 100000000) { // 100 triệu VND
                  // Hiển thị thông báo lỗi cho trường hợp vượt quá quy định
                  _showErrorDialog(context, 'Học phí không được vượt quá 100 triệu VND.');
                }
              }
            },
          ),
        ],
      ),
    );
  }
  Widget _buildMemberCountRow(TextEditingController _capacityController) {
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
          const Text(
            "Số lượng thành viên tham gia:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF580B8B),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                color: Colors.red,
                onPressed: () {
                  int currentValue = int.tryParse(_capacityController.text) ?? 0;
                  if (currentValue > 0) {
                    _capacityController.text = (currentValue - 1).toString();
                    _checkCapacityLimit();
                  }
                },
              ),
              SizedBox(
                width: 160,
                child: TextField(
                  controller: _capacityController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                    hintText: '0',
                  ),
                  maxLines: null,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      _capacityController.text = '0';
                      _capacityController.selection = TextSelection.fromPosition(const TextPosition(offset: 1));
                    } else {
                      _checkCapacityLimit();
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.add),
                color: Colors.green,
                onPressed: () {
                  int currentValue = int.tryParse(_capacityController.text) ?? 0;
                  _capacityController.text = (currentValue + 1).toString();
                  _checkCapacityLimit();
                },
              ),
              const SizedBox(width: 8),
              const Text(
                "Người",
                style: TextStyle(fontSize: 16, color: Color(0xFF580B8B)),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildEditableDateRow(String title, TextEditingController controller) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF4E9F7), // Màu nền cho container
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
                color: Color(0xFF580B8B), // Màu chữ cho tiêu đề
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
                      border: InputBorder.none, // Ẩn viền của TextField
                      hintText: "Chọn ngày",
                      hintStyle: TextStyle(color: Color(0xFF580B8B)), // Màu chữ cho hint
                      filled: true,
                      fillColor: Color(0xFFF4E9F7), // Màu nền cho TextField
                    ),
                    readOnly: true, // Đặt trường này chỉ đọc để không cho người dùng nhập trực tiếp
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
  Widget _buildRoomRow() {
    return _buildEditableRow("Phòng học:", _roomController);
  }

  Widget _buildSemesterDropdown() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF4E9F7), // Màu nền cho container
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
                color: Color(0xFF580B8B), // Màu chữ cho tiêu đề
              ),
            ),
          ),
          Expanded(
            child: DropdownButton<String>(
              value: _selectedSemester,
              isExpanded: true,
              items: <String>['semester_id_1', 'semester_id_2', 'semester_id_3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16,color: Colors.black), // Kích thước chữ nhỏ hơn
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
                style: TextStyle(fontSize: 14), // Kích thước chữ cho hint nhỏ hơn
              ),
              underline: Container(), // Ẩn đường gạch dưới của DropdownButton
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Container(
      padding: const EdgeInsets.all(8.0), // Thêm padding cho container
      decoration: BoxDecoration(
        color: const Color(0xFFF4E9F7), // Màu nền cho container
        borderRadius: BorderRadius.circular(8), // Bo tròn các góc
      ),
      child: TextField(
        controller: controller,
        maxLines: null, // Cho phép TextField mở rộng theo nội dung
        decoration: InputDecoration(
          border: InputBorder.none, // Ẩn viền của TextField
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF580B8B)), // Màu chữ cho hint
        ),
        style: const TextStyle(color: Color(0xFF580B8B)), // Màu chữ cho TextField
      ),
    );
  }

  List<Widget> _buildScheduleList() {
    return club.dayOfWeek.entries.map((entry) {
      String day = entry.key;
      DayOfWeek schedule = entry.value;

      // Chuyển đổi ngày sang tiếng Việt
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
                    items: _getDaysOfWeek().map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        club.dayOfWeek.remove(day);
                        club.dayOfWeek[newValue!] = schedule;
                      });
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
                const Text("Từ:", style: TextStyle(fontSize: 16), ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Bo góc 12px
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Tăng padding cho đẹp
                  ),
                  onPressed: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      final formattedTime = _formatTimeTo24Hours(pickedTime);
                      setState(() {
                        schedule.startTime = formattedTime;
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
                      borderRadius: BorderRadius.circular(12), // Bo góc 12px
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Tăng padding cho đẹp
                  ),
                  onPressed: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      final formattedTime = _formatTimeTo24Hours(pickedTime);
                      setState(() {
                        schedule.endTime = formattedTime;
                      });
                    }
                  },
                  child: Text(
                    schedule.endTime.isEmpty ? "Đến" : schedule.endTime,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Spacer(), // Đẩy nút xóa sang mép phải
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => _removeSchedule(day),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();
  }

  List<String> _getDaysOfWeek() {
    return [
      'Thứ 2', // Monday
      'Thứ 3', // Tuesday
      'Thứ 4', // Wednesday
      'Thứ 5', // Thursday
      'Thứ 6', // Friday
      'Thứ 7', // Saturday
      'Chủ nhật', // Sunday
    ];
  }
}