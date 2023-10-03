import 'package:flutter/material.dart';
  
class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
     
      body: Center(
          child: Container(
            width: 320,
            height: 550,
            decoration: BoxDecoration(
              color: const Color(0xff7DB9B6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: const Text(
                    'INBOX',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 40,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
        ]),
      )),
    
    );
  }
}