class CommentModel {
  final String teacherID;
  final String comment;
  final String? guardianID;  // Optional field
  final String replyContent;
  final String commentDate;
  final String replyDate;

  CommentModel({
    required this.teacherID,
    required this.comment,
    this.guardianID,
    required this.replyContent,
    required this.commentDate,
    required this.replyDate,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      teacherID: json['teacherID'],
      comment: json['comment'],
      guardianID: json['guardianID'],
      replyContent: json['replyContent'],
      commentDate: json['commentDate'],
      replyDate: json['replyDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teacherID': teacherID,
      'comment': comment,
      'guardianID': guardianID,
      'replyContent': replyContent,
      'commentDate': commentDate,
      'replyDate': replyDate,
    };
  }
}
