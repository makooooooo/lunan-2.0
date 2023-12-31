import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Patient/HomePage/landing_page.dart';
import 'package:lunan/Patient/ProfileSetting/edit_profile.dart';
import 'package:lunan/Patient/SignIn/log_in.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .where("UID", isEqualTo: userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final documents = snapshot.data!.docs;
          if (documents.isEmpty) {
            return Text('Therapist not found');
          }

          final firstName =
              documents[0].get('firstName') as String? ?? 'Unknown';

          return WillPopScope(
            onWillPop: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
              return false; // Return false to prevent default back behavior
            },
            child: Scaffold(
              backgroundColor: const Color(0xffF5E9CF),
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xffF5E9CF),
                iconTheme: const IconThemeData(color: Color(0xff4D455D)),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LandingPage()),
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
                        child: Text(
                          "I'm \n $firstName!",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
                        width: 200,
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
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center the Row horizontally
                              children: [
                                Icon(
                                  Icons.edit, // Replace with the desired icon
                                  color: Color(0xff4D455D), // Icon color
                                ),
                                SizedBox(
                                    width: 5), // Spacer between icon and text
                                Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      color: Color(0xff4D455D)), // Text color
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 200,
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
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center the Row horizontally
                              children: [
                                Icon(
                                  Icons.logout, // Replace with the desired icon
                                  color: Color(0xff4D455D), // Icon color
                                ),
                                SizedBox(
                                    width: 5), // Spacer between icon and text
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Color(0xff4D455D)), // Text color
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

void _showLogoutModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: const Text('Logout'),
          ),
        ],
      );
    },
  );
}
