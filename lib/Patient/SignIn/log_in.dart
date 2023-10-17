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

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
              .then((moodEntry) {
            if (moodEntry.docs.isNotEmpty) {
              // Mood entry for today already exists, navigate to the Dashboard
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LandingPage()),
              );
            } else {
              // Mood entry for today doesn't exist, load the DashboardModal
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                ),
                const Image(image: AssetImage('assets/logo.png')),
                const Text(
                  'Hello There!',
                  style: TextStyle(fontSize: 30, color: Color(0xff4D455D)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: TextField(
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
                        color: Color(0xff4D455D), // Change the hint text color
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: TextField(
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
                        color: Color(0xff4D455D), // Change the hint text color
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ForgotPassword()),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xff4D455D)),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xff4D455D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
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
        ),
      ),
    );
  }
}
