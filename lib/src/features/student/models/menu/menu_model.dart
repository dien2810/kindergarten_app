import 'menu_item.dart';

class MenuModel {
  late String? id;
  final Map<String, List<MenuItem>> dates;

  MenuModel({this.id, required this.dates});

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    Map<String, List<MenuItem>> dates = {};
    map.forEach((key, value) {
      if (value is List) {
        dates[key] = (value as List).map((item) => MenuItem.fromMap(item)).toList();
      }
    });
    return MenuModel(
      id: map['id'] as String?,
      dates: dates,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    dates.forEach((key, value) {
      map[key] = value.map((item) => item.toMap()).toList();
    });
    map['id'] = id;
    return map;
  }

  // Getter for dates
  Map<String, List<MenuItem>> get getDates => dates;
}
