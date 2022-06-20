import '/widgets/tiles.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            // height: 500,
            color: Colors.white,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage('assets/dex.jpg'), fit: BoxFit.cover),
            // ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.2,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Image(
                  image: AssetImage('assets/branding/logo.png'),
                  height: 60,
                ),
                Text(
                  'Food delivery that actually works',
                  style: TextStyle(
                      // color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  'anytime, anyday.',
                  style: TextStyle(
                      // color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 70,
            left: 0,
            child: Wrap(
              spacing: 20,
              runSpacing: 10,
              children: const [
                IntroTile(
                    image: 'assets/static/client.webp',
                    name: 'Client',
                    route: '/client-base'),
                IntroTile(
                    image: 'assets/static/courier.webp',
                    name: 'Courrier',
                    route: '/courier-base'),
                IntroTile(
                    image: 'assets/static/admin.webp',
                    name: 'Eatry Admin',
                    route: '/admin-base'),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 20.0),
              color: Colors.green.shade900,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'Log-in',
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/client-base');
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
