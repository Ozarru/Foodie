import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';
import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({Key? key, required this.meal}) : super(key: key);

  final TestMeal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClientAppBar(title: meal.name),
      body: Column(
        children: [
          Image.asset(meal.image!),
          Expanded(
            child: buildDetails(context, meal),
          ),
        ],
      ),
    );
  }

  Widget buildDetails(context, meal) {
    final cartController = Get.put(CartController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 20),
          Text('Eatry name ~ ${meal.name}',
              style: Theme.of(context).textTheme.headline2),
          Text('240 g',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.grey)),
          Text('${meal.price} XOF',
              style: Theme.of(context).textTheme.headline3),
          SizedBox(height: 10),
          Row(
            children: [
              FoodInfoTile(
                // icon: TablerIcons.meat,
                icon: FontAwesomeIcons.leaf,
                iconcolor: Colors.green,
                label: 'Vegan',
              ),
              FoodInfoTile(
                icon: FontAwesomeIcons.hotjar,
                iconcolor: Colors.deepOrangeAccent,
                label: 'Few Calories',
              ),
              IconButton(
                  tooltip: 'Add to cart',
                  highlightColor: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    cartController.addMeal(meal);
                  },
                  icon: const Icon(TablerIcons.shopping_cart_plus)),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          Text('Nutritional value of meal',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.grey)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              FoodNumTile(
                figure: 198,
                label: 'kcal',
              ),
              FoodNumTile(
                figure: 13.1,
                label: 'Proteins',
              ),
              FoodNumTile(
                figure: 13.4,
                label: 'Fats',
              ),
              FoodNumTile(
                figure: 5.8,
                label: 'Carbohydrates',
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(height: 10),
          Text('Ingredients', style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 10),
          Text(
            """Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
          Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
          when an unknown printer took a galley of type and scrambled it to make a type specimen book. """,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
