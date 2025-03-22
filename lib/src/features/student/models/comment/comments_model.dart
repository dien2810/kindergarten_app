import 'comment_info.dart';

class CommentsModel {
  final String? studentID;
  final List<CommentInfo> commentInfo;

  CommentsModel({
    this.studentID,
    required this.commentInfo,
  });

  // Phương thức từ JSON để tạo đối tượng Comments từ JSON
  // Chuyển từ Map sang CommentsModel
  factory CommentsModel.fromMap(Map<String, dynamic> map) {
    return CommentsModel(
      commentInfo: (map['commentInfo'] as List<dynamic>?)
          ?.map((e) => CommentInfo.fromJson(e))
          .toList() ??
          [],
    );
  }

  // Chuyển từ CommentsModel sang Map
  Map<String, dynamic> toMap() {
    return {
      'commentInfo': commentInfo.map((e) => e.toJson()).toList(),
    };
  }
}
