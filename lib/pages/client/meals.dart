import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../../utils/utils.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import '/pages/pages.dart';
import 'client_drawer.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _Menustate createState() => _Menustate();
}

class _Menustate extends State<Menu> {
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
      appBar: const ClientAppBar(title: 'Meals'),
      drawer: const ClientDrawer(),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: buildPaginatedSearch(),
            ),
            Expanded(child: buildMealGrid(meals))
          ]),
    );
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
