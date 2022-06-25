import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/pages.dart';
import '/widgets/widgets.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'dart:io';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key, required this.paymentMethod}) : super(key: key);

  final String paymentMethod;

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final CartController controller = Get.find();
  final order = TestOrder(
    eatry: "Akif",
    client: "Anita",
    eta: 20,
    address: "23 rue Gbossime",
    radius: 18,
    items: ['burger', 'French fries'],
    startLat: 6.13305134879669,
    startLng: 1.2353881547484222,
    stopLat: 6.180655259130151,
    stopLng: 1.1952999547485093,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ClientAppBar(title: 'Checkout'),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: ListView(children: [
            buildInvoiceItems(),
            const SizedBox(
              height: 20,
            ),
            buildPayment(),
            const SizedBox(
              height: 20,
            ),
            buildCheckoutBtn(order),
          ]),
        ));
  }

  Widget buildInvoiceItems() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 400, minHeight: 300),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.meals.length,
          itemBuilder: (BuildContext context, int index) {
            return MealLine(
              controller: controller,
              meal: controller.meals.keys.toList()[index],
              quantity: controller.meals.values.toList()[index],
              index: index,
            );
          }),
    );
  }

  Widget buildPayment() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Means of payment',
                  style: Theme.of(context).textTheme.bodyText1),
              Text(widget.paymentMethod,
                  style: Theme.of(context).textTheme.headline3),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Number of meals',
                  style: Theme.of(context).textTheme.bodyText1),
              Text('${controller.itemCount} ',
                  style: Theme.of(context).textTheme.headline4),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total price', style: Theme.of(context).textTheme.bodyText1),
              Text('${controller.total}  XOF',
                  style: Theme.of(context).textTheme.headline3),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCheckoutBtn(order) {
    return ElevatedButton.icon(
        onPressed: () {
          debugPrint("Checkout complete");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientOrderDetails(order: order)));
        },
        icon: const Icon(
          TablerIcons.receipt_2,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text('Pay & Track Delivery'),
        ));
  }
}

class MealLine extends StatelessWidget {
  const MealLine(
      {Key? key,
      required this.controller,
      required this.meal,
      required this.quantity,
      required this.index})
      : super(key: key);
  final CartController controller;
  final TestMeal meal;
  final int quantity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: const Icon(
          Icons.food_bank_rounded,
          size: 40,
        ),
        title: Text(meal.name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline5),
        subtitle: Text('${meal.price} XOF',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey)),
        trailing: Text('x $quantity',
            style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500)),
      ),
    );

    // Container(
    //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    //   margin: const EdgeInsets.only(bottom: 4),
    //   decoration: BoxDecoration(
    //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
    //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //     Expanded(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           FittedBox(
    //               fit: BoxFit.fitWidth,
    //               child: Text(meal.name,
    //                   overflow: TextOverflow.ellipsis,
    //                   style: Theme.of(context).textTheme.headline5)),
    //           Text('${meal.price} XOF',
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .bodyMedium!
    //                   .copyWith(color: Colors.grey))
    //         ],
    //       ),
    //     ),
    //     Text('x $quantity',
    //         style: const TextStyle(
    //             fontSize: 14,
    //             color: Colors.black87,
    //             fontWeight: FontWeight.w500))
    //   ]),
    // );
  }
}
