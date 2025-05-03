import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/constants/text_strings.dart';

import '../../../../../common_widgets/app_bar_widgets/guardian_app_bar_with_title.dart';
import '../../../../../repository/account_repository/account_repository.dart';
import '../../../controllers/comments/comments_controller.dart';
import '../../../models/comment/comment_info.dart';

class CommentDetailScreen extends StatelessWidget {
  CommentInfo commentInfo;
  final int index;
  final CommentsController commentsController = Get.find();
  final AccountRepository accountRepo = Get.put(AccountRepository());

  CommentDetailScreen({super.key, required this.commentInfo, required this.index});

  final TextEditingController replyContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String parentID = commentInfo.guardianID ?? 'Không xác định'; // Hiển thị ID phụ huynh hoặc thông báo nếu không có ID
    String hoVaTenPhuHuynh = accountRepo.fullName; // Lấy họ và tên phụ huynh từ AccountRepository
    if (commentInfo.replyContent.isNotEmpty){
      commentsController.isReplyEmpty.value = false;
    }
    else {
      commentsController.isReplyEmpty.value = true;
    }

    return Scaffold(
      appBar: const GuardianAppBarWithTitleWidget(title: tChiTietNhanXet),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<String>(
          future: commentsController.getTeacherNameById(commentInfo.teacherID),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Giáo viên chủ nhiệm lớp: Pool 01',  // Hiển thị tên giáo viên
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Phụ huynh: $hoVaTenPhuHuynh ($parentID)',  // Hiển thị họ và tên phụ huynh cùng với ID
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.blue,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            commentInfo.commentDate,  // Hiển thị ngày nhận xét
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        commentInfo.comment,  // Hiển thị nội dung nhận xét
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Obx((){
                  commentInfo = commentsController.comments[index];
                  if (commentsController.isReplyEmpty.value == false) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Phản hồi của phụ huynh:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  commentInfo.replyContent,  // Hiển thị phản hồi
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () async {
                                  await commentsController.deleteReply(index);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Ngày phản hồi: ${commentInfo.replyDate}',  // Hiển thị ngày phản hồi
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }
                  else {
                    bool isEmpty = commentsController.isReplyEmpty.value;
                    return Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: replyContentController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              hintText: 'Nội dung phản hồi',
                              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),  // Chỉnh kích cỡ và màu sắc của hintText
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            maxLines: null,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.send, color: Colors.white),
                            onPressed: () async {
                              String replyContent = replyContentController.text;
                              String replyDate = DateTime.now().toString();
                              replyContentController.text = "";
                              await commentsController.addParentReply(
                                index,
                                replyContent,
                                replyDate,
                              );
                              // Get.back();
                            },
                          ),
                        ),
                      ],
                    );
                  }
                })
              ],
            ),
            );
          },
        ),
      ),
    );
  }
}
