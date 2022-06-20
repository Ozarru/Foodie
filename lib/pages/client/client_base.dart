import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';

import '/widgets/widgets.dart';
import '/pages/pages.dart';
import 'client_drawer.dart';

class ClientBase extends StatefulWidget {
  const ClientBase({Key? key}) : super(key: key);

  @override
  _ClientBaseState createState() => _ClientBaseState();
}

class _ClientBaseState extends State<ClientBase> {
  bool isClient = true;
  int _index = 0;
  final _screens = [ClientHome(), Eatries(), Menu(), Settings()];
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
      //       IconButton(onPressed: () {}, icon: Icon(TablerIcons.bell))
      //     ]),
      drawer: ClientDrawer(),
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
            icon: Icon(TablerIcons.home_2),
            title: Text('Home'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(TablerIcons.search),
            title: Text('Find'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(TablerIcons.user),
            title: Text('Profile'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(TablerIcons.settings),
            title: Text('Settings'),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/new-hire'),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(TablerIcons.plus),
      ),
    );
  }
}
