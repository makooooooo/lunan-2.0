import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_list.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patients_info.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/turnedin_weeklyforms_info.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/verified_weeklyforms.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_list.dart';

class TurnedINWeeklyFroms extends StatelessWidget {
  final String selectedPatientUID;
  final Map<String, dynamic>? formData;

  const TurnedINWeeklyFroms({
    Key? key,
    required this.selectedPatientUID,
    this.formData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              MaterialPageRoute(
                  builder: (context) => PatientsInfo(
                        selectedPatientUID: selectedPatientUID,
                      )),
            );
          },
          color: Color(0xff4D455D),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Add your custom logic here
          // You can navigate to a different route using Navigator
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => PatientsInfo(
                selectedPatientUID: selectedPatientUID,
              ),
            ),
          );
          // Return true if the route change is successful
          return true;
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .where('UID', isEqualTo: selectedPatientUID)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Text('User not found');
                    }
                    final userDocument = snapshot.data!.docs.first;
                    final userData =
                        userDocument.data() as Map<String, dynamic>;
                    final firstName = userData['firstName'] as String;

                    return Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                          child: Text(
                            'Turned-in\nWeekly Forms of\n$firstName',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 25,
                              color: Color(0xff4D455D),
                            ),
                          ),
                        ),
                        Container(
                          width: 370,
                          height: 550,
                          decoration: BoxDecoration(
                            color: const Color(0xff4D455D),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: null,
                                    child: const Text(
                                      'Turned In',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff4D455D),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VerifiedWeeklyForms(
                                                  selectedPatientUID:
                                                      selectedPatientUID,
                                                )),
                                      );
                                    },
                                    child: const Text('Verified'),
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff4D455D),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    prefixIcon: Icon(Icons.search),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: WeeklyFormsList(
                                  selectedPatientUID: selectedPatientUID,
                                  formData: formData,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  width: 150,
                                  height: 45,
                                  margin: const EdgeInsets.only(
                                      right: 20,
                                      bottom:
                                          20), // Adjust the margins as needed
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
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text(
                                      'Back to\nPatient List',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffF5E9CF),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeeklyFormsList extends StatelessWidget {
  final String selectedPatientUID;
  final Map<String, dynamic>? formData;

  const WeeklyFormsList(
      {Key? key, required this.selectedPatientUID, this.formData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Selected Patient UID: $selectedPatientUID');
    return Expanded(
        child: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('WeeklyForm')
          .where('UID', isEqualTo: selectedPatientUID)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No weekly forms found for this user.');
        }

        final weeklyForms = snapshot.data!.docs;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: weeklyForms.length,
          itemBuilder: (context, index) {
            final formDocument = weeklyForms[index];
            final formData = formDocument.data() as Map<String, dynamic>;
            final dateAccomplished = formData['DateSubmitted'] as String;
            final status = formData['Status'];
            final documentId = formDocument.id;

            // Check if Status is null before displaying the item
            if (status == null) {
              return InkWell(
                  onTap: () {
                    String documentId = formDocument.id;
                    print('Document ID: $documentId');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TurnedInWeeklyFormsInfo(
                          selectedPatientUID: selectedPatientUID,
                          formData: formData,
                          documentId: documentId,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 50, // Adjust the width here as needed
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text('Date Accomplished: $dateAccomplished'),
                    ),
                  ));
            } else {
              // Return an empty container for documents with non-null Status
              return Container();
            }
          },
        );
      },
    ));
  }
}
