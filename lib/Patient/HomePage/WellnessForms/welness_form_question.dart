import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Dashboard/dashboard.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WellnessFormQuestion extends StatefulWidget {
  WellnessFormQuestion({Key? key}) : super(key: key);

  @override
  State<WellnessFormQuestion> createState() => _WellnessFormQuestion();
}

class _WellnessFormQuestion extends State<WellnessFormQuestion> {
final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  double questionOneValue = 0;
  double questionTwoValue = 0;
  double questionThreeValue = 0;
  double questionFourValue = 0;



Future<void> _submitForm() async {
    final User? user = _auth.currentUser;
    final uid = user?.uid;

    // Get the current date
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    final formData = {
      'WellnessQ1': questionOneValue,
      'WellnessQ2': questionTwoValue,
      'WellnessQ3': questionThreeValue,
      'WellnessQ4': questionFourValue,
      'UID': uid,
      'DateSubmitted': formattedDate,
    };

    try {
      await FirebaseFirestore.instance.collection('WellnessForm').add(formData);
      showDialog(
        context: context,
        builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Form data submitted successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Pop the current route
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
                    'Wellness Question Forms',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                      color: Color(0xff4D455D),
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xff4D455D), // Customize the color of the line
                  thickness: 2, // Adjust the thickness of the line
                ),

                //Question 1
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'In general, I consider myself : ',
                          style: TextStyle(
                              color: Color(0xff4D455D),
                              fontWeight: FontWeight.bold),
                        ),
                        if (questionOneValue == 0)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not a very happy person.')
                            ),
                          )


                          else if (questionOneValue == 1)



                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not a happy person.')
                            ),
                          )

                          else if (questionOneValue == 2)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Somewhat happy person.')
                            ),
                          )
                          else if (questionOneValue == 3)

                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A moderately happy person.')
                            ),
                          )

                          else if (questionOneValue == 4)

                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A happy person.')
                            ),
                          )
                        else if (questionOneValue == 5)


                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A very happy person.')
                            ),
                          )
                          else if (questionOneValue == 6)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A very happy and joyful person.')
                            ),
                          ),
                        Slider(
                            value: questionOneValue,
                            min: 0,

                            max: 6,
                            divisions: 6,
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
                  margin: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Compared to most of my peers, I consider myself : ',
                          style: TextStyle(
                              color: Color(0xff4D455D),
                              fontWeight: FontWeight.bold),
                        ),
                       if (questionTwoValue == 0)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not a very happy person.')
                            ),
                          )

                          else if (questionTwoValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not a happy person.')
                            ),
                          )
                          else if (questionTwoValue == 2)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Somewhat happy person.')
                            ),
                          )
                          else if (questionTwoValue == 3)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A mederately happy person.')
                            ),
                          )
                          else if (questionTwoValue == 4)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A happy person.')
                            ),
                          )
                        else if (questionTwoValue == 5)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A very happy person.')
                            ),
                          )
                          else if (questionTwoValue == 6)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A very happy and joyful person.')

                            ),
                          ),
                        Slider(
                            value: questionTwoValue,
                            min: 0,

                            max: 6,
                            divisions: 6,

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
                  margin: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Some people are generally very happy. They enjoy life regardless of what is going on, getting the most out of everything. To what extent does this characterization describe you?',
                          style: TextStyle(
                              color: Color(0xff4D455D),
                              fontWeight: FontWeight.bold),
                        ),
                         if (questionThreeValue == 0)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not a very happy person.')
                            ),
                          )
                          else if (questionThreeValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not a happy person.')
                            ),
                          )
                          else if (questionThreeValue == 2)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(

                              ('- Somewhat happy person.')
                            ),
                          )
                          else if (questionThreeValue == 3)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A moderately happy person.')
                            ),
                          )
                          else if (questionThreeValue == 4)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A happy person.')
                            ),
                          )
                        else if (questionThreeValue == 5)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A very happy person.')
                            ),
                          )
                          else if (questionThreeValue == 6)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A very happy joyful person.')

                            ),
                          ),
                        Slider(
                            value: questionThreeValue,
                            min: 0,

                            max: 6,
                            divisions: 6,

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
                  margin: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Some people are generally not very happy. Although they are not depressed, they never seem as happy as they\nmight be. To what extent does this characterization describe you?',
                          style: TextStyle(
                              color: Color(0xff4D455D),
                              fontWeight: FontWeight.bold),
                        ),
                        
                      
                       if (questionFourValue == 0)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not a very happy person.')
                            ),
                          )

                          else if (questionFourValue == 1)

                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not a happy person.')

                            ),
                          )
                          else if (questionFourValue == 2)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Somewhat happy person.')
                            ),
                          )
                          else if (questionFourValue == 3)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A moderately happy person.')
                            ),
                          )
                          else if (questionFourValue == 4)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A happy person.')
                            ),
                          )
                        else if (questionFourValue == 5)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A very happy person.')
                            ),
                          )
                          else if (questionFourValue == 6)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A very happy and joyful person.')

                            ),
                          ),
                        Slider(
                            value: questionFourValue,
                            min: 0,

                            max: 6,
                            divisions: 6,
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
        ));
  }
}
