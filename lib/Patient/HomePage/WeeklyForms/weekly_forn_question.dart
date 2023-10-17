import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_form_chooser.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
      'Status': null,
    };

    try {
      await _firestore.collection('WeeklyForm').add(formData);
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
                  Navigator.of(context).pop();
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
        elevation: 0,
        backgroundColor: const Color(0xffF5E9CF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WeeklyFormChooser()),
            );
          },
          color: Color(0xff4D455D), // Change this color to your desired color
        ),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20), // Adjust the padding as needed
                child: Divider(
                  color: Color(0xff4D455D),
                  thickness: 2,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'I have feel cheerful and in good spirits',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (questionOneValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            '- At no time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionOneValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            '- Some of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionOneValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            '- Less than half of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionOneValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- More than half of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionOneValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Most of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionOneValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- All the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      Slider(
                          value: questionOneValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: questionOneValue.toStringAsFixed(0),
                          activeColor: const Color(0xff7DB9B6),
                          thumbColor: const Color(0xff4D455D),
                          onChanged: (value) {
                            setState(() {
                              questionOneValue = value;
                            });
                          })
                    ]),
              ),

              //Question 2
              Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'I have felt calm and relax',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (questionTwoValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- At no time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionTwoValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Some of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionTwoValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Less than half of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionTwoValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- More than half of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionTwoValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Most of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionTwoValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- All the time.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      Slider(
                          value: questionTwoValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: questionTwoValue.toStringAsFixed(0),
                          activeColor: const Color(0xff7DB9B6),
                          thumbColor: const Color(0xff4D455D),
                          onChanged: (value) {
                            setState(() {
                              questionTwoValue = value;
                            });
                          })
                    ]),
              ),

              //Question 3
              Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'I have felt active and vigorous',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (questionThreeValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- At no time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionThreeValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Some of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionThreeValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Less than half of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionThreeValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- More than half of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionThreeValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Most of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionThreeValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- All the time.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      Slider(
                          value: questionThreeValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: questionThreeValue.toStringAsFixed(0),
                          activeColor: const Color(0xff7DB9B6),
                          thumbColor: const Color(0xff4D455D),
                          onChanged: (value) {
                            setState(() {
                              questionThreeValue = value;
                            });
                          })
                    ]),
              ),

              //Question 4
              Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'I woke up and feeling fresh and rested',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (questionFourValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- At no time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionFourValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Some of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionFourValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Less than half of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionFourValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- More than half of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionFourValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Most of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionFourValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- All the time.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      Slider(
                          value: questionFourValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: questionFourValue.toStringAsFixed(0),
                          activeColor: const Color(0xff7DB9B6),
                          thumbColor: const Color(0xff4D455D),
                          onChanged: (value) {
                            setState(() {
                              questionFourValue = value;
                            });
                          })
                    ]),
              ),
              //Question 5
              Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My daily life has been filled with things that interest me',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (questionFiveValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- At no time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionFiveValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Some of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionFiveValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Less than half of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionFiveValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- More than half of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionFiveValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- Most of the time',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      else if (questionFiveValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text('- All the time.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      Slider(
                          value: questionFiveValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: questionFiveValue.toStringAsFixed(0),
                          activeColor: const Color(0xff7DB9B6),
                          thumbColor: const Color(0xff4D455D),
                          onChanged: (value) {
                            setState(() {
                              questionFiveValue = value;
                            });
                          })
                    ]),
              ),

              Container(
                width: 100,
                margin: const EdgeInsets.all(20),
                height: 30,
                child: ElevatedButton(
                  onPressed: _submitForm, // Call the submit form function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 19, 195, 122),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
