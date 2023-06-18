import 'package:flutter/material.dart';
import 'package:lunan/Patient/ForgotPassword/forgot_password.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard_modal.dart';
import 'package:lunan/Therapist/HomePage/dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
              margin: const EdgeInsets.all(30),
              ),
              const Image(image: AssetImage('assets/lunan.png')),
              const SizedBox(height: 40),
              const Text(
                'Welcome!',
                style: TextStyle(fontSize: 30, color: Color(0xff4D455D)),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter email',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                       borderSide: BorderSide(
                        color: Color(0xff7DB9B6),
                      ),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to ForgotPasswordPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ForgotPassword()),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0xff4D455D)),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: const Color(0xff7DB9B6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DashboardModal()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 250,
               margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: const Color(0xff7DB9B6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DashboardT()),
                    );
                  },
                  child: const Text(
                    'Login as therapist',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
