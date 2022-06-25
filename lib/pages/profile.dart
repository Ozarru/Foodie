// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/preferences.dart';
import '../widgets/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 10),
            ProfileWidget(
              isEdit: false,
              imagePath: user.imagePath,
              onClicked: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
            ),
            buildName(user),
            buildBio(user),
            buildPortfolio(user)
          ],
        ),
      ),
    );
  }

  Widget buildName(UserProfile user) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.email,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.phone,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black87),
            ),
          ],
        ),
      );

  Widget buildBio(UserProfile user) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About me',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              user.about,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.grey[600]),
            ),
          ],
        ),
      );

  Widget buildPortfolio(UserProfile user) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Portfolio',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PortfolioTile(
                    text1: 'Deliveries', text2: 'Ordered', figures: '20'),
                const SizedBox(
                  height: 16,
                ),
                PortfolioTile(
                    text1: 'Deliveries', text2: 'Completed', figures: '15'),
                const SizedBox(
                  height: 16,
                ),
                PortfolioTile(
                    text1: 'Deliveries', text2: 'Cancelled', figures: '5'),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(Colors.grey.shade200),
                backgroundColor: MaterialStateProperty.all(Colors.black87),
              ),
              icon: Text(
                'Edit profile',
                style: TextStyle(fontSize: 18),
              ),
              label: Icon(Icons.edit),
            ),
          ],
        ),
      );
}

// Edit profile view

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserProfile user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:  buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            isEdit: true,
            onClicked: () async {},
          ),
          const SizedBox(
            height: 18,
          ),
          TextEditField(
            label: 'Full name',
            text: user.name,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 18,
          ),
          TextEditField(
            label: 'Email',
            text: user.email,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 18,
          ),
          TextEditField(
            label: 'Phone number',
            text: user.phone,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 18,
          ),
          TextEditField(
            maxLines: 5,
            label: 'About me',
            text: user.about,
            onChanged: (name) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(Colors.grey.shade200),
                backgroundColor: MaterialStateProperty.all(Colors.black87),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Save changes',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
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
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Colors.black54),
          ),
          Text(
            text2,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black54),
          ),
          Text(
            figures,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
