// import 'dart:async';

import 'models.dart';

class Delivery {
  const Delivery({
    this.id,
    required this.eatry,
    required this.client,
    required this.eta,
    required this.price,
    required this.address,
    required this.items,
    this.payvet,
    // required this.date,
  });

  final int? id;
  final String eatry;
  final String client;
  final String address;
  final int eta;
  final int price;
  final List<String> items;
  final bool? payvet;
  // final List<MenuItem> items;
  // final DateTime date;
  // final Eatry eatry;
  // final User client;
}
