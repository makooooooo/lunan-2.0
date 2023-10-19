
import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Patient/HomePage/chat.dart';
import 'package:lunan/Patient/ProfileSetting/profile.dart';
import 'package:lunan/Patient/SignIn/log_in.dart';
import 'package:lunan/Therapist/HomePage/chat.dart';
import 'package:lunan/Therapist/HomePage/dashboard.dart';
import 'package:lunan/Therapist/ProfileSetting/profile.dart';

class LandingPageT extends StatefulWidget {
  const LandingPageT({super.key});

  @override
  State<LandingPageT> createState() => _LandingPageTState();
}

class _LandingPageTState extends State<LandingPageT> {
  
  int currentIndex = 0;
  
  final List<Widget> _pages = <Widget>[
    DashboardT(),
    ProfileSettingT(),
    chatT()

  ];
  @override
  Widget build(BuildContext context){
  
      return  WillPopScope(
        onWillPop: () async {
          // Add your custom logic here
          // You can navigate to a different route using Navigator
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LandingPageT(
             
              ),
            ),
          );
          // Return true if the route change is successful
          return true;
        },
      
      
      
      
      
      
      child: Scaffold(
        body: Center (
        child: _pages.elementAt(currentIndex)
      ),
  
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff7DB9B6),
        unselectedItemColor: Colors.white70,
        selectedItemColor:  Colors.white,
        showUnselectedLabels: false,
        
        
        currentIndex: currentIndex,
       
        
        
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
        
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
           
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chat',
           
          )
          
        ],
         onTap: (int index) => setState(() => currentIndex = index),
        
      )
        
        
        ),
      
      );
      

}

void _showLogoutModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
            
               Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}

}
