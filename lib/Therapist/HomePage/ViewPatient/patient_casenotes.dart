import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/create_casenotes.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/view_casenotes.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_list.dart';

class PatientCaseNotes extends StatelessWidget {
  final String selectedPatientUID;
  final Map<String, dynamic>? formData;

  const PatientCaseNotes(
      {Key? key, required this.selectedPatientUID, this.formData})
      : super(key: key);

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
            Navigator.pop(context);
          },
          color: Color(0xff4D455D),
        ),
      ),
      body: Center(
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
                  final userData = userDocument.data() as Map<String, dynamic>;
                  final firstName = userData['firstName'] as String;

                  return Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Text(
                          'Case Notes of\n$firstName',
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [],
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
                              child: CaseNotesList(
                                selectedPatientUID: selectedPatientUID,
                                formData: formData,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    width: 150,
                                    height: 45,
                                    margin: const EdgeInsets.only(
                                        left: 20, bottom: 20),
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
                                        backgroundColor:
                                            const Color(0xff7DB9B6),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: 150,
                                    height: 45,
                                    margin: const EdgeInsets.only(
                                        right: 20, bottom: 20),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CreateCaseNotes(selectedPatientUID: selectedPatientUID,),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 19, 195, 122),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: const Text(
                                        'Create Case\n Notes',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffF5E9CF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
    );

  }
}

class CaseNotesList extends StatelessWidget {
  final String selectedPatientUID;
  final Map<String, dynamic>? formData;

  const CaseNotesList(
      {Key? key, required this.selectedPatientUID, this.formData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Selected Patient UID: $selectedPatientUID');
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('CaseNotes')
          .where('patientUID', isEqualTo: selectedPatientUID)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No case notes found for this user.');
        }

        final caseNotes = snapshot.data!.docs;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: caseNotes.length,
          itemBuilder: (context, index) {
            final formDocument = caseNotes[index];
            final formData = formDocument.data() as Map<String, dynamic>;
            final dateAdded = formData['dateAdded'] as String;
            final documentId = formDocument.id;
            return InkWell(
              onTap: () {
                // Pass both selectedPatientUID and formData to ViewCaseNotes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewCaseNotes(
                      selectedPatientUID: selectedPatientUID,
                      formData: formData,
                      documentId: documentId,
                    ),
                  ),
                );
              },
              child: Container(
                width: 50, // Adjust the width here as needed
                height: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                child: Text('Date Accomplished: $dateAdded'),
              ),
            );
          },
        );
      },
    );

  }
}