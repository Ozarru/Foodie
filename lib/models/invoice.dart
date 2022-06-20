import 'models.dart';

class Invoice {
  const Invoice({
    required this.eatry,
    required this.id,
    required this.date,
    required this.items,
  });

  final Eatry eatry;
  final int id;
  final DateTime date;
  final List<Meal> items;
}
