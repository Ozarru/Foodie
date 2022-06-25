import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';

import '/utils/utils.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';
import '/pages/pages.dart';
import 'admin_drawer.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  String query = '';
  bool isLoading = true;

  // void searchDataset(String query) {
  //   query = query.toLowerCase();
  //   final meals = localMeals.where((item) {
  //     final itemName = item.name.toLowerCase();
  //     final itemPrice = item.price.toString();
  //     final input = query;

  //     return itemName.contains(input) || itemPrice.contains(input);
  //   }).toList();

  //   setState(() {
  //     this.meals = meals;
  //     this.query = query;
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CourierAppBar(title: 'Home'),
        drawer: const AdminDrawer(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text('Featured restaurants',
                  style: Theme.of(context).textTheme.headline3),
            ),
            SizedBox(height: 160, child: buildEatries()),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text('Menu of the day',
                  style: Theme.of(context).textTheme.headline3),
            ),
            Expanded(flex: 3, child: buildMenu())
          ],
        ));
  }

  Widget buildEatries() {
    List<TestEatry> eatries = localEatries;

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: eatries.length,
        itemBuilder: (context, index) {
          final eatry = eatries[index];
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EatryDetails(eatry: eatry))),
            child: FeaturedTile(
              image: eatry.image ?? 'assets/static/pub.webp',
              name: eatry.name,
              // hands: eatries[index]['hands'],
            ),
          );
        });
  }

  Widget buildMenu() {
    List<TestMeal> meals = localMeals;
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          if (meal.isOnMenu == true) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MealDetails(meal: meal))),
              child: MenuListTile(
                image: meal.image ?? 'assets/branding/grey.png',
                name: meal.name,
                price: meal.price,
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
