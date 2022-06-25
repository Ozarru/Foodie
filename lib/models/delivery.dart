import 'models.dart';

class Delivery {
  const Delivery({
    this.id,
    this.courier,
    required this.eatry,
    required this.client,
    required this.eta,
    required this.price,
    required this.address,
    required this.items,
    required this.date,
  });

  final int? id;
  final Eatry eatry;
  final User client;
  final User? courier;
  final String address;
  final int eta;
  final num price;
  final List<Meal> items;
  final DateTime date;
}
