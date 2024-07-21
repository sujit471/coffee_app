import 'dart:convert';

class Coffee {
  final int id;
  final String name;
  final String category;
  final String description;
  final double rating;
  final int ratingCount;
  final String image;
  final List<String> variations;
  final double price;

  Coffee({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.rating,
    required this.ratingCount,
    required this.image,
    required this.variations,
    required this.price,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      rating: json['rating'],
      ratingCount: json['rating_count'],
      image: json['image'],
      variations: List<String>.from(json['variations']),
      price: json['price'],
    );
  }

  static List<Coffee> fromJsonList(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((item) => Coffee.fromJson(item)).toList();
  }
}
