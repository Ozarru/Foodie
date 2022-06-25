// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../widgets/widgets.dart';
import '../models/models.dart';

class RUD extends StatefulWidget {
  const RUD({super.key});

  @override
  State<RUD> createState() => _RUDState();
}

class _RUDState extends State<RUD> {
  final name_controller = TextEditingController();
  final desc_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fusée RUD Page')),
      drawer: const AppDrawer(),
      body: StreamBuilder<List<MealType>>(
          stream: getMealTypes(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error 500! internal Server Error.'),
              );
            } else if (snapshot.hasData) {
              final mealtypes = snapshot.data!;
              return ListView(
                children: mealtypes.map(buildMealType).toList(),
              );
            } else {
              return const Center(
                // child: Text('Error 404! Not Found.'),
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
          }),
    );
  }

  Widget buildMealType(MealType mealType) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.food_bank)),
      title: Text(mealType.name.toUpperCase()),
      subtitle: Text(mealType.description ?? ''),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Want to update this?'),
                          content: SizedBox(
                            height: 140,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                  decoration:
                                      const InputDecoration(hintText: 'Name'),
                                  controller: name_controller,
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  decoration: const InputDecoration(
                                      hintText: 'Description'),
                                  controller: desc_controller,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            ElevatedButton(
                                onPressed: () {
                                  final new_mealType = MealType(
                                    name: name_controller.text,
                                    description: desc_controller.text,
                                  );

                                  updateMealType(new_mealType);

                                  const SnackBar(
                                    content: Text('Update successfull!'),
                                  );

                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Update',
                                ))
                          ],
                        );
                      });
                },
                icon: const Icon(TablerIcons.edit)),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Want to delete this?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            ElevatedButton(
                                onPressed: () {
                                  final docMealType = FirebaseFirestore.instance
                                      .collection('meal_types')
                                      .doc("${mealType.id}");

                                  docMealType.delete();
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Delete',
                                ))
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }

  Stream<List<MealType>> getMealTypes() => FirebaseFirestore.instance
      .collection('meal_types')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => MealType.fromJson(doc.data())).toList());

  Future updateMealType(MealType mealType) async {
    final docMealType =
        FirebaseFirestore.instance.collection('meal_types').doc(mealType.id);

    final json = mealType.toJson();
    await docMealType.update(json);
  }
}
