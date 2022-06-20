import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class EatryDetails extends StatelessWidget {
  const EatryDetails({Key? key, required this.eatry}) : super(key: key);

  final Eatry eatry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(eatry.name),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              // color: Colors.black,
            )),
      ),
      body: Container(
        child: buildDetails(eatry),
      ),
    );
  }

  Widget buildDetails(eatry) {
    return Center(
      child: Text(eatry.name),
    );
  }
}
