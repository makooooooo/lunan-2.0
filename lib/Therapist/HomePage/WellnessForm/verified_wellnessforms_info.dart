import 'package:flutter/material.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/WellnessForm/turnedin_wellnessforms.dart';
import 'package:lunan/Therapist/HomePage/WellnessForm/verified_wellnessforms.dart';

class VerifedWellnessInfo extends StatelessWidget {
  const VerifedWellnessInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        backgroundColor: const Color(0xff7DB9B6),
      ),
      drawer: Drawer(
        child: MenuList(),
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
                            'Verified\nAssignments',
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
                      width: 100,
                      margin: const EdgeInsets.fromLTRB(120, 10, 10, 10),
                      height: 30,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TurnedINWellnessFroms()),
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
                            'Unverify',
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
                                      const VerifiedWellnessForms()),
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
                            'Okay',
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
