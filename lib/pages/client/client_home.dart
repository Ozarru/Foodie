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
import 'client_drawer.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({Key? key}) : super(key: key);

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  String query = '';
  bool isLoading = true;
  List<Eatry> eatries = localEatries;
  List<Meal> meals = localMeals;

  void searchDataset(String query) {
    query = query.toLowerCase();
    final meals = localMeals.where((item) {
      final itemName = item.name.toLowerCase();
      final itemPrice = item.price.toString();
      final input = query;

      return itemName.contains(input) || itemPrice.contains(input);
    }).toList();

    setState(() {
      this.meals = meals;
      this.query = query;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const ClientDrawer(),
        body: SafeArea(
            child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          // color: Colors.grey[200],
          child: Column(
            children: [
              //
              Expanded(
                child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                              icon: const Icon(TablerIcons.menu)),
                          Expanded(child: searcher(context)),
                          IconButton(
                              onPressed: () =>
                                  Scaffold.of(context).openDrawer(),
                              icon: const Icon(TablerIcons.notification)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        child: Text('Promoted restaurants',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Container(height: 180, child: buildEatries(context)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20),
                        child: Text('Menu of the day',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Container(
                        height: 480,
                        child: buildMenu(context),
                      ),
                    ]),
              )
            ],
          ),
        )));
  }

  Padding searcher(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: Icon(TablerIcons.search, color: Colors.grey, size: 14),
            ),
            Expanded(child: SearchField(hint: 'Find a meal...')),
          ],
        ),
      ),
    );
  }

  Widget buildEatries(eatries) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: eatries.length,
        itemBuilder: (context, index) {
          final eatry = eatries[index];
          if (eatry.isPromoted) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EatryDetails(eatry: eatry))),
              child: FeaturedTile(
                image: eatry.image,
                name: eatry.name,
                // hands: eatries[index]['hands'],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget buildMenu(meals) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MealDetails(meal: meal))),
            child: MenuTile(
              image: meal.image,
              name: meal.name,
              price: meal.price,
            ),
          );
        });
  }
}
