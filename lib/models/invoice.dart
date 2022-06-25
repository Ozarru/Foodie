import 'models.dart';

class Invoice {
  const Invoice({
    required this.id,
    required this.eatry,
    required this.client,
    required this.courier,
    required this.items,
    required this.date,
    required this.total,
  });

  final int id;
  final num total;
  final Eatry eatry;
  final User client;
  final User courier;
  final List<Meal> items;
  final DateTime date;
}
