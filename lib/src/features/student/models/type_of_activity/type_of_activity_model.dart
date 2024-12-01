class TypeOfActivityModel {
  final String? id;
  final String description;
  final double fee;
  final bool isClub;
  final String typeName;

  TypeOfActivityModel({
    this.id,
    required this.description,
    required this.fee,
    required this.isClub,
    required this.typeName,
  });

  // Chuyển từ Map sang TypeOfActivityModel
  factory TypeOfActivityModel.fromMap(Map<String, dynamic> map) {
    return TypeOfActivityModel(
      description: map['description'] ?? '',
      fee: (map['fee'] ?? 0).toDouble(),
      isClub: map['isClub'] ?? false,
      typeName: map['typeName'] ?? '',
    );
  }

  // Chuyển từ TypeOfActivityModel sang Map
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'fee': fee,
      'isClub': isClub,
      'typeName': typeName,
    };
  }
}
