import 'dart:convert';

class Dish {
  final String name;
  final String descriptions;
  final String imageLink;

  Dish({
    required this.name,
    required this.descriptions,
    required this.imageLink,
  });

  static Dish fromJson(Map<String, dynamic> json) {
    return Dish(name: json['name'] ?? '', descriptions: json['description'] ?? '', imageLink: json['imageLink'] ?? '');
  }

  static Dish fromJsonString(String str) {
    final Map<String, dynamic> json = jsonDecode(str);
    return Dish.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "description": descriptions, "imageLink": imageLink};
  }

  String toJsonString() {
    return toJson().toString();
  }
}
