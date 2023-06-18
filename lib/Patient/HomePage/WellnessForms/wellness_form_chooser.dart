import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/WellnessForms/wellness_form.dart';
import 'package:lunan/Patient/HomePage/WellnessForms/welness_form_question.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';


class WellnessFormChooser extends StatelessWidget {
  const WellnessFormChooser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
      appBar: AppBar(
       
        backgroundColor: const Color(0xff7DB9B6),
      ),
      // Add the drawer for the menu
      drawer: Drawer(
        child: MenuList(),
      ),
      body: SingleChildScrollView(
        child: Center(
         child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 70, 20, 20),
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
                            textAlign: TextAlign.center,
                          ),
                        ),
                  
                    
                    )),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 70, 20, 20),
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
