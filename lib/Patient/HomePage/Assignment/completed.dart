import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Assignment/chooser.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

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
              MaterialPageRoute(builder: (context) => AssignmentChooser()),
            );
          }, 
          color: Color(0xff4D455D), // Change this color to your desired color
        ),
        
      
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
           const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the padding as needed
                  child: Divider(
                    color: Color(0xff4D455D),
                    thickness: 2,
                  ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          'Activity # 1\nJournal and Drawing Entry\nDue: March 8, 2023',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => WeeklyFormEdit(
                            //       documentId: documentId,
                            //       formData: formData,
                            //     ),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 16.0), // Adjust the right margin here
                            child: const Icon(
                              Icons.undo,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
