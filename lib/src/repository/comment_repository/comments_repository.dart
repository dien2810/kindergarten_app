import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';
import '../../features/student/models/comment/comment_info.dart';
import '../../features/student/models/comment/comments_model.dart';


class CommentsRepository{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addComment(String studentId, CommentInfo comments) async {
    // String userId = _accountRepo.userId;  // Sử dụng userId làm comment_id
    DocumentReference docRef = _firestore.collection('comments').doc(studentId);
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      List<dynamic> commentList = docSnapshot.get('commentInfo');
      docRef.update({
        'commentInfo': FieldValue.arrayUnion([commentList, comments.toJson()])
      });
    } else {
      docRef.set({
        'commentInfo': [comments.toJson()]
      });
    }
  }

  Future<void> updateComment(String studentId, List<CommentInfo> comments) async {
    // String userId = _accountRepo.userId;  // Sử dụng userId làm comment_id
    DocumentReference docRef = _firestore.collection('comments').doc(studentId);
    DocumentSnapshot docSnapshot = await docRef.get();
    print(studentId);

    if (docSnapshot.exists) {
      var newComment = [];
      for (var comment in comments) {
        newComment.add(comment.toJson());
      }
      print(newComment);
      docRef.update({
        'commentInfo': newComment
      });
    }
  }

  Future<CommentsModel?> getCommentByStudentId(String studentId) async {
    // String userId = _accountRepo.userId;  // Sử dụng userId làm comment_id
    DocumentSnapshot docSnapshot = await _firestore.collection('comments')
        .doc(studentId).get();
    if (docSnapshot.exists && docSnapshot.data() != null) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      print('Data: $data');
      return CommentsModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  Future<CommentsModel?> getCommentByUserId() async {
    final accountRepo = Get.put(AccountRepository());
    String userId = accountRepo.userId;  // Sử dụng userId làm comment_id
    print('UserID:$userId');
    DocumentSnapshot docSnapshot = await _firestore.collection('comments')
        .doc(userId).get();
    if (docSnapshot.exists && docSnapshot.data() != null) {
      final data = docSnapshot.data() as Map<String, dynamic>;
      print('Data: $data');
      return CommentsModel.fromMap(data); // Chuyển đổi dữ liệu thành model
    } else {
      return null; // Document không tồn tại hoặc không có dữ liệu
    }
  }

  Future<List<CommentsModel>> getAllComments() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('comments').get();
      List<CommentsModel> commentsList = snapshot.docs.map((doc) {
        return CommentsModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      return commentsList;
    } catch (e) {
      print('Lỗi khi lấy danh sách comments: $e');
      return [];
    }
  }
}
