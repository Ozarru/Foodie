import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';

import '/widgets/widgets.dart';
import '/controllers/controllers.dart';
import '/pages/pages.dart';
import 'client_drawer.dart';

class ClientBase extends StatefulWidget {
  const ClientBase({Key? key}) : super(key: key);

  @override
  _ClientBaseState createState() => _ClientBaseState();
}

class _ClientBaseState extends State<ClientBase> {
  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => CartController());
  }

  bool isClient = true;
  int _index = 0;
  final _screens = const [ClientHome(), Eatries(), Menu(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ClientDrawer(),
      body: SafeArea(child: _screens[_index]),
      bottomNavigationBar: BottomNavyBar(
        showElevation: false,
        selectedIndex: _index,
        onItemSelected: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(TablerIcons.home_2),
            title: const Text('Home'),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(TablerIcons.search),
            title: const Text('Find'),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.restaurant),
            title: const Text('Meals'),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(TablerIcons.user),
            title: const Text('Profile'),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Get.toNamed('/new-order'),
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   child: const Icon(TablerIcons.plus),
      // ),
    );
  }
}
