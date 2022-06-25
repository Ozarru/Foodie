import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart';
import '/controllers/controllers.dart';
import '/pages/pages.dart';
import 'package:tabler_icons/tabler_icons.dart';
import '/models/models.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController cartCtrl = Get.find();
  late ScrollController scrollCtrl;

  @override
  void initState() {
    super.initState();
    scrollCtrl = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ClientAppBar(title: 'Cart'),
      body: Obx(() => Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: cartCtrl.meals.length == 0
              ? Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          TablerIcons.shopping_cart,
                          color: Colors.white,
                        ),
                        Text(
                          'No items in the cart',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                )
              : buildMealList())),
    );
  }

  Widget buildMealList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text('Cart items',
                style: Theme.of(context).textTheme.headline3),
          ),
          Expanded(
            // constraints: BoxConstraints(maxHeight: 500),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollCtrl,
                itemCount: cartCtrl.meals.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartMealCard(
                    cartCtrl: cartCtrl,
                    meal: cartCtrl.meals.keys.toList()[index],
                    quantity: cartCtrl.meals.values.toList()[index],
                    index: index,
                  );
                }),
          ),
          Container(
              constraints: const BoxConstraints(maxHeight: 100),
              child: SumBox()),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

class CartMealCard extends StatelessWidget {
  const CartMealCard(
      {Key? key,
      required this.cartCtrl,
      required this.meal,
      required this.quantity,
      required this.index})
      : super(key: key);
  final CartController cartCtrl;
  final TestMeal meal;
  final int quantity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                    image: AssetImage(meal.image ?? 'assets/branding/grey.jpg'),
                    fit: BoxFit.cover))),
        const Spacer(flex: 1),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(meal.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4!)),
              SizedBox(height: 8),
              Text('${meal.price} XOF',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey))
            ],
          ),
        ),
        const Spacer(flex: 1),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  cartCtrl.removeMeal(meal);
                },
                icon: Icon(
                  Icons.remove_circle,
                  size: 20,
                  color: Theme.of(context).colorScheme.tertiary,
                )),
            Text('$quantity'),
            IconButton(
                onPressed: () {
                  cartCtrl.addMeal(meal);
                },
                icon: Icon(
                  Icons.add_circle,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondary,
                )),
          ],
        ),
      ]),
    );
  }
}

class SumBox extends StatelessWidget {
  SumBox({Key? key}) : super(key: key);

  final CartController cartCtrl = Get.find();
  final List<String> paymentMethods = ['cash', 'card'];
  @override
  Widget build(BuildContext context) {
    dynamic carItems = cartCtrl.meals;
    if (carItems.length != 0) {
      return Obx(
        () => SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: Theme.of(context).textTheme.headline6),
                  Text('${cartCtrl.total} XOF',
                      style: Theme.of(context).textTheme.headline3),
                ],
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton.icon(
                        onPressed: () {
                          cartCtrl.clearCart(carItems);
                        },
                        icon: const Text('Clear'),
                        label: const Icon(
                          Icons.backspace_sharp,
                          size: 14,
                        ),
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            primary: Theme.of(context).colorScheme.tertiary)),
                  ),
                  const SizedBox(width: 20),
                  Expanded(flex: 2, child: buildCheckout(context)),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildCheckout(context) {
    return ElevatedButton.icon(
        onPressed: () {
          showModalBottomSheet(
              // backgroundColor: Colors.grey[200],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              context: context,
              builder: (builder) {
                return SizedBox(
                    width: 400,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      ListTile(
                        leading: const Icon(TablerIcons.coin),
                        title: const Text('Cash Pay'),
                        onTap: () {
                          Navigator.of(context).pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Checkout(paymentMethod: paymentMethods[0])));
                        },
                      ),
                      ListTile(
                        leading: const Icon(TablerIcons.credit_card),
                        title: const Text('Card Pay'),
                        onTap: () {
                          Navigator.of(context).pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Checkout(paymentMethod: paymentMethods[1])));
                        },
                      ),
                    ]));
              });
        },
        icon: const Icon(
          TablerIcons.coin,
          // size: 14,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text('Checkout'),
        ));
  }
}
