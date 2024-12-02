import 'package:flutter/material.dart';

class TeacherXinNghiCardWidget extends StatelessWidget {
  final Map<String, dynamic> dayOffData;

  const TeacherXinNghiCardWidget({Key? key, required this.dayOffData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String studentId = dayOffData.keys.first;
    var dateData = dayOffData[studentId]['dates'].values.first; // Lấy dữ liệu ngày đầu tiên

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Container(
        width: double.infinity, // Đặt chiều rộng card chiếm toàn bộ chiều rộng có sẵn
        height:170, // Đặt chiều cao cố định cho card
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái
          children: [
            Text(
              "Người tạo đơn : Phụ huynh em $studentId",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), // Tăng kích thước font
            ),
            const SizedBox(height: 8), // Khoảng cách giữa các dòng
            Text(
              "Nội dung ${dateData['content']}",
              style: TextStyle( fontSize: 16), // Tăng kích thước font
              overflow: TextOverflow.ellipsis, // Giới hạn nội dung
              maxLines: 1, // Giới hạn số dòng
            ),
            Text(
              "Thời gian: ${dateData['period'].join(', ')}",
              style: TextStyle(fontSize: 16), // Tăng kích thước font
              overflow: TextOverflow.ellipsis, // Giới hạn nội dung
              maxLines: 1, // Giới hạn số dòng
            ),
            Text(
              "Trạng thái: ${dateData['status']}",
              style: TextStyle(
                color: dateData['status'] == 'Đã duyệt' ? Colors.green : Colors.red,
                fontSize: 16, // Tăng kích thước font
              ),
            ),
          ],
        ),
      ),
    );
  }
}