import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Therapist/HomePage/dashboard.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardT()),
            );
          },
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),
      body: Center(
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
            StreamBuilder<QuerySnapshot>(
              stream: getUsersStream(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

                return ListView.builder(
  shrinkWrap: true,
  itemCount: documents.length,
  itemBuilder: (BuildContext context, int index) {
    final document = documents[index];
    final firstName = document['firstName'] as String? ?? '';
    final dateCreated = document['dateCreated'] as String? ?? '';
    final counselorUID = document['counselorUID'] as String? ?? '';
    final profilePicUrl = document['ProfPic'] as String? ?? '';

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const PatientInfo();
          },
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
              margin: const EdgeInsets.only(left: 16, right: 8),
              child: CircleAvatar(
                backgroundImage: profilePicUrl != null ? NetworkImage(profilePicUrl) : null,
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
          ],
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
