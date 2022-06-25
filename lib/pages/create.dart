import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '/models/meal_type.dart';

import '../widgets/widgets.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final name_controller = TextEditingController();
  final desc_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fusée Create Page')),
      drawer: const AppDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Create Types of Food',
                  style: Theme.of(context).textTheme.headline2!),
              const SizedBox(height: 60),
              AppTextField(
                title: 'Name',
                hint: 'Name of the type of meal',
                controller: name_controller,
              ),
              const SizedBox(height: 20),
              AppTextField(
                title: 'Description',
                hint: 'Description of typpe of meal',
                controller: desc_controller,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Add Meal Type'),
                onPressed: () {
                  final mealType = MealType(
                    name: name_controller.text,
                    description: desc_controller.text,
                  );

                  createMealType(mealType);

                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future createMealType(MealType mealType) async {
    final docMealType =
        FirebaseFirestore.instance.collection('meal_types').doc();
    mealType.id = docMealType.id;
    final json = mealType.toJson();
    await docMealType.set(json);
  }
}
