import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_list.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/chat.dart';
import 'package:lunan/Therapist/Scheduling/schedule.dart';

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

          final firstName =
              documents[0].get('firstName') as String? ?? 'Unknown';

         return Scaffold(
            backgroundColor:
                const Color(0xffF5E9CF), // Set the background color

            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                    const Spacer(flex: 1,),
                   Container(
                      constraints: const BoxConstraints(
                        maxWidth: 300,
                        
                      ),
                     
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'Welcome back \n $firstName!',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 30,
                              color: const Color(0xff4D455D),
                            ),
                          ),
                        ),
                      )),
             
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                        constraints: const BoxConstraints(
                          maxWidth: 150,
                          maxHeight: 150,
                        ),
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
                                  'View Patients',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Image.asset('assets/iconEdit.png'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 20, 20, 0),
                        constraints: const BoxConstraints(
                          maxWidth: 150,
                          maxHeight: 150,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Schedule()),
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
                                  'Schedule',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Image.asset('assets/iconCalendar.png'),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(flex: 2,),
              ],
            ),
          );
        }
      },
    );
  }
}
