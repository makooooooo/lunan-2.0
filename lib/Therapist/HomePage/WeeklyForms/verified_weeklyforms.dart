import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/patient_list.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/verified_weeklyforms_info.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/turnedin_weeklyforms.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';

class VerifiedWeeklyForms extends StatelessWidget {
  const VerifiedWeeklyForms({Key? key}) : super(key: key);

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
              MaterialPageRoute(builder: (context) => PatientInfo()),
            );
          },
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: const Text(
                'Verified\nAssignments from\nPatient A',
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
                                builder: (context) =>
                                    const TurnedINWeeklyFroms()),
                          );
                        },
                        child: const Text('Turned In'),
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
                                          const VerifiedWeeklyForms()),
                            );
                        },
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
                            builder: (context) =>VerifiedInWeeklyFormsInfo(),
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
                Container(
                          width: 150,
                          margin: const EdgeInsets.fromLTRB(170 , 0, 0, 0),
                          height: 45,
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
                                backgroundColor: const Color(0xff7DB9B6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20), // Set the corner radius here
                                ),
                              ),
                              child: const Text(
                                'Back to\nWeekly Forms List', textAlign: TextAlign.center, style: TextStyle( 
                              fontSize: 12,
                              color: Color(0xffF5E9CF),
                            ),
                              )),
                        ),
              ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
