import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Patient/HomePage/WellnessGuide/wellness_guide.dart';
import 'package:lunan/Therapist/HomePage/Assignment/turnedin_assignment.dart';
import 'package:lunan/Therapist/HomePage/IntakeForms/intake_form.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_casenotes.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/turnedin_weeklyforms.dart';
import 'package:lunan/Therapist/HomePage/WellnessForm/turnedin_wellnessforms.dart';
import 'package:lunan/Therapist/HomePage/dashboard.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';

class PatientsInfo extends StatefulWidget {
  final Map<String, dynamic>? data; // Make the data parameter optional
  final String selectedPatientUID;

  const PatientsInfo({
    Key? key,
    this.data,
    required this.selectedPatientUID,
  }) : super(key: key);

  @override
  State<PatientsInfo> createState() => _PatientsInfoState();
}

class _PatientsInfoState extends State<PatientsInfo> {
  TextEditingController textEditingController = TextEditingController();
  bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    // Extract the patient's information from the data map
    final String firstName = (widget.data ?? {})['firstName'] ?? '';
    final String dateCreated = (widget.data ?? {})['dateCreated'] ?? '';

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
          color: Color(0xff4D455D), // Change this color to your desired color
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: const Text(
              'PATIENT INFO ',
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff4D455D),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                'Patient Name : $firstName',
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff4D455D),
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.left,
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Text(
                'Date Added : $dateCreated',
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff4D455D),
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.left,
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: const Text(
                'Last Session',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff4D455D),
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.left,
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: const Text(
              'DIAGNOSIS ',
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff4D455D),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  width: 300,
                  margin: const EdgeInsets.fromLTRB(20, 10, 0, 40),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xff4D455D),
                      width: 2.0, // Border width
                    ),
                  ),
                  child: TextField(
                    enabled: isEditing, // Enable or disable the TextField
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Enter text',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    style: TextStyle(fontSize: 15),
                    maxLines: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 40),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (isEditing) {
                          // Save action
                          // Implement your save logic here
                          // After saving, you can disable editing
                          isEditing = false;
                        } else {
                          // Edit action
                          // Enable editing
                          isEditing = true;
                        }
                      });
                    },
                    child: Icon(
                      isEditing ? Icons.save : Icons.edit,
                      color: const Color(0xff4D455D),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xff7DB9B6),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 0, // How much the shadow should spread
                    blurRadius: 10, // How blurry the shadow should be
                    offset: Offset(0,
                        -2), // Offset of the shadow (in this case, it's above)
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IntakeForm(
                                        selectedPatientUID:
                                            widget.selectedPatientUID,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                           backgroundColor: const Color(0xFF4D455D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the corner radius here
                            ),
                          ),
                          child: const Text(
                            'View Intake Form',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffF5E9CF),
                            ),
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PatientCaseNotes(
                                        selectedPatientUID:
                                            widget.selectedPatientUID,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4D455D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the corner radius here
                            ),
                          ),
                          child: const Text(
                            'View Case Notes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffF5E9CF),
                            ),
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TurendInAssignment(
                                        selectedPatientUID:
                                            widget.selectedPatientUID,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4D455D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the corner radius here
                            ),
                          ),
                          child: const Text(
                            'View Patient Assignment',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffF5E9CF),
                            ),
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TurnedINWeeklyFroms(
                                        selectedPatientUID:
                                            widget.selectedPatientUID,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4D455D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the corner radius here
                            ),
                          ),
                          child: const Text(
                            'Patient Weekly Forms',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffF5E9CF),
                            ),
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TurnedINWellnessFroms(
                                      selectedPatientUID:
                                          widget.selectedPatientUID)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                           backgroundColor: const Color(0xFF4D455D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the corner radius here
                            ),
                          ),
                          child: const Text(
                            'Patient Wellness Form',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffF5E9CF),
                            ),
                          )),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WellnessGuide()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4D455D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the corner radius here
                            ),
                          ),
                          child: const Text(
                            'Patient Wellness Guide',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffF5E9CF),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}