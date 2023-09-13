import 'package:flutter/material.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_casenotes.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:file_picker/file_picker.dart';

import '../../../Patient/HomePage/Assignment/patient_turn_in.dart';

class CreateCaseNotes extends StatelessWidget {
  const CreateCaseNotes({super.key});

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
              MaterialPageRoute(builder: (context) => PatientCaseNotes()),
            );
          },
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff7DB9B6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text(
                            'Create a Case Note',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ))),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 25, 10, 20),
                  decoration: BoxDecoration(
                    color: const Color(0xff4D455D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text(
                                'Patient A\nDate Added\nDiagnosis ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffF5E9CF),
                                ),
                              ),
                            ))),
                    Container(
                        margin: const EdgeInsets.fromLTRB(15, 5, 0, 10),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // attachFile();
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                side: MaterialStateProperty.all<BorderSide>(
                                  const BorderSide(
                                      color: Color(0xffF5E9CF), width: 2.0),
                                ),
                              ),
                              child: const Text('Attach File'),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Image.asset('assets/iconPaperClip.png'),
                            )
                          ],
                        )),
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: BoxDecoration(
                              color: Color(0xffF5E9CF),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                color: Color(
                                    0xffF5E9CF), // Set the desired background color
                                borderRadius: BorderRadius.circular(
                                    8), // Set the desired border radius
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                    hintText: 'Enter text',
                                    border: InputBorder
                                        .none, // Remove the default border
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 14.0)),
                                style: TextStyle(fontSize: 18),
                              ),
                            ))),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          margin: const EdgeInsets.fromLTRB(120, 10, 10, 10),
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PatientInfo()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 211, 34, 87),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Set the corner radius here
                                ),
                              ),
                              child: const Text(
                                'Cancel',
                              )),
                        ),
                        Container(
                          width: 100,
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PatientCaseNotes()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 19, 195, 122),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Set the corner radius here
                                ),
                              ),
                              child: const Text(
                                'Save',
                              )),
                        ),
                      ],
                    )
                  ]),
                )),
              ],
            )),
      )),
    );
  }
}
