import 'package:foodie/models/eatry.dart';

class MenuGroup {
  final int? id;
  final String name;
  final Eatry eatry;
  final String? description;

  const MenuGroup({
    this.id,
    required this.eatry,
    required this.name,
    this.description,
  });

  factory MenuGroup.fromMap(Map<String, dynamic> json) => MenuGroup(
        id: json['id'],
        name: json['name'],
        eatry: json['eatry'],
        description: json['description'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [id, name, description];
}
