import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/Assignment/turnedin_assignment.dart';
import 'package:lunan/Therapist/HomePage/IntakeForms/intake_form.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_casenotes.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_list.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/turnedin_weeklyforms.dart';
import 'package:lunan/Therapist/HomePage/WellnessGuide/wellness_guide.dart';
import 'package:lunan/Therapist/HomePage/WellnessForm/turnedin_wellnessforms.dart';

class PatientInfo extends StatefulWidget {
  final Map<String, dynamic>? data; // Make the data parameter optional
  final String selectedPatientUID;

  const PatientInfo({
    Key? key,
    this.data,
    required this.selectedPatientUID,
  }) : super(key: key);

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

bool isChecked = false;

class _PatientInfoState extends State<PatientInfo> {
  @override
  Widget build(BuildContext context) {
    // Extract the patient's information from the data map
    final String firstName = (widget.data ?? {})['firstName'] ?? '';
    final String dateCreated = (widget.data ?? {})['dateCreated'] ?? '';

    return Theme(
      data:
          Theme.of(context).copyWith(dialogBackgroundColor: Colors.transparent),
      child: Dialog(
          child: SingleChildScrollView(
        child: Container(
          height: 650,
          decoration: BoxDecoration(
            color: const Color(0xff7DB9B6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 60),
                          child: const Text(
                            'Patient Info',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                        child: Text(
                          'Patient Name: $firstName\nDate Added: $dateCreated\nLast Session: ',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xffF5E9CF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 20, 0, 10),
                      child: const Text(
                        'Diagnosis : ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffF5E9CF),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter text',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0),
                            ),
                            style: TextStyle(fontSize: 12),
                            maxLines: null,
                          ),
                        ),
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                              // You can handle checkbox state changes here
                            });
                          },
                          activeColor: const Color(0xff7DB9B6),
                          checkColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(10, 60, 10, 10),
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
                          backgroundColor: const Color(0xff7DB9B6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Set the corner radius here
                          ),
                        ),
                        child: const Text(
                          'View Intake\nForm',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
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
                          backgroundColor: const Color(0xff7DB9B6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Set the corner radius here
                          ),
                        ),
                        child: const Text(
                          'View Case\nNotes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
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
                         backgroundColor:const Color(0xFF96C291),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Set the corner radius here
                          ),
                        ),
                        child: const Text(
                          'View Patient\nAssignment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
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
                          backgroundColor:
                              const Color.fromARGB(255, 19, 195, 122),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Set the corner radius here
                          ),
                        ),
                        child: const Text(
                          'Patient Weekly\nForms',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
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
                          backgroundColor: Color.fromARGB(255, 19, 195, 122),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Set the corner radius here
                          ),
                        ),
                        child: const Text(
                          'Patient Wellness Form',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
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
                                builder: (context) => const WellnessGuide()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 19, 195, 122),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Set the corner radius here
                          ),
                        ),
                        child: const Text(
                          'Patient Wellness Guide',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffF5E9CF),
                          ),
                        )),
                  ),
                ]),
              ),
            ],
          )),
        ),
      )),
    );
  }
}
