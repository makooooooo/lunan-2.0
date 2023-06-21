import 'package:flutter/material.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_list.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/chat.dart';



class DashboardT extends StatelessWidget {
  const DashboardT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
      appBar: AppBar(
        backgroundColor: const Color(0xff7DB9B6),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => chatT()),
              );
            },
            icon: Icon(
              Icons.messenger,
              color: Colors.white,
            ),
          ),
        ],
      ),

      // Add the drawer for the menu
      drawer: Drawer(
        child: MenuListT(),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(children: <Widget>[
            
          
        ]),
      )),

     
    );
  }
}
