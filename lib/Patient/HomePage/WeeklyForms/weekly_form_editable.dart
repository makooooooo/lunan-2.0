import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_forms.dart';

class WeeklyFormEdit extends StatefulWidget {
  final Map<String, dynamic> formData;
  final String documentId;
  const WeeklyFormEdit(
      {required this.formData, required this.documentId, Key? key})
      : super(key: key);

  @override
  State<WeeklyFormEdit> createState() => _WeeklyFormEditState();
}

class _WeeklyFormEditState extends State<WeeklyFormEdit> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  double upQuestionOneValue = 0;
  double upQuestionTwoValue = 0;
  double upQuestionThreeValue = 0;
  double upQuestionFourValue = 0;
  double upQuestionFiveValue = 0;
  String getDocumentId = '';

  late String dateSubmitted;
  late double wellnessQ1Value;
  late double wellnessQ2Value;
  late double wellnessQ3Value;
  late double wellnessQ4Value;
  late double wellnessQ5Value;
  late String documentId;

  @override
  void initState() {
    super.initState();
    dateSubmitted = widget.formData['DateSubmitted'] as String;
    wellnessQ1Value = double.parse(widget.formData['WeeklyQ1'].toString());
    wellnessQ2Value = double.parse(widget.formData['WeeklyQ2'].toString());
    wellnessQ3Value = double.parse(widget.formData['WeeklyQ3'].toString());
    wellnessQ4Value = double.parse(widget.formData['WeeklyQ4'].toString());
    wellnessQ5Value = double.parse(widget.formData['WeeklyQ5'].toString());
    documentId = widget.documentId;

    upQuestionOneValue = wellnessQ1Value;
    upQuestionTwoValue = wellnessQ2Value;
    upQuestionThreeValue = wellnessQ3Value;
    upQuestionFourValue = wellnessQ4Value;
    upQuestionFiveValue = wellnessQ5Value;
    getDocumentId = documentId;
  }

  Future<void> _updateForm() async {
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    final collection = FirebaseFirestore.instance.collection('WeeklyForm');
    final documentId = getDocumentId;

    // Get the current date
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    final formData = {
      'WeeklyQ1': upQuestionOneValue,
      'WeeklyQ2': upQuestionTwoValue,
      'WeeklyQ3': upQuestionThreeValue,
      'WeeklyQ4': upQuestionFourValue,
      'WeeklyQ5': upQuestionFiveValue,
      'UID': uid,
      'DateSubmitted': formattedDate,
    };

    try {
      await collection.doc(documentId).update(formData);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Form data updated!'),
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
              MaterialPageRoute(builder: (context) => WeeklyForms()),
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
                  ),
                ),
              ),

              const Divider(
                color: Color(0xff4D455D), // Customize the color of the line
                thickness: 2, // Adjust the thickness of the line
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
                      if (upQuestionOneValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- At no time')),
                        )
                      else if (upQuestionOneValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Some of the time')),
                        )
                      else if (upQuestionOneValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Less than half of the time')),
                        )
                      else if (upQuestionOneValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- More than half of the time')),
                        )
                      else if (upQuestionOneValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Most of the time')),
                        )
                      else if (upQuestionOneValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- All the time')),
                        ),
                      Slider(
                          value: upQuestionOneValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: upQuestionOneValue.toStringAsFixed(0),
                          activeColor: const Color(0xff7DB9B6),
                          thumbColor: const Color(0xff4D455D),
                          onChanged: (value) {
                            setState(() {
                              upQuestionOneValue = value.toDouble();
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
                        'I have felt calm and relax',
                        style: TextStyle(
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (upQuestionTwoValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- At no time')),
                        )
                      else if (upQuestionTwoValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Some of the time')),
                        )
                      else if (upQuestionTwoValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Less than half of the time')),
                        )
                      else if (upQuestionTwoValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- More than half of the time')),
                        )
                      else if (upQuestionTwoValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Most of the time')),
                        )
                      else if (upQuestionTwoValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- All the time.')),
                        ),
                      Slider(
                          value: upQuestionTwoValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: upQuestionTwoValue.toStringAsFixed(0),
                          activeColor: const Color(0xff7DB9B6),
                          thumbColor: const Color(0xff4D455D),
                          onChanged: (value) {
                            setState(() {
                              upQuestionTwoValue = value;
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
                        'I have felt active and vigorous',
                        style: TextStyle(
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (upQuestionThreeValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- At no time')),
                        )
                      else if (upQuestionThreeValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Some of the time')),
                        )
                      else if (upQuestionThreeValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Less than half of the time')),
                        )
                      else if (upQuestionThreeValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- More than half of the time')),
                        )
                      else if (upQuestionThreeValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Most of the time')),
                        )
                      else if (upQuestionThreeValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- All the time.')),
                        ),
                      Slider(
                          value: upQuestionThreeValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: upQuestionThreeValue.toStringAsFixed(0),
                          activeColor: const Color(0xff7DB9B6),
                          thumbColor: const Color(0xff4D455D),
                          onChanged: (value) {
                            setState(() {
                              upQuestionThreeValue = value;
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
                        'I woke up and feeling fresh and rested',
                        style: TextStyle(
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (upQuestionFourValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- At no time')),
                        )
                      else if (upQuestionFourValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Some of the time')),
                        )
                      else if (upQuestionFourValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Less than half of the time')),
                        )
                      else if (upQuestionFourValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- More than half of the time')),
                        )
                      else if (upQuestionFourValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Most of the time')),
                        )
                      else if (upQuestionFourValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- All the time.')),
                        ),
                      Slider(
                          value: upQuestionFourValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: upQuestionFourValue.toStringAsFixed(0),
                          activeColor: const Color(0xff7DB9B6),
                          thumbColor: const Color(0xff4D455D),
                          onChanged: (value) {
                            setState(() {
                              upQuestionFourValue = value;
                            });
                          })
                    ]),
              ),
              //Question 5
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My daily life has been filled with things that interest me',
                        style: TextStyle(
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (upQuestionFiveValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- At no time')),
                        )
                      else if (upQuestionFiveValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Some of the time')),
                        )
                      else if (upQuestionFiveValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Less than half of the time')),
                        )
                      else if (upQuestionFiveValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- More than half of the time')),
                        )
                      else if (upQuestionFiveValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Most of the time')),
                        )
                      else if (upQuestionFiveValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- All the time.')),
                        ),
                      Slider(
                          value: upQuestionFiveValue,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          label: upQuestionFiveValue.toStringAsFixed(0),
                          activeColor: const Color(0xff7DB9B6),
                          thumbColor: const Color(0xff4D455D),
                          onChanged: (value) {
                            setState(() {
                              upQuestionFiveValue = value;
                            });
                          })
                    ]),
              ),

              Container(
                width: 100,
                margin: const EdgeInsets.all(20),
                height: 30,
                child: ElevatedButton(
                  onPressed: _updateForm, // Call the submit form function
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
