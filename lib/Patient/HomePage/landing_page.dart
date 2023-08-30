
import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Patient/HomePage/chat.dart';
import 'package:lunan/Patient/ProfileSetting/profile.dart';
import 'package:lunan/Patient/SignIn/log_in.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  
  int currentIndex = 0;
  
  final List<Widget> _pages = <Widget>[
    Dashboard(),
    ProfileSetting(),
    Chat()

  ];
  @override
  Widget build(BuildContext context) => Scaffold(
  
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
