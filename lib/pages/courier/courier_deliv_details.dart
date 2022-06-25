import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class DeliveryDetails extends StatelessWidget {
  const DeliveryDetails({Key? key, required this.delivery}) : super(key: key);

  final TestDelivery delivery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(delivery.eatry),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              // color: Colors.black,
            )),
      ),
      body: Container(
        child: buildDetails(delivery),
      ),
    );
  }

  Widget buildDetails(delivery) {
    return Center(
      child: Text(
          'Delivring ${delivery.items} from ${delivery.eatry} to ${delivery.client}'),
    );
  }
}
