import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/WellnessForms/wellness_form.dart';
import 'package:lunan/Patient/HomePage/WellnessForms/welness_form_question.dart';
import 'package:lunan/Patient/HomePage/landing_page.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';


class WellnessFormChooser extends StatelessWidget {
  const WellnessFormChooser({super.key});

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
          color: Color(0xff4D455D), // Change this color to your desired color
        ),
      ),
      // Add the drawer for the menu
     
      body: SingleChildScrollView(
        child: Center(
         child: Row(
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
                            builder: (context) => WellnessFormQuestion()),
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
                            'View Wellness Question Forms',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                  
                    
                    )),
              ),
              Container(
               margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                width: 150,
                height: 150,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WellnessForms()),
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
                            'View Wellness Forms',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                            
                            textAlign: TextAlign.center,
                          ),
                        ),
                   
                    )
                    ),
              ),
            ],
          ),
      )),

  
    );
  }
}
