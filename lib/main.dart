import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'db/database.dart';
import 'pages/courier/courier_activity.dart';
import 'pages/courier/courier_deliveries.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';
import 'widgets/widgets.dart';

// MyDatabase? database;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp();
  // await Hive.initFlutter();
  // await Settings.init(cacheProvider: _customCacheProvider);
  runApp(const MyApp()
      // Provider<MyDatabase>(
      //   create: (context) => MyDatabase(),
      //   child: const MyApp(),
      //   dispose: (context, db) => db.close(),
      // ),
      );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodie',
        theme: customTheme(),
        initialRoute: '/',
        routes: {
          // auth routes--------------------------------------
          '/signup': (context) => const SignUp(),
          '/login': (context) => const Login(),
          // general routes-----------------------------------
          '/': (context) => const Intro(),
          '/eatries': (context) => const Eatries(),
          '/couriers': (context) => const Couriers(),
          '/menu': (context) => const Menu(),
          '/settings': (context) => const Settings(),
          '/notice': (context) => const Notifications(),
          // '/view-profile': (context) => Profile(),
          // '/edit-profile': (context) => EditProfile(),
          // client routes------------------------------------
          '/client-base': (context) => const ClientBase(),
          '/client-home': (context) => const ClientHome(),
          '/client-activity': (context) => const ClientActivity(),
          // courier routes-----------------------------------
          '/courier-base': (context) => const CourierBase(),
          '/courier-deliveries': (context) => const CourierDeliveries(),
          '/courier-ativity': (context) => const CourierActivity(),
          // restaurant-admin routes--------------------------
          '/deliveries': (context) => const Deliveries(),
          '/dashboard': (context) => const Dashboard(),
          '/sales': (context) => const Sales(),
          '/stats': (context) => const Stats(),
          // app superadmin routes----------------------------
          // '/superadmin-base': (context) => SuperadminBase(),
          // '/superadmin-home': (context) => SuperadminHome(),
          // '/superadmin-notice': (context) => SuperadminNotice(),
          // '/superadmin-board': (context) => SuperadminBoard(),
          // '/superadmin-settings': (context) => SuperadminSettings(),
        });
  }
}
