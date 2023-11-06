import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lunan/Patient/ForgotPassword/forgot_password.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard_modal.dart';
import 'package:lunan/Patient/HomePage/landing_page.dart';
import 'package:lunan/Therapist/HomePage/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Therapist/landing_pageT.dart';
import 'package:lunan/firebase/auth_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({Key? key});

  Future<void> fetchAndUseTwilioToken(BuildContext context) async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    final url = Uri.parse(
        'https://conversations-chatting-2605.twil.io/token-service?identity=$email&password=$password');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jwtToken = response.body; // This should be the JWT token
      print('Twilio JWT Token: $jwtToken');

      // Now, you can use the `jwtToken` for Twilio authentication
      // Set the identity to the user's email
      // Add your Twilio integration logic here...

      // After getting the JWT token, create a user account in Twilio Conversations API
      await createTwilioConversationsAccount(email);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Token Retrieval Error'),
            content: Text('Failed to retrieve Twilio JWT token.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

// Function to create a user account in Twilio Conversations API
  Future<void> createTwilioConversationsAccount(String email) async {
    final url = Uri.parse(
        'https://conversations.twilio.com/v1/Services/IS9d948a5aea154f75bdd0aa0b1191b53c/Users');

    final Map<String, dynamic> body = {
      'Identity': email,
      // 'FriendlyName': email,
    };
    final String accountSid = 'AC189848464c030fae6d1513f6dd03b233';
    final String authToken = 'c42c893db2b14e10143770cc6ba07ef3';

// Combine Account SID and Auth Token
    final String credentials = '$accountSid:$authToken';

// Base64 encode the combined string
    final String base64Credentials = base64Encode(utf8.encode(credentials));

// Use the constructed string in the 'Authorization' header
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Basic $base64Credentials',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print('Twilio Conversations account created successfully.');
      // You can now proceed with other actions or use the Twilio Conversations API as needed.
    } else {
      print('Failed to create Twilio Conversations account: ${response.body}');
      // Handle the error appropriately, show an alert or take other actions.
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> loginUser(BuildContext context) async {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();

      try {
        UserCredential userCredential =
            await AuthHelper.loginUser(email, password);
        String uid = userCredential.user!.uid;

        DocumentSnapshot userSnapshot = await AuthHelper.getUserDocument(uid);
        String role = userSnapshot.get('Role');

        if (role == 'Patient') {
          final user = FirebaseAuth.instance.currentUser;
          final userId = user?.uid;

          final dateFormatter = DateFormat('yyyy-MM-dd');
          final currentDateString = dateFormatter.format(DateTime.now());

          // Check if a mood entry for today exists
          FirebaseFirestore.instance
              .collection('MoodTracker')
              .where('UID', isEqualTo: userId)
              .where('DateSubmitted', isEqualTo: currentDateString)
              .get()
              .then((moodEntry) async {
            if (moodEntry.docs.isNotEmpty) {
              // Mood entry for today already exists, navigate to the Dashboard
              await fetchAndUseTwilioToken(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LandingPage()),
              );
            } else {
              // Mood entry for today doesn't exist, load the DashboardModal
              await fetchAndUseTwilioToken(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DashboardModal()),
              );
            }
          }).catchError((error) {
            // Handle the error
            print('Error: $error');
            // You can choose to navigate to DashboardModal or Dashboard in case of an error
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DashboardModal()), // or Dashboard()
            );
          });
        } else if (role == 'Counselor') {
          await fetchAndUseTwilioToken(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LandingPageT()),
          );
        } else {
          // Handle unknown role or other cases
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Invalid Role'),
                content: const Text('The role of the user is invalid.'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        // Handle login errors
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Error'),
              content: Text('An error occurred during login: $e'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

     return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: const Color(0xffF5E9CF),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 300,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(
                            'assets/logo.png',
                          ),
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Hello There!',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff4D455D),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4D455D),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4D455D),
                              ),
                            ),
                            labelText: 'Email',
                            hintText: 'Enter email',
                            labelStyle: TextStyle(
                              color: Color(
                                  0xff4D455D), // Change the label (hint) text color
                            ),
                            hintStyle: TextStyle(
                              color: Color(
                                  0xff4D455D), // Change the hint text color
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4D455D),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4D455D),
                              ),
                            ),
                            labelText: 'Password',
                            hintText: 'Enter Password',
                            labelStyle: TextStyle(
                              color: Color(
                                  0xff4D455D), // Change the label (hint) text color
                            ),
                            hintStyle: TextStyle(
                              color: Color(
                                  0xff4D455D), // Change the hint text color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ForgotPassword()),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color(0xff4D455D)),
                    ),
                  ),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xff4D455D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff4D455D), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Set the border radius here
                        ),
                      ),
                      onPressed: () {
                        loginUser(context);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
