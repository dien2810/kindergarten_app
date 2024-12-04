import 'package:get/get.dart';

import '../../../../repository/account_repository/account_repository.dart';
import '../../../../repository/comment_repository/comments_repository.dart';
import '../../../../repository/comment_repository/comments_repository_impl.dart';
import '../../../../repository/teacher_repository/teacher_repository.dart';
import '../../../authentication/models/account_model.dart';
import '../../models/comment/commentInfo_model.dart';
import '../../models/comment/comment_model.dart';
import '../../models/teacher/teacher_model.dart';




class CommentsController extends GetxController {
  final CommentsRepository _repository = CommentsRepositoryImpl();
  final _accountRepo = Get.put(AccountRepository());

  var comments = RxMap<String, CommentInfo>();

  @override
  void onInit() {
    super.onInit();
    fetchComments();
  }

  void fetchComments() async {
    Map<String, CommentInfo> allComments = await _repository.getAllComments();
    comments.clear();
    comments.addAll(allComments);
  }

  // Thêm nhận xét của giáo viên
  Future<void> addTeacherComment(CommentModel comment) async {
    String userId = _accountRepo.userId;
    await _repository.addComment(userId, comment);
    fetchComments();
  }

  // Thêm phản hồi của phụ huynh vào nhận xét của giáo viên
  Future<void> addParentReply(String commentDate, String replyContent, String replyDate) async {
    String userId = _accountRepo.userId;
    Map<String, CommentInfo> allComments = await _repository.getAllComments();

    if (allComments.containsKey(userId)) {
      var commentInfo = allComments[userId]!.commentInfo;
      var updatedComments = commentInfo.map((c) {
        if (c.commentDate == commentDate) {
          return CommentModel(
            teacherID: c.teacherID,
            comment: c.comment,
            guardianID: _accountRepo.userId,
            replyContent: replyContent,
            commentDate: c.commentDate,
            replyDate: replyDate,
          );
        } else {
          return c;
        }
      }).toList();

      await _repository.updateComment(userId, CommentModel(
        teacherID: updatedComments.first.teacherID,
        comment: updatedComments.first.comment,
        guardianID: updatedComments.first.guardianID,
        replyContent: updatedComments.first.replyContent,
        commentDate: updatedComments.first.commentDate,
        replyDate: updatedComments.first.replyDate,
      ));
    }
    fetchComments();
  }

  // Lấy nhận xét theo ID
  Future<CommentModel?> getCommentById() async {
    String userId = _accountRepo.userId;
    return await _repository.getCommentById(userId);
  }

  // Lấy tất cả nhận xét
  Future<Map<String, CommentInfo>> getAllComments() async {
    return await _repository.getAllComments();
  }

  // Lấy tên giáo viên theo ID
  Future<String> getTeacherNameById(String teacherId) async {
    AccountModel teacher = await _accountRepo.getAccountDetails(teacherId);
    return teacher.fullname ?? 'Không rõ';
  }
}
