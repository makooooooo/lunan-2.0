import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/dashboard.dart';

class ProfileSettingT extends StatelessWidget {
  const ProfileSettingT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF5E9CF),
        iconTheme: const IconThemeData(color: Color(0xff4D455D)),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: const Text(
                  'Change Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
                  keyboardType: TextInputType
                      .text, // Set input type to email address
                  decoration: const InputDecoration(
                      hintText: 'John Doe.',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff7DB9B6))),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff7DB9B6)),
                      )),

                  onChanged: (value) {
                    // Handle changes in the input
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'Change Number',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  keyboardType: TextInputType
                      .number, // Set input type to email address
                  decoration: const InputDecoration(
                      hintText: '123456789.',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff7DB9B6))),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff7DB9B6)),
                      )),

                  onChanged: (value) {
                    // Handle changes in the input
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'Change Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  keyboardType: TextInputType
                      .emailAddress, // Set input type to email address
                  decoration: const InputDecoration(
                      hintText: 'JohnDoe@email.com.',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff7DB9B6))),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff7DB9B6)),
                      )),

                  onChanged: (value) {
                    // Handle changes in the input
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: const Text(
                  'Change Contact Person',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  keyboardType: TextInputType
                      .emailAddress, // Set input type to email address
                  decoration: const InputDecoration(
                      hintText: 'YesPapa@email.com.',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff7DB9B6))),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff7DB9B6)),
                      )),

                  onChanged: (value) {
                    // Handle changes in the input
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                height: 40,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardT()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff7DB9B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Set the corner radius here
                      ),
                    ),
                    child: const Text(
                      'Save',
                    )),
              ),
              
            ],
          ),
        ),
    
    );
  }
}