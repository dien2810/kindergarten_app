import 'commentInfo_model.dart';

class Comments {
  final Map<String, CommentInfo> comments;

  Comments({
    required this.comments,
  });

  // Phương thức từ JSON để tạo đối tượng Comments từ JSON
  factory Comments.fromJson(Map<String, dynamic> json) {
    Map<String, CommentInfo> commentMap = {};
    json.forEach((key, value) {
      commentMap[key] = CommentInfo.fromJson(value);
    });

    return Comments(comments: commentMap);
  }

  // Phương thức để chuyển đối tượng Comments thành JSON
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    comments.forEach((key, value) {
      json[key] = value.toJson();
    });

    return json;
  }
}
