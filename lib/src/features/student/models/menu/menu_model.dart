import 'menu_item.dart';

class MenuModel {
  final String? id;
  final Map<String, List<MenuItem>> dates;

  MenuModel({this.id, required this.dates});

  // Chuyển từ Map sang MenuModel
  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      dates: map.map((key, value) {
        return MapEntry(
          key,
          (value as List<dynamic>).map((item) => MenuItem.fromMap(item)).toList(),
        );
      }),
    );
  }

  // Chuyển từ MenuModel sang Map
  Map<String, dynamic> toMap() {
    return dates.map((key, value) {
      return MapEntry(
        key,
        value.map((item) => item.toMap()).toList(),
      );
    });
  }
}