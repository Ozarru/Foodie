import '/widgets/widgets.dart';
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

            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(flex: 3),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Image(
                      image: AssetImage('assets/branding/logo.png'),
                      height: 100,
                    ),
                  ),
                  // const SizedBox(height: 12),
                  const Spacer(flex: 1),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Food delivery that works...',
                      style: TextStyle(
                          // color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      '...anytime, anyday.',
                      style: TextStyle(
                          // color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Spacer(flex: 2),
                  SizedBox(
                    height: 160,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
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
                            image: 'assets/static/eatry.webp',
                            name: 'Restaurant',
                            route: '/eatry-base'),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
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
            ]),
          ),
        ],
      ),
    );
  }
}
