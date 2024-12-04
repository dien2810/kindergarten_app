import '../../features/student/models/comment/commentInfo_model.dart';
import '../../features/student/models/comment/comment_model.dart';

abstract class CommentsRepository {
  Future<void> addComment(String id, CommentModel comment);
  Future<void> updateComment(String id, CommentModel comment);
  Future<CommentModel?> getCommentById(String id);
  Future<Map<String, CommentInfo>> getAllComments();
}
