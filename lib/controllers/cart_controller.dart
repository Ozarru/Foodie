// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/models.dart';

class CartController extends GetxController {
  final _items = {}.obs;

  void additem(MenuItem item) {
    if (_items.containsKey(item)) {
      _items[item] += 1;
    } else {
      _items[item] = 1;
    }
  }

  void removeitem(MenuItem item) {
    if (_items.containsKey(item) && _items[item] == 1) {
      _items.removeWhere((key, value) => key == item);
    } else {
      _items[item] -= 1;
    }
  }

  void clearCart(RxMap<dynamic, dynamic> items) {
    while (items.isNotEmpty) {
      items.forEach((key, value) => _items.remove(key));
      debugPrint('cart cleared');
    }

    // for (var item in items.keys) {
    //   _items.removeWhere((key, value) => key == item);
    // }
  }

  final _tax = 18.0;

  get items => _items;

  get tax => _tax;

  get total => _items.entries
      .map((item) => item.key.netPrice * item.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(0);

  get itemCount => _items.entries
      .map((item) => item.value)
      .toList()
      .reduce((value, element) => value + element);

  get itemsCount => _items.length;
}
