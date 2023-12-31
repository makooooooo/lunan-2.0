import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/Assignment/assigned_tasks.dart';
import 'package:lunan/Therapist/HomePage/Assignment/turnedin_assignment.dart';
import 'package:lunan/Therapist/HomePage/Assignment/verified_assignment_info.dart';
import 'package:lunan/Therapist/HomePage/Assignment/verified_assignment_patientA.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patients_info.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VerifiedAssignment extends StatelessWidget {
  final String selectedPatientUID;

  final Map<String, dynamic>? formData;

  VerifiedAssignment({
    Key? key,
    required this.selectedPatientUID,
    this.formData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5E9CF), // Set the background color

        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffF5E9CF),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => PatientsInfo(
                    selectedPatientUID: selectedPatientUID,
                  ),
                ),
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
                              'Verified\nAssignments of \n$firstName',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 30,
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
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AssignedTasks(
                                              selectedPatientUID:
                                                  selectedPatientUID,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text('Assigned'),
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
                                                TurendInAssignment(
                                              selectedPatientUID:
                                                  selectedPatientUID,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text('Turned In'),
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xff4D455D),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: null,
                                      child: const Text('Verified',
                                          style:
                                              TextStyle(color: Colors.white)),
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
                                // Use AssignedTasksList widget to display the list of tasks
                                AssignedTasksList(
                                    selectedPatientUID: selectedPatientUID),
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
        ));
  }
}

class AssignedTasksList extends StatelessWidget {
  final String selectedPatientUID;
  final Map<String, dynamic>? formData;

  const AssignedTasksList(
      {Key? key, required this.selectedPatientUID, this.formData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Selected Patient UID: $selectedPatientUID');
    return Expanded(
        child: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Tasks')
          .where('PatientUID', isEqualTo: selectedPatientUID)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No tasks found for this user.');
        }

        final tasks = snapshot.data!.docs;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final taskDocument = tasks[index];
            final taskData = taskDocument.data() as Map<String, dynamic>;
            final activity = taskData['Activity'] as String;
            final deadline = taskData['Deadline'] as String;
            final documentId = taskDocument.id;
            final status = taskData['Status'];

            if (status == 'Verified') {
              return InkWell(
                  onTap: () {
                    // Pass selectedPatientUID, formData, and documentId to TurnedInAssignmentInfo
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifiedAssignmentInfo(
                          selectedPatientUID: selectedPatientUID,
                          formData: taskData,
                          documentId: documentId,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text('Activity: $activity\nDeadline: $deadline'),
                    ),
                  ));
            } else {
              return Container();
            }
          },
        );
      },
    ));
  }
}
