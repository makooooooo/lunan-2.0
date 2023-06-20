import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';



class WeeklyFormsQuestion extends StatefulWidget {
  WeeklyFormsQuestion({Key? key}) : super(key: key);

  @override
  State<WeeklyFormsQuestion> createState() => _WeeklyFormsQuestionState(); 
}

class _WeeklyFormsQuestionState extends State<WeeklyFormsQuestion> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  double questionOneValue = 0;
  double questionTwoValue = 0;
  double questionThreeValue = 0;
  double questionFourValue = 0;
  double questionFiveValue = 0;

  Future<void> _submitForm() async {
    final User? user = _auth.currentUser;
    final uid = user?.uid;

    // Get the current date
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    final formData = {
      'WeeklyQ1': questionOneValue,
      'WeeklyQ2': questionTwoValue,
      'WeeklyQ3': questionThreeValue,
      'WeeklyQ4': questionFourValue,
      'WeeklyQ5': questionFiveValue,
      'UID': uid,
      'DateSubmitted': formattedDate,
    };

    try {
      await FirebaseFirestore.instance.collection('WeeklyForm').add(formData);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Form data submitted successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Perform any additional actions after closing the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Error submitting form data: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Perform any additional actions after closing the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        backgroundColor: const Color(0xff7DB9B6),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: const Text(
                  'Weekly Question Forms',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              const Divider(
                color: Color(0xff4D455D),
                thickness: 2,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'I have feel cheerful and in good spirits',
                      style: TextStyle(
                          color: Color(0xff4D455D),
                          fontWeight: FontWeight.bold),
                    ),
                    if (questionOneValue == 1)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- At no time'),
                      )
                    else if (questionOneValue == 2)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Some of the time'),
                      )
                    else if (questionOneValue == 3)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Occasionally'),
                      )
                    else if (questionOneValue == 4)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Most of the time'),
                      )
                    else if (questionOneValue == 5)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- All of the time'),
                      ),
                    Slider(
                      value: questionOneValue,
                      onChanged: (value) {
                        setState(() {
                          questionOneValue = value;
                        });
                      },
                      min: 0,
                      max: 5,
                      divisions: 5,
                      label: questionOneValue.round().toString(),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'I have felt calm and relaxed',
                      style: TextStyle(
                          color: Color(0xff4D455D),
                          fontWeight: FontWeight.bold),
                    ),
                    if (questionTwoValue == 1)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- At no time'),
                      )
                    else if (questionTwoValue == 2)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Some of the time'),
                      )
                    else if (questionTwoValue == 3)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Occasionally'),
                      )
                    else if (questionTwoValue == 4)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Most of the time'),
                      )
                    else if (questionTwoValue == 5)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- All of the time'),
                      ),
                    Slider(
                      value: questionTwoValue,
                      onChanged: (value) {
                        setState(() {
                          questionTwoValue = value;
                        });
                      },
                      min: 0,
                      max: 5,
                      divisions: 5,
                      label: questionTwoValue.round().toString(),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'I have felt active and vigorous',
                      style: TextStyle(
                          color: Color(0xff4D455D),
                          fontWeight: FontWeight.bold),
                    ),
                    if (questionThreeValue == 1)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- At no time'),
                      )
                    else if (questionThreeValue == 2)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Some of the time'),
                      )
                    else if (questionThreeValue == 3)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Occasionally'),
                      )
                    else if (questionThreeValue == 4)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Most of the time'),
                      )
                    else if (questionThreeValue == 5)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- All of the time'),
                      ),
                    Slider(
                      value: questionThreeValue,
                      onChanged: (value) {
                        setState(() {
                          questionThreeValue = value;
                        });
                      },
                      min: 0,
                      max: 5,
                      divisions: 5,
                      label: questionThreeValue.round().toString(),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'I have felt tired and worn out',
                      style: TextStyle(
                          color: Color(0xff4D455D),
                          fontWeight: FontWeight.bold),
                    ),
                    if (questionFourValue == 1)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- At no time'),
                      )
                    else if (questionFourValue == 2)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Some of the time'),
                      )
                    else if (questionFourValue == 3)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Occasionally'),
                      )
                    else if (questionFourValue == 4)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Most of the time'),
                      )
                    else if (questionFourValue == 5)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- All of the time'),
                      ),
                    Slider(
                      value: questionFourValue,
                      onChanged: (value) {
                        setState(() {
                          questionFourValue = value;
                        });
                      },
                      min: 0,
                      max: 5,
                      divisions: 5,
                      label: questionFourValue.round().toString(),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'I have been a happy person',
                      style: TextStyle(
                          color: Color(0xff4D455D),
                          fontWeight: FontWeight.bold),
                    ),
                    if (questionFiveValue == 1)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- At no time'),
                      )
                    else if (questionFiveValue == 2)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Some of the time'),
                      )
                    else if (questionFiveValue == 3)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Occasionally'),
                      )
                    else if (questionFiveValue == 4)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- Most of the time'),
                      )
                    else if (questionFiveValue == 5)
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text('- All of the time'),
                      ),
                    Slider(
                      value: questionFiveValue,
                      onChanged: (value) {
                        setState(() {
                          questionFiveValue = value;
                        });
                      },
                      min: 0,
                      max: 5,
                      divisions: 5,
                      label: questionFiveValue.round().toString(),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}