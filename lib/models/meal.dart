import 'package:flutter/cupertino.dart';

class Meal {
  final String? image;
  final String name;
  final int price;

  const Meal({
    this.image,
    required this.name,
    required this.price,
  });
}
