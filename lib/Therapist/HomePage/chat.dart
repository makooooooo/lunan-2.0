import 'package:flutter/material.dart';

class chatT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xff7DB9B6),
      ),

      
      body: Center(
          child: Container(
            width: 320,
            height: 650,
            decoration: BoxDecoration(
              color: const Color(0xff7DB9B6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: const Text(
                    'Chat',
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