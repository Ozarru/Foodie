import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../controllers/controllers.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Spacer(),
            Image(
              image: AssetImage('assets/branding/logo.png'),
              width: 200,
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hi There 😊! \nWelcome To Foodie',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Login to continue.'),
            ),
            Spacer(),
            Center(
                child: ElevatedButton.icon(
                    onPressed: () {
                      print('pressed it was, and impresed i am 🙂');
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.googleLogin();
                      print('Logged in, you are! ');
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.amber[900],
                    ),
                    label: Text('Continue with Google'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[200],
                      onPrimary: Colors.black,
                      minimumSize: Size(double.infinity, 50),
                    ))),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
