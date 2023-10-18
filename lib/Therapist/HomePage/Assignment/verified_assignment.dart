import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/Assignment/turnedin_assignment.dart';
import 'package:lunan/Therapist/HomePage/Assignment/verified_assignment_info.dart';
import 'package:lunan/Therapist/HomePage/Assignment/verified_assignment_patientA.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patients_info.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';

class VerifiedAssignment extends StatelessWidget {
  final String selectedPatientUID;
  VerifiedAssignment({Key? key, required this.selectedPatientUID})
      : super(key: key);

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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PatientsInfo(
                        selectedPatientUID: selectedPatientUID,
                      )),
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
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: const Text(
                  'Verified\nAssignments',
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TurendInAssignment(
                                        selectedPatientUID: selectedPatientUID,
                                      )),
                            );
                          },
                          child: const Text('Turned In'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff4D455D),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: null,
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifiedAssignmentInfo(
                              selectedPatientUID: selectedPatientUID,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 330,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                        child: Text('Patient Name:\nDate Given:\nHW Name:'),
                      ),
                    ),
                    Container(
                      width: 330,
                      height: 80,
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: Text('Patient Name:\nDate Given:\nHW Name:'),
                    ),
                    Container(
                      width: 330,
                      height: 80,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: Text('Patient Name:\nDate Given:\nHW Name:'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
