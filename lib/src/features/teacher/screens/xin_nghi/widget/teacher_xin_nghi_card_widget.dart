import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/features/student/models/dayoff_model/dayoff_entry_model.dart';

import '../../../controllers/xin_nghi/teacher_xin_nghi_controller.dart';

class TeacherXinNghiCardWidget extends StatelessWidget {
  final DayoffEntry dayoffEntry;
  final List<String> studentIds;
  final int index;

  const TeacherXinNghiCardWidget({super.key,
    required this.dayoffEntry,
    required this.studentIds,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    print(studentIds[index]);
    final xinNghiController = Get.put(TeacherXinNghiController());
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Container(
        width: double.infinity, // Đặt chiều rộng card chiếm toàn bộ chiều rộng có sẵn
        height:170, // Đặt chiều cao cố định cho card
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: xinNghiController.getXinNghiCard(studentIds[index], dayoffEntry.period),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final studentName = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái
              children: [
                Text(
                  "Người tạo đơn: Phụ huynh em $studentName",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), // Tăng kích thước font
                ),
                const SizedBox(height: 8), // Khoảng cách giữa các dòng
                Text(
                  "Nội dung: ${dayoffEntry.content}",
                  style: const TextStyle( fontSize: 16), // Tăng kích thước font
                  overflow: TextOverflow.ellipsis, // Giới hạn nội dung
                  maxLines: 1, // Giới hạn số dòng
                ),
                Text(
                  "Tiết nghỉ: ${xinNghiController.routineNames.join(', ')}",
                  style: const TextStyle(fontSize: 16), // Tăng kích thước font
                  overflow: TextOverflow.ellipsis, // Giới hạn nội dung
                  maxLines: 1, // Giới hạn số dòng
                ),
                Text(
                  "Trạng thái: ${dayoffEntry.status}",
                  style: TextStyle(
                    color: dayoffEntry.status == 'Đã duyệt' ? Colors.green : Colors.red,
                    fontSize: 16, // Tăng kích thước font
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}