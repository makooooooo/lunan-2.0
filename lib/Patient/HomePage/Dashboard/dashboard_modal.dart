import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:intl/intl.dart';
import 'package:lunan/Patient/HomePage/landing_page.dart';

class DashboardModal extends StatelessWidget {
  const DashboardModal();

  Future<void> _submitMood(BuildContext context, String mood) async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    final dateFormatter = DateFormat('yyyy-MM-dd');
    final formData = {
      'UID': userId,
      'Mood': mood,
      'DateSubmitted': dateFormatter.format(DateTime.now()),
    };

    try {
      await FirebaseFirestore.instance.collection('MoodTracker').add(formData);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Mood submitted successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the success dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LandingPage(), // Navigate to Dashboard
                    ),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Error submitting mood: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to previous screen
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

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
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final documents = snapshot.data!.docs;
          if (documents.isEmpty) {
            return Text('User not found');
          }

          final firstName =
              documents[0].get('firstName') as String? ?? 'Unknown';

          return Scaffold(
            backgroundColor: const Color(0xffF5E9CF),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color(0xffF5E9CF),
            ),
            body: Center(
              child: Container(
                width: 320,
                height: 400,
                margin: const EdgeInsets.only(bottom: 100),
                decoration: BoxDecoration(
                  color: const Color(0xff7DB9B6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Text(
                        'Welcome back\n $firstName!',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'How are you feeling\ntoday?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _submitMood(context, 'Angry');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '😡',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _submitMood(context, 'Feel like crying');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '😥',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _submitMood(context, 'Sad');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '😔',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _submitMood(context, 'Okay');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                          ),
                          child: const Text(
                            '😐',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _submitMood(context, 'Calm');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: const Text(
                            '🙂',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _submitMood(context, 'Happy');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: const Text(
                            '😊',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _submitMood(context, 'Cheerful');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: const Text(
                            '🤗',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
