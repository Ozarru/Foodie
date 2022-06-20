import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../utils/utils.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import '/pages/pages.dart';

class Couriers extends StatefulWidget {
  const Couriers({Key? key}) : super(key: key);

  @override
  _Courierstate createState() => _Courierstate();
}

class _Courierstate extends State<Couriers> {
  String query = '';
  bool isLoading = true;
  List<Courier> couriers = localCouriers;

// search functonality
  void searchDataset(String query) {
    query = query.toLowerCase();
    final couriers = localCouriers.where((couier) {
      final couierName = couier.fullname.toLowerCase();
      final couieraddress = couier.address.toString();
      final input = query;

      return couierName.contains(input) || couieraddress.contains(input);
    }).toList();

    setState(() {
      this.couriers = couriers;
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
            Expanded(child: buildList(couriers))
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
              hint: 'Find an courier...',
              onChanged: searchDataset,
            )),
            // PopupMenuButton<MenuItem>(
            //   icon: const Icon(
            //     TablerIcons.filter,
            //     color: Colors.grey,
            //   ),
            //   itemBuilder: (context) =>
            //       [...CourierFilter.filertIcons.map(buildItem).toList()],
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

  Widget buildList(couriers) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: couriers.length,
        itemBuilder: (context, index) {
          final courier = couriers[index];
          // print(couier);
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CourierDetails(courier: courier))),
            child: CourierTile(
              fullname: courier.fullname,
              deliveries: courier.deliveries,
              address: courier.address,
              // phone: couier.phone,
            ),
          );
        });
  }
}
