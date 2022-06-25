import 'models.dart';

class Meal {
  final String? id;
  final Eatry? eatry;
  final MealGroup? group;
  final MealType? type;
  final String? image;
  final String? description;
  final String name;
  final int price;

  const Meal({
    this.id,
    this.eatry,
    this.group,
    this.type,
    this.image,
    this.description,
    required this.name,
    required this.price,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json['id'],
        group: json['group'],
        eatry: json['eatry'],
        type: json['type'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'group': group,
      'eatry': eatry,
      'type': type,
      'image': image,
      'name': name,
      'price': price,
      'description': description,
    };
  }

  List<Object?> get props =>
      [id, group, eatry, type, image, name, price, description];
}
