import 'package:flutter/material.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
    backgroundColor: const Color(0xffF5E9CF), // Set the background color
      appBar: AppBar(
    
        backgroundColor: const Color(0xff7DB9B6),
      
        
      
      ),
      
 
      
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: const Text(
                'Completed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: Color(0xff4D455D),
                ),
              ),
            ),
            const Divider(
              color: Color(0xff4D455D), // Customize the color of the line
              thickness: 2, // Adjust the thickness of the line
            ),
            InkWell(
              // onTap: () {
              //   Navigator.push(
              //     context, 
              //     MaterialPageRoute(
              //        builder: (context) => const PatientTurnIn()
              //       ),
              //   );
              // },
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
                        'Activity # 1\nJournal and Drawing Entry | Due: March 8, 2023',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ),
          
          ],
        ),
      
      ),
    
    );
  }
}