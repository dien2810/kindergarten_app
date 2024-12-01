class MenuItem {
  final String? id;
  final String image;
  final List<String> ingredients;
  final String meal;
  final String name;
  final Map<String, String> note;

  MenuItem({
    this.id,
    required this.image,
    required this.ingredients,
    required this.meal,
    required this.name,
    required this.note,
  });

  // Chuyển từ Map sang MenuItem
  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      image: map['image'] ?? '',
      ingredients: List<String>.from(map['ingredients'] ?? []),
      meal: map['meal'] ?? '',
      name: map['name'] ?? '',
      note: Map<String, String>.from(map['note'] ?? {}),
    );
  }

  // Chuyển từ MenuItem sang Map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'ingredients': ingredients,
      'meal': meal,
      'name': name,
      'note': note,
    };
  }
}