import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindergarten_app/src/repository/account_repository/account_repository.dart';

import '../../../../repository/teacher_repository/teacher_repository.dart';
import '../../../student/models/teacher/teacher_model.dart';

class CommentInfo {
  final String teacherID;
  final String comment;
  final String replyContent;
  final String? guardianID; // Thêm thuộc tính guardianID
  final String commentDate; // Giữ commentDate là String
  final String replyDate; // Giữ replyDate là String

  CommentInfo({
    required this.teacherID,
    required this.comment,
    required this.replyContent,
    this.guardianID, // Thuộc tính này có thể null
    required this.commentDate,
    required this.replyDate,
  });

  factory CommentInfo.fromMap(Map<String, dynamic> map) {
    return CommentInfo(
      teacherID: map['teacherID'],
      comment: map['comment'],
      replyContent: map['replyContent'],
      guardianID: map['guardianID'],
      commentDate: map['commentDate'],
      replyDate: map['replyDate'],
    );
  }
}

class CommentModel {
  final String studentID;
  final List<CommentInfo> commentInfo; // Danh sách các nhận xét

  CommentModel({
    required this.studentID,
    required this.commentInfo,
  });

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    var commentList = (map['commentInfo'] as List)
        .map((comment) => CommentInfo.fromMap(comment))
        .toList();

    return CommentModel(
      studentID: map['studentID'],
      commentInfo: commentList,
    );
  }
}

class TeacherThongTinNhanxetController extends GetxController {
  var comments = <CommentModel>[].obs; // Danh sách các CommentModel
  final _teacherRepo = Get.put(TeacherRepository());
  // Phương thức để tải nhận xét của giáo viên cho học sinh
  void loadComments(Map<String, dynamic> commentsData, String studentId, String teacherId) {
    if (commentsData.containsKey(studentId)) {
      var studentCommentsData = commentsData[studentId];
      var commentModel = CommentModel.fromMap({
        'studentID': studentId,
        'commentInfo': studentCommentsData['commentInfo'],
      });

      // Lọc nhận xét theo teacherID
      var filteredComments = commentModel.commentInfo.where((comment) {
        return comment.teacherID == teacherId;
      }).toList();

      comments.assignAll([CommentModel(studentID: studentId, commentInfo: filteredComments)]); // Cập nhật danh sách nhận xét
    } else {
      comments.clear(); // Nếu không có nhận xét cho học sinh
    }
  }

  void loadCommentsForStudent(String studentId, String teacherId) async {
    try {
      // Lấy dữ liệu từ Firestore
      final snapshot = await FirebaseFirestore.instance
          .collection('comments')
          .doc(studentId)
          .get();

      // Kiểm tra xem document có tồn tại hay không
      if (snapshot.exists) {
        var studentCommentsData = snapshot.data()!;

        // Chuyển đổi dữ liệu nhận xét thành CommentInfo
        List<CommentInfo> commentInfoList = [];
        if (studentCommentsData['commentInfo'] != null) {
          var commentsData = studentCommentsData['commentInfo'] as List;

          // Lọc nhận xét theo teacherID
          commentInfoList = commentsData.map((data) {
            var commentInfo = CommentInfo.fromMap(data);
            // Chỉ thêm nhận xét nếu teacherID khớp
            return commentInfo.teacherID == teacherId ? commentInfo : null;
          }).where((comment) => comment != null).cast<CommentInfo>().toList();
        }

        // Tạo CommentModel từ danh sách CommentInfo
        var commentModel = CommentModel(
          studentID: studentId,
          commentInfo: commentInfoList,
        );

        // Cập nhật danh sách nhận xét
        comments.assignAll([commentModel]);
      } else {
        comments.clear(); // Nếu không có nhận xét cho học sinh
      }
    } catch (e) {
      print("Error loading comments: $e");
      comments.clear(); // Nếu có lỗi xảy ra
    }
  }

  Future<String> getTeacherName(String sentBy) async {
    TeacherModel? teacher= await _teacherRepo.getTeacherById(sentBy);
    String teacherName = await  teacher!.firstName +  ' ' + teacher.lastName;
    return teacherName;
  }


  Future<void> addComment(String guardianID, String teacherID, String comment) async {
    String commentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    String replyContent = "";
    String replyDate = "";

    CommentInfo newComment = CommentInfo(
      teacherID: teacherID,
      comment: comment,
      replyContent: replyContent,
      guardianID: guardianID,
      commentDate: commentDate,
      replyDate: replyDate,
    );

    try {
      DocumentReference docRef = FirebaseFirestore.instance.collection('comments').doc(guardianID);

      await docRef.set({
        'commentInfo': FieldValue.arrayUnion([{
          'teacherID': newComment.teacherID,
          'comment': newComment.comment,
          'replyContent': newComment.replyContent,
          'guardianID': newComment.guardianID,
          'commentDate': newComment.commentDate,
          'replyDate': newComment.replyDate,
        }]),
      }, SetOptions(merge: true));

      print("Comment added successfully");
    } catch (e) {
      print("Error adding comment: $e");
    }
  }



}