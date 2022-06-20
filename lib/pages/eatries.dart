import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../utils/filter_icons.dart';
import '../utils/utils.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import 'eatry_details.dart';

class Eatries extends StatefulWidget {
  const Eatries({Key? key}) : super(key: key);

  @override
  _Eatriestate createState() => _Eatriestate();
}

class _Eatriestate extends State<Eatries> {
  String query = '';
  bool isLoading = true;
  List<Eatry> eatries = localEatries;

// search functonality
  void searchDataset(String query) {
    query = query.toLowerCase();
    final eatries = localEatries.where((eatry) {
      final eatryName = eatry.name.toLowerCase();
      final eatryaddress = eatry.address.toString();
      final input = query;

      return eatryName.contains(input) || eatryaddress.contains(input);
    }).toList();

    setState(() {
      this.eatries = eatries;
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
            Expanded(child: buildList(eatries))
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
              hint: 'Find an eatry...',
              onChanged: searchDataset,
            )),
            PopupMenuButton<MenuItem>(
              icon: const Icon(
                TablerIcons.filter,
                color: Colors.grey,
              ),
              itemBuilder: (context) =>
                  [...EatryFilter.filertIcons.map(buildItem).toList()],
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

  Widget buildList(eatries) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: eatries.length,
        itemBuilder: (context, index) {
          final eatry = eatries[index];
          // print(eatry);
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EatryDetails(eatry: eatry))),
            child: EatryTile(
              // image: eatry.image,
              name: eatry.name,
              email: eatry.email,
              address: eatry.address,
              phone: eatry.phone,
              isVerified: eatry.isVerified,
              isPromoted: eatry.isPromoted,
              // hands: eatries[index]['hands'],
            ),
          );
        });
  }
}
