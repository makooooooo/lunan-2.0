import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_list.dart';
import 'package:lunan/Therapist/HomePage/Assignment/turnedin_assignment.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/patient_list.dart';
import 'package:lunan/Therapist/HomePage/WellnessForm/patient_list.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/chat.dart';



class DashboardT extends StatelessWidget {
  const DashboardT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
      appBar: AppBar(
        backgroundColor: const Color(0xff7DB9B6),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => chatT()),
              );
            },
            icon: Icon(
              Icons.messenger,
              color: Colors.white,
            ),
          ),
        ],
      ),

      // Add the drawer for the menu
      drawer: Drawer(
        child: MenuListT(),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: const Text(
                'Welcome',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               
              Container(
                margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                width: 150,
                height: 150,
                child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PatientList ()),
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
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: const Text(
                            'View\nPatients',
                            textAlign: TextAlign.center,
                            ),
                        ),
                        Image.asset('assets/iconEdit.png'),
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                width: 150,
                height: 150,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7DB9B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the corner radius here
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: const Text('Schedule'),
                        ),
                        Image.asset('assets/iconCalendar.png'),
                      ],
                    )),
              )
              
            ],
          ),
          
          
        ]),
      )),

     
    );
  }
}
