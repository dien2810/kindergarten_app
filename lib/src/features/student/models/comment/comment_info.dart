class CommentInfo {
  final String teacherID;
  final String comment;
  final String? guardianID;  // Optional field
  late String replyContent;
  final String commentDate;
  late String replyDate;

  CommentInfo({
    required this.teacherID,
    required this.comment,
    this.guardianID,
    required this.replyContent,
    required this.commentDate,
    required this.replyDate,
  });

  factory CommentInfo.fromJson(Map<String, dynamic> json) {
    return CommentInfo(
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
