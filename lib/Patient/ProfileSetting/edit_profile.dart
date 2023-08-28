import 'package:flutter/material.dart';
import 'package:lunan/Patient/ProfileSetting/profile.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Handle back button press
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileSetting()),
          );
          return false; // Return false to prevent default back behavior
        },
        child: Scaffold(
          backgroundColor: const Color(0xffF5E9CF), // Set the background color
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xffF5E9CF),
            iconTheme: const IconThemeData(color: Color(0xff4D455D)),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), // Back button icon
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileSetting()),
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: const Text(
                    'Edit Account',
              
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: const Text(
                    'Change Name',
                   
                    style: TextStyle(
                      
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextField(
                    keyboardType:
                        TextInputType.text, // Set input type to email address
                    decoration: InputDecoration(
                        hintText: 'John Doe.',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff7DB9B6))),
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        )),

                    onChanged: (value) {
                      // Handle changes in the input
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: const Text(
                    'Change Number',
                    style: TextStyle(
                      
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    keyboardType:
                        TextInputType.number, // Set input type to email address
                    decoration: InputDecoration(
                        hintText: '123456789.',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff7DB9B6))),
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        )),

                    onChanged: (value) {
                      // Handle changes in the input
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: const Text(
                    'Change Email',
                    style: TextStyle(
                      
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    keyboardType: TextInputType
                        .emailAddress, // Set input type to email address
                    decoration:  InputDecoration(
                        hintText: 'JohnDoe@email.com.',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff7DB9B6))),
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        )),

                    onChanged: (value) {
                      // Handle changes in the input
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: const Text(
                    'Change Contact Person',
                    style: TextStyle(
                      
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextField(
                    keyboardType: TextInputType
                        .emailAddress, // Set input type to email address
                    decoration: InputDecoration(
                        hintText: 'YesPapa@email.com.',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff7DB9B6))),
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        )),

                    onChanged: (value) {
                      // Handle changes in the input
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 50, 10, 0),
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileSetting()),
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
        ));
  }
}
