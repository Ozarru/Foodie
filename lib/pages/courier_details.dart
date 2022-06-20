import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class CourierDetails extends StatelessWidget {
  const CourierDetails({Key? key, required this.courier}) : super(key: key);

  final Courier courier;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(courier.fullname),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              // color: Colors.black,
            )),
      ),
      body: Container(
        child: buildDetails(Courier),
      ),
    );
  }

  Widget buildDetails(courier) {
    return Center(
      child: Text(courier.fullname),
    );
  }
}
