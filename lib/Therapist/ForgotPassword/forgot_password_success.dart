import 'package:flutter/material.dart';
import 'package:lunan/Patient/SignIn/log_in.dart';


void main() => runApp(const MaterialApp(
      home: ForgotPasswordSuccessT(),
    ));

class ForgotPasswordSuccessT extends StatelessWidget {
  const ForgotPasswordSuccessT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xff7DB9B6),
                width: 5,
              )),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Image(image: AssetImage('assets/check.png')),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: const Text(
                  'Successfully sent the link to \nyour email to reset your \npassword',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
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
                      'Ok',
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
