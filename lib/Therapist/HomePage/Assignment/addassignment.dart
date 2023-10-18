// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Therapist/HomePage/Assignment/assigned_tasks.dart';
import 'package:lunan/Therapist/HomePage/Assignment/turnedin_assignment.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddAssignment extends StatefulWidget {
  final String selectedPatientUID;
  AddAssignment({Key? key, required this.selectedPatientUID}) : super(key: key);

  @override
  State<AddAssignment> createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController dateinput = TextEditingController();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  // Function to save data to Firestore
  Future<void> saveAssignmentToFirestore({
    required String taskName,
    required String date,
    required String description,
  }) async {
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    try {
      final firestore = FirebaseFirestore.instance;
      final newDocumentRef = firestore.collection('Tasks').doc();
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      await newDocumentRef.set({
        'PatientUID': widget.selectedPatientUID,
        'Activity': taskName,
        'Deadline': date,
        'Description': description,
        'DateCreated': formattedDate,
        'Status': null,
        'counselorUID': uid,
      });

      // Data saved successfully
      print('Assignment saved to Firestore.');
    } catch (e) {
      // Handle any errors that occurred during the data saving process
      print('Error saving assignment: $e');
    }
  }

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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200),
              height: 330,
              width: 350,
              decoration: BoxDecoration(
                color: const Color(0xff7DB9B6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  color: const Color(0xff4D455D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        color: const Color(0xff4D455D),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(15, 20, 0, 10),
                              child: const Text(
                                'Task Name: ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffF5E9CF),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 225,
                            height: 30,
                            margin: const EdgeInsets.only(left: 15),
                            padding: const EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              controller: taskNameController,
                              decoration: InputDecoration(
                                hintText: 'Enter task name',
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 14.0),
                              ),
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          TextField(
                            controller: dateinput,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.calendar_today,
                                color: Color(0xffF5E9CF),
                              ),
                              labelText: "Enter Date",
                              labelStyle: TextStyle(color: Color(0xffF5E9CF)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffF5E9CF)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffF5E9CF)),
                              ),
                            ),
                            style: TextStyle(color: Color(0xffF5E9CF)),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);

                                setState(() {
                                  dateinput.text = formattedDate;
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 20, 0, 10),
                                  child: const Text(
                                    'Description: ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xffF5E9CF),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 225,
                                height: 30,
                                margin: const EdgeInsets.only(left: 15),
                                padding: const EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter description',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 14.0),
                                  ),
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Container(
                                width: 90,
                                margin:
                                    const EdgeInsets.fromLTRB(200, 40, 0, 0),
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    final taskName = taskNameController.text;
                                    final date = dateinput.text;
                                    final description =
                                        descriptionController.text;

                                    saveAssignmentToFirestore(
                                      taskName: taskName,
                                      date: date,
                                      description: description,
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AssignedTasks(
                                          selectedPatientUID:
                                              widget.selectedPatientUID,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 19, 195, 122),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const Text(
                                    'Submit',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
