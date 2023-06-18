import 'package:flutter/material.dart';
import 'package:lunan/Therapist/ForgotPassword/reset_password_phone_number.dart';
import 'package:lunan/Patient/SignIn/log_in.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPassMobileOtpT extends StatelessWidget {
  const ForgotPassMobileOtpT({super.key});

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
        child: Center(
          child: Column(children: <Widget>[
            Container(
              child: const Text(
                'Forgot Password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: Color(0xff4D455D),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Image(
                image: AssetImage('assets/forgotPassword.png'),
                width: 300,
                height: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                'We send you a OTP code to\nyour mobile phone number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  color: Color(0xff4D455D),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: const Text(
                'Enter 4 digit code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  color: Color(0xff4D455D),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: PinCodeTextField(
                cursorColor: const Color(0xff4D455D),
                appContext: context,
                length: 4, // Specify the length of the OTP code
                onChanged: (value) {
                  // Handle OTP code changes
                },
                onCompleted: (value) {
                  // Handle OTP code completion
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8.0),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeColor: const Color(0xff7DB9B6),
                  selectedColor: const Color(0xff7DB9B6),
                  inactiveColor: const Color(0xff7DB9B6),
                  borderWidth: 2,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 20, 0),
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPasswordPhoneNumberT()),
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
                    'Submit',
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  textAlign: TextAlign.center,
                  'Use email method to reset \n password instead',
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
