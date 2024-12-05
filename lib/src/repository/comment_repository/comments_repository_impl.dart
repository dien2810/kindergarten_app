import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../features/student/models/comment/commentInfo_model.dart';
import '../../features/student/models/comment/comment_model.dart';
import '../account_repository/account_repository.dart';
import 'comments_repository.dart';


class CommentsRepositoryImpl implements CommentsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _accountRepo = Get.put(AccountRepository());

  @override
  Future<void> addComment(String id, CommentModel comment) async {
    String userId = _accountRepo.userId;  // Sử dụng userId làm comment_id
    DocumentReference docRef = _firestore.collection('comments').doc(userId);
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      docRef.update({
        'commentInfo': FieldValue.arrayUnion([comment.toJson()])
      });
    } else {
      docRef.set({
        'commentInfo': [comment.toJson()]
      });
    }
  }

  @override
  Future<void> updateComment(String id, CommentModel comment) async {
    String userId = _accountRepo.userId;  // Sử dụng userId làm comment_id
    DocumentReference docRef = _firestore.collection('comments').doc(userId);
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      List<dynamic> commentList = docSnapshot.get('commentInfo');
      int index = commentList.indexWhere((c) => c['commentDate'] == comment.commentDate);
      if (index != -1) {
        commentList[index] = comment.toJson();
        docRef.update({
          'commentInfo': commentList
        });
      }
    }
  }

  @override
  Future<CommentModel?> getCommentById(String id) async {
    String userId = _accountRepo.userId;  // Sử dụng userId làm comment_id
    DocumentSnapshot docSnapshot = await _firestore.collection('comments').doc(userId).get();
    if (docSnapshot.exists) {
      List<dynamic> commentList = docSnapshot.get('commentInfo');
      if (commentList.isNotEmpty) {
        return CommentModel.fromJson(commentList.first);
      }
    }
    return null;
  }

  @override
  Future<Map<String, CommentInfo>> getAllComments() async {
    String userId = _accountRepo.userId;  // Sử dụng userId làm comment_id
    DocumentSnapshot docSnapshot = await _firestore.collection('comments').doc(userId).get();
    Map<String, CommentInfo> allComments = {};
    if (docSnapshot.exists) {
      List<CommentModel> commentList = (docSnapshot.get('commentInfo') as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
      allComments[userId] = CommentInfo(commentInfo: commentList);
    }
    return allComments;
  }
}
