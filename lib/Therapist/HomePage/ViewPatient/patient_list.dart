import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patients_info.dart';
import 'package:lunan/Therapist/HomePage/dashboard.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:lunan/Therapist/landing_pageT.dart';

class PatientList extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  PatientList({Key? key}) : super(key: key);

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
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LandingPageT()),
            );
          },
          color: Color(0xff4D455D), // Change this color to your desired color
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Add your custom logic here
          // You can navigate to a different route using Navigator
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LandingPageT(),
            ),
          );
          // Return true if the route change is successful
          return true;
        },
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 10, 20),
                child: const Text(
                  'Patient List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: getUsersStream(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    final List<QueryDocumentSnapshot> documents =
                        snapshot.data!.docs;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        final document = documents[index];
                        String firstName =
                            document['firstName'] as String? ?? '';
                        String dateCreated =
                            document['dateCreated'] as String? ?? '';
                        String counselorUID =
                            document['counselorUID'] as String? ?? '';
                        String profilePicUrl =
                            document['ProfPic'] as String? ?? '';
                        String selectedPatientUID =
                            document['UID'] as String? ?? '';
                        String PhoneNum =
                            document['CellPhone'] as String? ?? '';
                        String HomePhone =
                            document['HomePhone'] as String? ?? '';
                        String Email = document['Email'] as String? ?? '';
                        // Check if field exists
                        if (document['firstName'] != null) {
                          firstName = document['firstName'] as String;
                        }
                        if (document['dateCreated'] != null) {
                          dateCreated = document['dateCreated'] as String;
                        }
                        if (document['counselorUID'] != null) {
                          counselorUID = document['counselorUID'] as String;
                        }
                        if (document['ProfPic'] != null) {
                          profilePicUrl = document['ProfPic'] as String;
                        }
                        if (document['UID'] != null) {
                          selectedPatientUID = document['UID'] as String;
                        }
                        if (document['CellPhone'] != null) {
                          PhoneNum = document['CellPhone'] as String;
                        }
                        if (document['HomePhone'] != null) {
                          HomePhone = document['HomePhone'] as String;
                        }
                        if (document['Email'] != null) {
                          Email = document['Email'] as String;
                        }
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PatientsInfo(
                                  data: document.data() as Map<String, dynamic>,
                                  selectedPatientUID: selectedPatientUID,
                                  PhoneNum: PhoneNum,
                                  HomePhone: HomePhone,
                                  Email: Email,
                                  firstName: firstName,
                                ),
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
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 16, right: 8),
                                  child: CircleAvatar(
                                    backgroundImage: profilePicUrl.isNotEmpty
                                        ? NetworkImage(profilePicUrl)
                                        : null,
                                    radius: 20,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Patient Name: $firstName\nDate Added: $dateCreated\nLast Session: ',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<QuerySnapshot> getUsersStream() {
    final User? user = _auth.currentUser;
    final uid = user?.uid;

    return _firestore
        .collection('Users')
        .where('counselorUID', isEqualTo: uid)
        .snapshots();
  }
}
