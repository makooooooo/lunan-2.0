import 'package:flutter/material.dart';

class chatT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff7DB9B6),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              'Inbox',
              style: TextStyle(
                color: Color(0xffF5E9CF),
                fontSize: 30,
              ),
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
              },
              color:const Color(0xffF5E9CF), // Set the icon color
            ),
          ],
        ),
      ),

      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start, // Align at the top
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: CircleAvatar(
              radius: 30,
              // You can set the profile picture here
              backgroundImage: AssetImage('assets/Lexi.png'),
            ),
            title: Text(
              'Lexi Lore',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              'Hey, come over',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              '2:30 PM', // You can set the message time here
              style: TextStyle(fontSize: 14),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: CircleAvatar(
              radius: 30,
              // You can set the profile picture here
              backgroundImage: AssetImage('assets/Lana.png'),
            ),
            title: Text(
              'Lana Rhoades',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              'Hello, are you free tonight?',
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              '7:00 PM', // You can set the message time here
              style: TextStyle(fontSize: 14),
            ),
          ), // Add more ListTile widgets if needed for other messages
        ],
      ),
    );
  }
}
