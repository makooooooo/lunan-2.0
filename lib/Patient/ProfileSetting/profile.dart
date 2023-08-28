import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Patient/HomePage/landing_page.dart';
import 'package:lunan/Patient/ProfileSetting/edit_profile.dart';
import 'package:lunan/Patient/SignIn/log_in.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Handle back button press
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LandingPage()),
          );
          return false; // Return false to prevent default back behavior
        },
        child: Scaffold(
          backgroundColor: const Color(0xffF5E9CF), // Set the background color
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xffF5E9CF),
            iconTheme: const IconThemeData(color: Color(0xff4D455D)),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), // Back button icon
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                );
              },
            ),
          ),
          body: SingleChildScrollView(
              child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: const Text(
                    "I'm \n John Doe",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 40,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: const Text(
                    "Mood : 😥",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(
                      30, 40, 30, 0), // Add horizontal margin
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the value as needed
                        side: const BorderSide(
                          color: Color(0xff4D455D), // Outline color
                          width: 2.0, // Increase the border width
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.edit, // Replace with the desired icon
                          color: Color(0xff4D455D), // Icon color
                        ),
                        SizedBox(width: 5), // Spacer between icon and text
                        Text(
                          'Edit Profile',
                          style:
                              TextStyle(color: Color(0xff4D455D)), // Text color
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(
                      30, 10, 30, 0), // Add horizontal margin
                  child: ElevatedButton(
                    onPressed: () {
                      _showLogoutModal(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the value as needed
                        side: const BorderSide(
                          color: Color(0xff4D455D), // Outline color
                          width: 2.0, // Increase the border width
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.logout, // Replace with the desired icon
                          color: Color(0xff4D455D), // Icon color
                        ),
                        SizedBox(width: 5), // Spacer between icon and text
                        Text(
                          'Logout',
                          style:
                              TextStyle(color: Color(0xff4D455D)), // Text color
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        ));
  }
}


void _showLogoutModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
            
               Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}

