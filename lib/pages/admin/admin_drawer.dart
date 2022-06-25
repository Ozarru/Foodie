// ignore_for_file: prefer_const_constructors

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../controllers/google_auth.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Image.asset('assets/branding/logo.png', height: 100),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              color: Colors.grey[100],
              // child: Userbadge()
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  DrawerTile(
                    label: 'Home',
                    icon: TablerIcons.home_2,
                    route: '/menu',
                  ),
                  DrawerTile(
                    label: 'Orders',
                    icon: TablerIcons.receipt,
                    route: '/orders',
                  ),
                  DrawerTile(
                    label: 'Dashboard',
                    icon: Icons.dashboard,
                    route: '/dasboard',
                  ),
                  DrawerTile(
                    label: 'Messages',
                    icon: TablerIcons.message_circle,
                    route: '/messages',
                  ),
                  DrawerTile(
                    label: 'Restaurant profile',
                    icon: Icons.store,
                    route: '/restaurant',
                  ),
                  DrawerTile(
                    label: 'Settings',
                    icon: TablerIcons.settings,
                    route: '/settings',
                  ),
                  DrawerTile(
                    label: 'Help & Support',
                    icon: TablerIcons.help,
                    route: '/help',
                  ),
                  Divider(color: Colors.grey),
                  DrawerTile(
                    label: 'Use as client',
                    icon: Icons.person,
                    route: '/client-base',
                  ),
                  DrawerTile(
                    label: 'Use as courier',
                    icon: Icons.delivery_dining,
                    route: '/courier-base',
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 8.0, horizontal: 16),
                  //   child: TextButton.icon(
                  //     onPressed: () {
                  //       debugPrint('Login out now.');
                  //       final provider = Provider.of<GoogleSignInProvider>(
                  //           context,
                  //           listen: false);
                  //       provider.logout();
                  //     },
                  //     icon: Icon(TablerIcons.logout),
                  //     label: Text('Logout'),
                  //     style: TextButton.styleFrom(
                  //         padding: EdgeInsets.all(16),
                  //         primary: Colors.white,
                  //         backgroundColor: Theme.of(context).primaryColor),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  DrawerTile({
    Key? key,
    required this.label,
    required this.icon,
    required this.route,
  }) : super(key: key);
  final String label;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black45),
      title: Text(
        label,
        style: TextStyle(fontSize: 15),
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, route);
      },
    );
  }
}

// class Userbadge extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;
//     return user.isAnonymous
//         ? ListTile(
//             leading: Icon(
//               TablerIcons.user,
//               size: 24,
//             ),
//             title: Text(
//               'Anonymous',
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//             subtitle: Text(
//               'Sign in to get the most out of our app',
//               style: Theme.of(context).textTheme.bodyText2,
//             ),
//             trailing: IconButton(
//               onPressed: () => Get.to(SignUp()),
//               icon: Icon(TablerIcons.login),
//             ),
//           )
//         : ListTile(
//             leading: CircleAvatar(
//               radius: 30,
//               backgroundImage: NetworkImage(user.photoURL!),
//             ),
//             title: Text(
//               user.displayName!,
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//             subtitle: Text(
//               'Welcome',
//               style: Theme.of(context).textTheme.bodyText2,
//             ),
//           );
//   }
// }
