import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '/utils/utils.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';
import '/pages/pages.dart';

class Deliveries extends StatefulWidget {
  const Deliveries({Key? key}) : super(key: key);

  @override
  _Deliveriestate createState() => _Deliveriestate();
}

class _Deliveriestate extends State<Deliveries> {
  String query = '';
  bool isLoading = true;
  List<Delivery> deliveries = localDeliveries;

// search functonality
  void searchDataset(String query) {
    query = query.toLowerCase();
    final deliveries = localDeliveries.where((delivery) {
      final deliveryName = delivery.eatry.toLowerCase();
      final deliveryAddress = delivery.address.toLowerCase();
      final deliveryEta = delivery.eta.toString();
      final input = query;

      return deliveryName.contains(input) ||
          deliveryAddress.contains(input) ||
          deliveryEta.contains(input);
    }).toList();

    setState(() {
      this.deliveries = deliveries;
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
            Expanded(child: buildList(deliveries))
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
              hint: 'Find a gig...',
              onChanged: searchDataset,
            )),
            // PopupMenuButton<MenuItem>(
            //   icon: const Icon(
            //     TablerIcons.filter,
            //     color: Colors.grey,
            //   ),
            //   itemBuilder: (context) =>
            //       [...deliveryFilter.filertIcons.map(buildItem).toList()],
            // )
          ],
        ),
      ),
    );
  }

  // PopupMenuItem<MenuItem> buildItem(FilterIcon filertIcon) {
  //   return PopupMenuItem(
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

  Widget buildList(deliveries) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: deliveries.length,
        itemBuilder: (context, index) {
          final delivery = deliveries[index];
          // print(delivery);
          return DeliveryTile(
            eatry: delivery.eatry,
            client: delivery.client,
            address: delivery.address,
            eta: delivery.eta,
            items: delivery.items,
            // phone: delivery.phone,
          );
        });
  }
}
