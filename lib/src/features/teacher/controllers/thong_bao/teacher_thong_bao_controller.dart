import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNotification {
  final String title;
  final String message;
  final String dateSent;
  final String sentBy;
  final List<String> recipients;
  final String priority;
  final bool allReceivedStatus;
  final String typeOfNotification;

  CustomNotification({
    required this.title,
    required this.message,
    required this.dateSent,
    required this.sentBy,
    required this.recipients,
    required this.priority,
    required this.allReceivedStatus,
    required this.typeOfNotification,
  });
}

class TeacherThongBaoController extends GetxController {
  var notifications = <CustomNotification>[].obs; // Sử dụng CustomNotification

  @override
  void onInit() {
    super.onInit();
    notifications.assignAll([
      CustomNotification(
        title: "Thông báo về việc đóng học phí CLB Bóng đá",
        message: "Đề nghị đóng học phí CLB Bóng đá trước 31/12/2024",
        dateSent: "03/09/2024",
        sentBy: "teacher_id_1",
        recipients: ["account_id_1", "account_id_2"],
        priority: "low",
        allReceivedStatus: false,
        typeOfNotification: "Học phí",
      ),
      CustomNotification(
        title: "Thông báo về việc đóng học phí CLB Bóng đá",
        message: "Đề nghị đóng học phí CLB Bóng đá trước 31/12/2024",
        dateSent: "03/09/2024",
        sentBy: "teacher_id_1",
        recipients: ["account_id_1", "account_id_2"],
        priority: "low",
        allReceivedStatus: false,
        typeOfNotification: "Học phí",
      ),
      CustomNotification(
        title: "Danh sách Đồ dùng học tập Học sinh năm học 2024 - 2025",
        message: "Nhà trường xin gửi tới Quý Phụ huynh và Học sinh Danh sách đồ dùng học tập năm học 2024 – 2025 của khối Tiểu học và Trung học như sau: https://vinschool.edu.vn/wp-content/uploads/2024/07/04/Danh-muc-chuan-bi-do-dung-lop-1.pdf",
        dateSent: "13/09/2024",
        sentBy: "teacher_id_2",
        recipients: [
          "account_id_1",
          "account_id_2",
          "account_id_3",
          "account_id_4",
        ],
        priority: "normal",
        allReceivedStatus: false,
        typeOfNotification: "dụng cụ học tập",
      ),
      CustomNotification(
        title: "Giải đáp về Chương trình Giáo dục Vinschool",
        message: "Câu 1: Học sinh học theo chương trình giáo dục ở Vinschool có vào được Đại học Việt Nam? ...",
        dateSent: "20/09/2024",
        sentBy: "teacher_id_2",
        recipients: [],
        priority: "high",
        allReceivedStatus: true,
        typeOfNotification: "giải đáp",
      ),
    CustomNotification(
    title: "Thư ngỏ v/v đóng góp đề xuất địa điểm hỗ trợ xây dựng trường học từ nguồn quỹ EDURUN 2022",
    message: "Kính gửi quý phụ huynh,\nVới sự chung sức của hơn 30.000 phụ huynh & học sinh tham gia, \ngiải chạy EDURUN 2022 do Hệ thống Giáo dục Vinschool tổ chức đã “cán đích” thành công với gần 2,2 tỷ đồng. Từ nguồn ngân sách này, Vinschool rất mong tiếp tục nhận được sự đồng hành của các bậc phụ huynh để tìm kiếm địa chỉ nhằm hỗ trợ cải tạo, xây dựng trường, lớp cho trẻ em nghèo ở những vùng sâu, vùng xa.\nQuý phụ huynh có thông tin về những điểm trường khó khăn cần được hỗ trợ xây dựng hoặc cải tạo xin vui lòng gửi đề xuất cho nhà trường TẠI ĐÂY.\nThời gian tiếp nhận đề xuất của phụ huynh: từ ngày 18/6/2022 đến hết ngày 30/6/2022.",
    dateSent: "21/09/2024",
    sentBy: "teacher_id_2",
    recipients: [],
    priority: "normal",
    allReceivedStatus: true,
    typeOfNotification: "thư ngỏ",
    ),

      // Thêm các thông báo khác...
    ]);
  }

  List<CustomNotification> get notificationList => notifications.toList();
}