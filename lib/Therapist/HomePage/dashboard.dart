import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_list.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/chat.dart';

class DashboardT extends StatelessWidget {
  const DashboardT({Key? key});

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
            return Text('Therapist not found');
          }

          final firstName = documents[0].get('firstName') as String? ?? 'Unknown';

          return Scaffold(
            backgroundColor: const Color(0xffF5E9CF), // Set the background color
            appBar: AppBar(
              backgroundColor: const Color(0xff7DB9B6),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => chatT()),
                    );
                  },
                  icon: Icon(
                    Icons.messenger,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            // Add the drawer for the menu
            drawer: Drawer(
              child: MenuListT(),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        'Welcome back \n $firstName!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 30,
                          color: const Color(0xff4D455D),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                          width: 150,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PatientList(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff7DB9B6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ), // Set the corner radius here
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: const Text(
                                    'View\nPatients',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Image.asset('assets/iconEdit.png'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                          width: 150,
                          height: 150,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff7DB9B6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ), // Set the corner radius here
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: const Text('Schedule'),
                                ),
                                Image.asset('assets/iconCalendar.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
