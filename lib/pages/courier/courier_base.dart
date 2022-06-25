import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import '/widgets/widgets.dart';
import '/pages/pages.dart';
import 'courier_activity.dart';
import 'courier_drawer.dart';

class CourierBase extends StatefulWidget {
  const CourierBase({Key? key}) : super(key: key);

  @override
  _CourierBaseState createState() => _CourierBaseState();
}

class _CourierBaseState extends State<CourierBase> {
  int _index = 0;
  final _screens = [
    const CourierHome(),
    const CourierActivity(),
    const Messages(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CourierDrawer(),
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
            icon: const Icon(Icons.delivery_dining),
            title: const Text('Orders'),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(TablerIcons.activity),
            title: const Text('Activity'),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(TablerIcons.message_circle),
            title: const Text('Messages'),
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
    );
  }
}
