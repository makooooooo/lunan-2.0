import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Assignment/chooser.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Patient/HomePage/Assignment/turnedIn.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

   @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF5E9CF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AssignmentChooser()),
            );
          },
          color: Color(0xff4D455D),
        ),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Tasks')
              .where('PatientUID', isEqualTo: userId)
              .where('Status', isEqualTo: "turnedIn")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final forms = snapshot.data!.docs;

              return Column( // Remove the outer Column
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: const Text(
                      'Turned-In Assignments',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        color: Color(0xff4D455D),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Color(0xff4D455D),
                      thickness: 2,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: forms.length,
                    itemBuilder: (context, index) {
                      final documentId = forms[index].id as String;
                      final formData = forms[index].data() as Map<String, dynamic>;
                      

                      final Activity = formData['Activity'] as String;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => turnedIn(formData: formData, documentId: documentId),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xff4D455D),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    'Activity: $Activity',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}