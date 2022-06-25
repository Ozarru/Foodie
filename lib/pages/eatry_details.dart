import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../../pages/pages.dart';
import 'client/client_drawer.dart';

class EatryDetails extends StatefulWidget {
  const EatryDetails({Key? key, required this.eatry}) : super(key: key);

  final TestEatry eatry;

  @override
  State<EatryDetails> createState() => _EatryDetailsState();
}

class _EatryDetailsState extends State<EatryDetails> {
  String query = '';
  bool isLoading = true;
  List<TestMeal> meals = localMeals;

// search functonality
  void searchDataset(String query) {
    query = query.toLowerCase();
    final meals = localMeals.where((item) {
      final mealName = item.name.toLowerCase();
      final mealPrice = item.price.toString();
      final input = query;

      return mealName.contains(input) || mealPrice.contains(input);
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
      appBar: ClientAppBar(title: widget.eatry.name),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: buildPaginatedSearch(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Text('Menu of the day',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            SizedBox(height: 160, child: buildDayMenu(meals)),
            Expanded(child: buildMealGrid(meals))
          ]),
    );
  }

  Widget buildDayMenu(mealsOfDay) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: mealsOfDay.length,
        itemBuilder: (context, index) {
          final meal = mealsOfDay[index];
          if (meal.isOnMenu == true) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MealDetails(meal: meal))),
              child: MealOfDayTile(
                image: meal.image,
                name: meal.name,
                price: meal.price,
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget buildPaginatedSearch() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.white),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14),
              child: Icon(TablerIcons.search, color: Colors.grey, size: 16),
            ),
            Expanded(
                child: AppSearchField(
              hint: 'Find your meal...',
              onChanged: searchDataset,
            )),
            PopupMenuButton<MenuItem>(
              icon: const Icon(
                TablerIcons.filter,
                color: Colors.grey,
              ),
              itemBuilder: (context) =>
                  [...MealFilter.filertIcons.map(buildItem).toList()],
            )
          ],
        ),
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(FilterIcon filertIcon) {
    return PopupMenuItem(
      child: Row(
        children: [
          Icon(
            filertIcon.icon,
            color: Colors.grey,
          ),
          const Spacer(),
          Text(filertIcon.label),
        ],
      ),
    );
  }

  Widget buildMealGrid(meals) {
    if (Responsive.isMobile(context)) {
      return MenuGrid(meals: meals, gridCount: 2);
    } else if (Responsive.isTablet(context)) {
      return MenuGrid(meals: meals, gridCount: 3);
    } else if (Responsive.isDesktop(context)) {
      return MenuGrid(meals: meals, gridCount: 5);
    } else if (Responsive.isWideDesktop(context)) {
      return MenuGrid(meals: meals, gridCount: 7);
    } else {
      return MenuGrid(meals: meals, gridCount: 10);
    }
  }
}
