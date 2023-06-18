import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/Assignment/turnedin_assignment.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_casenotes.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/patient_list.dart';
import 'package:lunan/Therapist/HomePage/WellnessForm/patient_list.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context)
            .copyWith(dialogBackgroundColor: Colors.transparent),
        child: Dialog(
          child: Expanded(
              child: Container(
            height: 550,
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
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            )))),
                Expanded(
                    child: Container(
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
                              child: const Text(
                                'Patient A \nDate Added \nLast Session ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffF5E9CF),
                                ),
                              ),
                            ))),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(10, 100, 10, 10),
                      height: 40,
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
                                  builder: (context) =>
                                      const TurendInAssignment()),
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
                                  builder: (context) =>
                                      const PatientWeeklyForms()),
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
                                  builder: (context) =>
                                      const PatientWellnessForms()),
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
                  ]),
                )),
              ],
            )),
          )),
        ));
  }
}
