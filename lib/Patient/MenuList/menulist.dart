import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Patient/ProfileSetting/profile.dart';
import 'package:lunan/Patient/SignIn/log_in.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          constraints: const BoxConstraints(
            minHeight: 100, // Set the minimum height
            maxHeight: 130, // Set the maximum height
          ),
          child: const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff7DB9B6),
            ),
            child: Text(
              'John Doe',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Color(0xff7DB9B6),
          ),
          title: const Text('Home'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Color(0xff7DB9B6),
          ),
          title: const Text('Profile'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileSetting()),
            );
          },
        ),

        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Color(0xff7DB9B6),
          ),
          title: const Text('Log out'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        // Add more list items as needed
      ],
    );
  }
}
