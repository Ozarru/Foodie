class MealType {
  String? id;
  final String name;
  final String? description;

  MealType({
    this.id,
    required this.name,
    this.description,
  });

  factory MealType.fromJson(Map<String, dynamic> json) => MealType(
        id: json['id'],
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  List<Object?> get props => [id, name, description];
}
