import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabler_icons/tabler_icons.dart';
import '../../utils/utils.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import 'admin_drawer.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _Orderstate createState() => _Orderstate();
}

class _Orderstate extends State<Orders> {
  String query = '';
  bool isLoading = true;
  List<TestOrder> orders = localOrders;

// search functonality
  void searchDataset(String query) {
    query = query.toLowerCase();
    final orders = localOrders.where((order) {
      final orderEatry = order.eatry.toLowerCase();
      final orderClient = order.client.toLowerCase();
      final orderAddress = order.address.toLowerCase();
      final orderId = order.id.toString();
      final input = query;

      return orderEatry.contains(input) ||
          orderClient.contains(input) ||
          orderAddress.contains(input) ||
          orderId.contains(input);
    }).toList();

    setState(() {
      this.orders = orders;
      this.query = query;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CourierAppBar(title: 'Orders'),
      drawer: const AdminDrawer(),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: buildPaginatedSearch(),
            ),
            Expanded(child: buildList(orders))
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
                child: AppSearchField(
              hint: 'Find an order...',
              onChanged: searchDataset,
            )),
            PopupMenuButton<MenuItem>(
              icon: const Icon(
                TablerIcons.filter,
                color: Colors.grey,
              ),
              itemBuilder: (context) =>
                  [...OrderFilter.filertIcons.map(buildItem).toList()],
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

  Widget buildList(orders) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          // print(order);
          return GestureDetector(
            // onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => OrderDetails(order: order))),
            child: OrderListTile(
              eatry: order.eatry,
              client: order.client,
              address: order.address,
              items: order.items,
            ),
          );
        });
  }
}
