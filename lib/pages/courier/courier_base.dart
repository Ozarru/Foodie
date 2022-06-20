import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodie/pages/admin/eatry_admin/deliveries.dart';
import 'package:foodie/pages/courier/courier_drawer.dart';
import 'package:tabler_icons/tabler_icons.dart';
import '/widgets/widgets.dart';
import '/pages/pages.dart';
import 'courier_activity.dart';

class CourierBase extends StatefulWidget {
  const CourierBase({Key? key}) : super(key: key);

  @override
  _CourierBaseState createState() => _CourierBaseState();
}

class _CourierBaseState extends State<CourierBase> {
  int _index = 0;
  final _screens = [
    // CourierHome(),
    const CourierActivity(),
    const Deliveries(),
    const Notifications(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     elevation: 0,
      //     backgroundColor: Colors.transparent,
      //     iconTheme: IconThemeData(
      //       color: Colors.black,
      //     ),
      //     actions: [
      //       // searcher(),
      //       IconButton(
      //           onPressed: () {},
      //           icon: Icon(
      //             TablerIcons.bell,
      //             color: Colors.grey,
      //           ))
      //     ]),
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
            icon: const Icon(TablerIcons.clipboard_list),
            title: const Text('Jobs'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.work_outline_rounded),
            title: const Text('Contracts'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(TablerIcons.message_2),
            title: const Text('Messages'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: const Icon(TablerIcons.chart_bar),
            title: const Text('Activity'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
