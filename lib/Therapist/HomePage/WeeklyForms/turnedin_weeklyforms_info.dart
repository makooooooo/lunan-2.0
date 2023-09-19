import 'package:flutter/material.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/turnedin_weeklyforms.dart';

class TurnedInWeeklyFormsInfo extends StatelessWidget {
  final String selectedPatientUID;
  const TurnedInWeeklyFormsInfo({Key? key, required this.selectedPatientUID}) : super(key: key);

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
              MaterialPageRoute(builder: (context) => TurnedINWeeklyFroms(selectedPatientUID: selectedPatientUID,)),
            );
          },
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
             width: MediaQuery.of(context).size.width,
            height: 300,
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
                          margin: const EdgeInsets.only(top: 5),
                          child: const Text(
                            'Turned-in\nWeekly Form',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ))),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 20),
                  decoration: BoxDecoration(
                    color: const Color(0xff4D455D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    
                    Expanded(
                        child: Container(
                          
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                        color: Color(0xffF5E9CF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      
                    )),
                  
                    Row(
                      children:[
                      Container(
                      width: 80,
                      margin: const EdgeInsets.fromLTRB(140, 10, 10, 10),
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       TurnedINWeeklyFroms(selectedPatientUID: selectedPatientUID,)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 211, 34, 87),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Set the corner radius here
                            ),
                          ),
                          child: const Text(
                            'Back',
                          )),
                    ),
                    Container(
                      width: 80,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TurnedINWeeklyFroms(selectedPatientUID: selectedPatientUID,)),
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
                            'Verify',
                          )),
                    ),
                      ],
                    ),
                    
                  ]),
                )),
              ],
            )),
      )),
    );
  }
}
