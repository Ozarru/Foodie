import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key, required this.meal}) : super(key: key);

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(meal.name),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              // color: Colors.black,
            )),
      ),
      body: Container(
        child: buildDetails(meal),
      ),
    );
  }

  Widget buildDetails(meal) {
    return Center(
      child: Text(meal.name),
    );
  }
}
