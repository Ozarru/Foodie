import '/models/models.dart';

class Order {
  final String? id;
  final String eatry;
  final String client;
  final String courier;
  final String address;
  final int eta;
  final int? radius;
  final List<TestMeal>? items;
  // final List<TestMeal>? items;
  final double startLat;
  final double startLng;
  final double stopLat;
  final double stopLng;

  const Order({
    required this.startLat,
    required this.startLng,
    required this.stopLat,
    required this.stopLng,
    this.id,
    this.radius,
    this.items,
    required this.eatry,
    required this.client,
    required this.courier,
    required this.eta,
    required this.address,
  });
}
