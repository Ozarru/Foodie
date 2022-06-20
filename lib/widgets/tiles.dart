import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';

class IntroTile extends StatelessWidget {
  const IntroTile(
      {required this.image, required this.name, Key? key, required this.route})
      : super(key: key);

  final String image;
  final String name;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        margin: const EdgeInsets.only(left: 12),
        width: 160,
        child: GestureDetector(
          onTap: () => Get.toNamed(route),
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            color: Colors.white,
            shadowColor: Colors.grey[300],
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.contain))),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile(
      {required this.image, required this.name, required this.price, Key? key})
      : super(key: key);

  final String image;
  final String name;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        margin: const EdgeInsets.only(left: 12),
        width: 200,
        child: InkWell(
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            color: Colors.white,
            shadowColor: Colors.grey[300],
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.cover))),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900],
                            fontSize: 14),
                      ),
                      Text(
                        "$price",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class EatryTile extends StatelessWidget {
  const EatryTile({
    Key? key,
    this.image,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    // this.rating,
    this.payvet = false,
    this.isVerified = false,
    this.isPromoted = false,
  }) : super(key: key);

  final String? image;
  final String name;
  final String email;
  final String address;
  final String phone;
  // final num? rating;
  final bool payvet;
  final bool? isPromoted;
  final bool? isVerified;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        margin: const EdgeInsets.only(left: 12),
        width: 135,
        child: InkWell(
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            color: Colors.white,
            shadowColor: Colors.grey[300],
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                            image: AssetImage('assets/static/eatry.webp'),
                            fit: BoxFit.cover))),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 28, 54),
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CourierTile extends StatelessWidget {
  const CourierTile({
    Key? key,
    required this.fullname,
    required this.deliveries,
    required this.address,
  }) : super(key: key);

  // final String? image;
  final String fullname;
  final String address;
  final int deliveries;

  @override
  Widget build(BuildContext context) => ListTile(
        // tileColor: Colors.white,
        leading: const Icon(
          Icons.delivery_dining,
          size: 48,
          color: Colors.grey,
        ),
        // leading: CircleAvatar(
        //   backgroundImage: AssetImage(image!),
        //   radius: 30,
        // ),
        title: Text(fullname, style: Theme.of(context).textTheme.headline2),
        // subtitle: Text('$eta minutes from you'),
        trailing:
            Text('$deliveries', style: Theme.of(context).textTheme.bodyText1),
      );
}

class DeliveryTile extends StatelessWidget {
  const DeliveryTile({
    Key? key,
    this.id,
    this.price,
    this.eta = 0,
    this.payvet = false,
    required this.eatry,
    required this.client,
    required this.address,
    required this.items,
  }) : super(key: key);

  final String eatry;
  final String client;
  final String address;
  final List<String> items;
  final int? eta;
  final int? price;
  final int? id;
  final bool payvet;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  eatry,
                  style: const TextStyle(
                      // color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(TablerIcons.thumb_down),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(TablerIcons.heart),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Budget'),
                    Text('\$$price',
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('ETA'),
                    Text('${eta}_minutes ',
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            payvet == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.credit_card_off, color: Colors.black38),
                          Text('Payment unverified'),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Go',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              TablerIcons.arrow_right,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.verified,
                              color: Colors.blue,
                            ),
                            Text(
                              'Payment verified',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Go',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                TablerIcons.arrow_right,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ])
          ],
        ),
      );
}

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    Key? key,
    this.image,
    required this.name,
    required this.category,
    this.route,
    this.hands = 0,
  }) : super(key: key);

  final String? image;
  final String name;
  final String category;
  final String? route;
  final num? hands;

  @override
  Widget build(BuildContext context) => ListTile(
        tileColor: Colors.white,
        leading: CircleAvatar(
          backgroundImage: AssetImage(image!),
          radius: 30,
        ),
        title: Text('$name', style: Theme.of(context).textTheme.headline2),
        // subtitle: Text('$eta minutes from you'),
        subtitle: Text('$category'),
        trailing:
            Text('$hands hands', style: Theme.of(context).textTheme.bodyText2),
      );
}

class ContractTile extends StatelessWidget {
  const ContractTile({
    Key? key,
    required this.title,
    required this.client,
    required this.place,
    this.rate = 0,
    this.daysAgo,
    this.budget,
  }) : super(key: key);

  final String title;
  final String client;
  final String place;
  final num? rate;
  final num? budget;
  final num? daysAgo;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  title,
                  style: const TextStyle(
                      // color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        TablerIcons.circle_check,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(TablerIcons.heart),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Budget'),
                    Text('\$$budget',
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('days ago'),
                    Text('$daysAgo',
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}

class FeaturedTile extends StatelessWidget {
  const FeaturedTile({required this.image, required this.name, Key? key})
      : super(key: key);

  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        margin: const EdgeInsets.only(left: 12),
        width: 135,
        child: InkWell(
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            color: Colors.white,
            shadowColor: Colors.grey[300],
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.cover))),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 41, 14),
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class RateIt extends StatelessWidget {
  const RateIt({Key? key, required this.rating, required this.votes})
      : super(key: key);

  final double rating;
  final int votes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 16,
          ),
          Text(
            '$rating',
            style: TextStyle(
                color: Colors.cyan.shade600,
                // color: Color(0xff00ADFF),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          Text(
            '($votes)',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w300,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.image,
    required this.fullname,
  }) : super(key: key);
  final String image;
  final String fullname;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          padding: const EdgeInsets.all(4),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white38, borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Icon(
            Icons.account_circle,
            color: Colors.grey.shade200,
            size: 36,
          ))),
      title: Text(
        fullname,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
      ),
      subtitle: const Text(
        'Welcome to Dxter!',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          )),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {Key? key, required this.title, required this.icon, required this.route})
      : super(key: key);

  final String title;
  final IconData icon;
  final String route;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, route),
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 22,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey.shade700,
        size: 12,
      ),
    );
  }
}

class CatTile extends StatelessWidget {
  const CatTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.route,
      required this.subtitle})
      : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;
  final String route;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, route),
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 36,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey.shade700,
        size: 12,
      ),
    );
  }
}

class PortfolioTile extends StatelessWidget {
  const PortfolioTile(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.figures})
      : super(key: key);
  final String text1;
  final String text2;
  final String figures;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(16),
      width: 90,
      height: 90,
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: Colors.black54),
          ),
          Text(
            text2,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black54),
          ),
          Text(
            figures,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
