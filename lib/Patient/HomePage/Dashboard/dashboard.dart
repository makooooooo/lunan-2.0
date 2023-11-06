import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Assignment/assignment.dart';
import 'package:lunan/Patient/HomePage/Assignment/chooser.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_form_chooser.dart';

import 'package:lunan/Patient/HomePage/WellnessForms/wellness_form_chooser.dart';
import 'package:lunan/Patient/HomePage/WellnessGuide/wellness_guide.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:lunan/Patient/HomePage/chat.dart';
import 'package:lunan/Therapist/Scheduling/schedule.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5E9CF), // Set the background color

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 10, top: 10, bottom: 10),
                    height: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WeeklyFormChooser()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7DB9B6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Set the corner radius here
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Weekly Forms',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Image.asset('assets/iconEdit.png'),
                          ],
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                   margin: const EdgeInsets.only(
                        left: 10, right: 20, top: 10, bottom: 10),
                    height: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WellnessFormChooser()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7DB9B6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Set the corner radius here
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Wellness Forms',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Image.asset('assets/iconEdit2.png'),
                          ],
                        )),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                     margin: const EdgeInsets.only(
                        left: 20, right: 10, top: 10, bottom: 10),
                    height: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AssignmentChooser()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7DB9B6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Set the corner radius here
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Assignments',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Image.asset('assets/iconTaskSquare.png'),
                          ],
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                        left: 10, right: 20, top: 10, bottom: 10),
                    height: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WellnessGuide()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7DB9B6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Set the corner radius here
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Wellness Guide',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Image.asset('assets/iconBookSaved.png'),
                          ],
                        )),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.5, // Set the width factor to 50%
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Schedule()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7DB9B6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // Set the corner radius here
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Schedule',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Image.asset('assets/iconCalendar.png'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
