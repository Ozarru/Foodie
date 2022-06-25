import 'models.dart';

class MealGroup {
  final String? id;
  final Eatry eatry;
  final String name;
  final String? description;
  final List<Meal>? meals;

  const MealGroup({
    this.id,
    required this.eatry,
    required this.name,
    this.description,
    this.meals,
  });

  factory MealGroup.fromJson(Map<String, dynamic> json) => MealGroup(
        id: json['id'],
        name: json['name'],
        eatry: json['eatry'],
        description: json['description'],
        meals: json['meals'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'eatry': eatry,
      'name': name,
      'description': description,
      'meals': meals,
    };
  }

  List<Object?> get props => [id, eatry, name, description, meals];
}
