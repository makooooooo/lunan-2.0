import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/turnedin_weeklyforms.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';

class PatientWeeklyForms extends StatelessWidget {
  const PatientWeeklyForms({Key? key}) : super(key: key);

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
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 10, 20),
              child: const Text(
                'Patient List',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: Color(0xff4D455D),
                  
                )
                ,
              ),
              
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
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
                            builder: (context) => TurnedINWeeklyFroms()),
                      );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xff4D455D),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Patient B \nDate Added \nLast Session',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}