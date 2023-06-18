import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/create_casenotes.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_list.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/view_casenotes.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';

class PatientCaseNotes extends StatelessWidget {
  const PatientCaseNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
      appBar: AppBar(
        backgroundColor: const Color(0xff7DB9B6),
      ),
      drawer: Drawer(
        child: MenuListT(),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: const Text(
                'Patient Case\nNotes',
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
              height: 600,
              decoration: BoxDecoration(
                color: const Color(0xff4D455D),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
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
                            builder: (context) => ViewCaseNotes()),
                      );
                    },
                    child: Container(
                      width: 330,
                      height: 80,
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text('Patient Name:\nDate Accomplished:'),
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
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Patient Name:\nDate Accomplished:'),
                  ),
                  Container(
                    width: 330,
                    height: 80,
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Patient Name:\nDate Accomplished:'),
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                  Container(
                    width: 170,
                   
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PatientList()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7DB9B6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Set the corner radius here
                          ),
                        ),
                        child: const Text(
                          'Back To Patient List',
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                     
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateCaseNotes()
                              )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 19, 195, 122),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Set the corner radius here
                            ),
                          ),
                          child: const Text(
                            'Create Case Notes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffF5E9CF),
                            ),
                          )),
                    ),
                  ],
                )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
