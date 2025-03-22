import 'package:get/get.dart';

import '../../../../repository/account_repository/account_repository.dart';
import '../../../../repository/comment_repository/comments_repository.dart';
import '../../../authentication/models/account_model.dart';
import '../../models/comment/comment_info.dart';
import '../../models/comment/comments_model.dart';

class CommentsController extends GetxController {
  final CommentsRepository _repository = CommentsRepository();
  final _accountRepo = Get.put(AccountRepository());
  Rx<bool> isReplyEmpty = true.obs;

  List<CommentInfo> comments = [];


  void setReplyEmpty(bool status) {
    isReplyEmpty.value = status;
  }

  Future<void> fetchComments() async {
    CommentsModel? allComments = await _repository.getCommentByUserId();
    comments.clear();
    comments.addAll(allComments!.commentInfo);
  }

  // Thêm nhận xét của giáo viên
  Future<void> addTeacherComment(CommentInfo comment) async {
    String userId = _accountRepo.userId;
    await _repository.addComment(userId, comment);
    fetchComments();
  }

  // Thêm phản hồi của phụ huynh vào nhận xét của giáo viên
  Future<void> addParentReply(index, String replyContent, String replyDate) async {
    print(index);
    if (index != -1) {
      var commentInfo = comments[index];
      var updatedComments = CommentInfo(
        teacherID: commentInfo.teacherID,
        comment: commentInfo.comment,
        guardianID: commentInfo.guardianID,
        replyContent: replyContent,
        commentDate: commentInfo.commentDate,
        replyDate: replyDate,
      );
      comments[index] = updatedComments;

      await _repository.updateComment(_accountRepo.userId, comments);
      setReplyEmpty(false);
    }
    print("Fetch comments");
    fetchComments();
  }

  // Lấy nhận xét theo ID
  Future<CommentsModel?> getCommentById() async {
    String userId = _accountRepo.userId;
    return await _repository.getCommentByStudentId(userId);
  }

  // Lấy tất cả nhận xét
  Future<List<CommentsModel>> getAllComments() async {
    return await _repository.getAllComments();
  }

  // Lấy tên giáo viên theo ID
  Future<String> getTeacherNameById(String teacherId) async {
    AccountModel teacher = await _accountRepo.getAccountDetails(teacherId);
    return teacher.fullname ?? 'Không rõ';
  }

  Future<void> deleteReply(int index) async {
    comments[index].replyContent = "";
    comments[index].replyDate = "";
    await _repository.updateComment(_accountRepo.userId, comments);
    setReplyEmpty(true);
  }
}
