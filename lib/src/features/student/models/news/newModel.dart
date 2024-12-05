class NewsModel {
  String? id;
  String title;
  String createDate;
  List<Subtitle> subtitles;
  String fileUrl;
  List<String> tags;
  String type;
  String authorID;

  NewsModel({
    this.id,
    required this.title,
    required this.createDate,
    required this.subtitles,
    required this.fileUrl,
    required this.tags,
    required this.type,
    required this.authorID,
  });

  // Phương thức để chuyển từ Map sang NewsModel
  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'],
      title: map['title'] ?? '',
      createDate: map['createDate'] ?? '',
      subtitles: (map['subtitles'] as List<dynamic>)
          .map((e) => Subtitle.fromMap(e as Map<String, dynamic>))
          .toList(),
      fileUrl: map['fileUrl'] ?? '',
      tags: List<String>.from(map['tags'] ?? []),
      type: map['type'] ?? '',
      authorID: map['authorID'] ?? '',
    );
  }

  // Phương thức để chuyển từ NewsModel sang Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'createDate': createDate,
      'subtitles': subtitles.map((e) => e.toMap()).toList(),
      'fileUrl': fileUrl,
      'tags': tags,
      'type': type,
      'authorID': authorID,
    };
  }
}

class Subtitle {
  String subtitleName;
  String imageUrl;
  String content;

  Subtitle({
    required this.subtitleName,
    required this.imageUrl,
    required this.content,
  });

  // Phương thức để chuyển từ Map sang Subtitle
  factory Subtitle.fromMap(Map<String, dynamic> map) {
    return Subtitle(
      subtitleName: map['subtitleName'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      content: map['content'] ?? '',
    );
  }

  // Phương thức để chuyển từ Subtitle sang Map
  Map<String, dynamic> toMap() {
    return {
      'subtitleName': subtitleName,
      'imageUrl': imageUrl,
      'content': content,
    };
  }
}
