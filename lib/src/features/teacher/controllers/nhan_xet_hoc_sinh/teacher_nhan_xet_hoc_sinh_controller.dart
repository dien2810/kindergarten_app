import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TeacherThongTinNhanxetController extends GetxController {
  // Danh sách nhận xét
  var comments = <Map<String, dynamic>>[].obs; // Đảm bảo comments là một observable list
  final CommentData commentData = CommentData(
    teacherID: "teacher_id_1",
    parentName: "Giản Đình Thái", // Example name student
    currentDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
    guardianID: "guardian_id_1",
    replyContent: "",
    commentDate: "",
  );
  @override
  void onInit() {
    super.onInit();
    fetchComments(); // Gọi hàm để lấy nhận xét khi controller được khởi tạo
  }

  // Giả lập hàm lấy nhận xét
  void fetchComments() {
    // Dữ liệu mẫu, có thể thay thế bằng dữ liệu từ API
    List<Map<String, dynamic>> sampleComments = [
      {
        "student_id_1": {
          "commentInfo": [
            {
              "teacherID": "teacher_id_1",
              "comment": "Làm bài tốt",
              "guardianID": "guardian_id_1",
              "replyContent": "Cảm ơn giáo viên nhiều!",
              "commentDate": "03/09/2024",
              "replyDate": "03/09/2024"
            },
            {
              "teacherID": "teacher_id_1",
              "comment": "Làm bài tốt",
              "guardianID": "guardian_id_1",
              "replyContent": "Cảm ơn giáo viên nhiều! vvv",
              "commentDate": "04/09/2024",
              "replyDate": "03/09/2024"
            },
            {
              "teacherID": "teacher_id_1",
              "comment": "Làm bài tốt",
              "guardianID": "guardian_id_1",
              "replyContent": "Cảm ơn giáo viên nhiều! vvv",
              "commentDate": "04/09/2024",
              "replyDate": "05/09/2024"
            }
          ]
        }
      },
      // Có thể thêm nhiều nhận xét ở đây
    ];

    // Cập nhật danh sách nhận xét
    comments.value = sampleComments;
  }
}
class CommentData {
  final String teacherID;
  final String parentName;
  final String currentDate;
  final String guardianID;
  final String replyContent;
  final String commentDate;

  CommentData({
    required this.teacherID,
    required this.parentName,
    required this.currentDate,
    required this.guardianID,
    required this.replyContent,
    required this.commentDate,
  });
}
