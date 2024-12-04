import 'comment_model.dart';

class CommentInfo {
  final List<CommentModel> commentInfo;

  CommentInfo({
    required this.commentInfo,
  });

  // Phương thức từ JSON để tạo đối tượng CommentInfo từ JSON
  factory CommentInfo.fromJson(Map<String, dynamic> json) {
    var list = json['commentInfo'] as List;
    List<CommentModel> commentList = list.map((i) => CommentModel.fromJson(i)).toList();

    return CommentInfo(commentInfo: commentList);
  }

  // Phương thức để chuyển đối tượng CommentInfo thành JSON
  Map<String, dynamic> toJson() {
    return {
      'commentInfo': commentInfo.map((e) => e.toJson()).toList(),
    };
  }
}
