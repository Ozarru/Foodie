import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../../utils/utils.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import '/pages/pages.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _Menustate createState() => _Menustate();
}

class _Menustate extends State<Menu> {
  String query = '';
  bool isLoading = true;
  List<Meal> meals = localMeals;

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
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: buildPaginatedSearch(),
            ),
            Expanded(child: buildList(meals))
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
                child: SearchField(
              hint: 'Search an menu...',
              onChanged: searchDataset,
            )),
            // PopupMenuButton<meal>(
            //   icon: const Icon(
            //     TablerIcons.filter,
            //     color: Colors.grey,
            //   ),
            //   itemBuilder: (context) =>
            //       [...FoodFilter.filertIcons.map(buildItem).toList()],
            // )
          ],
        ),
      ),
    );
  }

  // Popupmeal<meal> buildItem(FilterIcon filertIcon) {
  //   return Popupmeal(
  //     child: Row(
  //       children: [
  //         Icon(
  //           filertIcon.icon,
  //           color: Colors.grey,
  //         ),
  //         const Spacer(),
  //         Text(filertIcon.label),
  //       ],
  //     ),
  //   );
  // }

  Widget buildList(meals) {
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
