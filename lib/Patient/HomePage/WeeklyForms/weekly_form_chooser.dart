import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_forms.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_forn_question.dart';
import 'package:lunan/Patient/HomePage/landing_page.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class WeeklyFormChooser extends StatelessWidget {
  const WeeklyFormChooser({super.key});

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
              MaterialPageRoute(builder: (context) => LandingPage()),
            );
          },
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),
      // Add the drawer for the menu

      body: SingleChildScrollView(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 100, 20, 20),
              width: 150,
              height: 150,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeeklyFormsQuestion()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff7DB9B6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Set the corner radius here
                    ),
                  ),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: const Text(
                        'View Weekly Question Forms',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 100, 20, 20),
              width: 150,
              height: 150,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WeeklyForms()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff7DB9B6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Set the corner radius here
                    ),
                  ),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: const Text(
                        'View Weekly Forms'
                        ,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
