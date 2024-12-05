import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';

import '../../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../../repository/account_repository/account_repository.dart';
import '../../../controllers/comments/comments_controller.dart';
import '../../../models/comment/comment_model.dart';


class CommentDetailScreen extends StatelessWidget {
  final CommentModel comment;
  final CommentsController commentsController = Get.find();
  final AccountRepository accountRepo = Get.put(AccountRepository());

  CommentDetailScreen({required this.comment});

  final TextEditingController replyContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool canReply = comment.replyContent.isEmpty && comment.replyDate.isEmpty;
    String parentID = comment.guardianID ?? 'Không xác định'; // Hiển thị ID phụ huynh hoặc thông báo nếu không có ID
    String hoVaTenPhuHuynh = accountRepo.fullName; // Lấy họ và tên phụ huynh từ AccountRepository


    return Scaffold(
      appBar: const GuardianAppBarWithTitleWidget(title: tChiTietNhanXet),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<String>(
          future: commentsController.getTeacherNameById(comment.teacherID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            String teacherName = snapshot.data ?? 'Không rõ';

            return SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Giáo viên: $teacherName',  // Hiển thị tên giáo viên
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Phụ huynh: $hoVaTenPhuHuynh ($parentID)',  // Hiển thị họ và tên phụ huynh cùng với ID
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.blue,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            comment.commentDate,  // Hiển thị ngày nhận xét
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        comment.comment,  // Hiển thị nội dung nhận xét
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                if (comment.replyContent.isNotEmpty) ...[
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phản hồi của phụ huynh:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          comment.replyContent,  // Hiển thị phản hồi
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Ngày phản hồi: ${comment.replyDate}',  // Hiển thị ngày phản hồi
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
                if (canReply) ...[
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: replyContentController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            hintText: 'Nội dung phản hồi',
                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),  // Chỉnh kích cỡ và màu sắc của hintText
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          maxLines: null,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                            String replyContent = replyContentController.text;
                            String replyDate = DateTime.now().toString();
                            commentsController.addParentReply(
                              comment.commentDate,
                              replyContent,
                              replyDate,
                            );
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
            );
          },
        ),
      ),
    );
  }
}
