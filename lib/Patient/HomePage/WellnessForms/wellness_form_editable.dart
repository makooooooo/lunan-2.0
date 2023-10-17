import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_forms.dart';
import 'package:lunan/Patient/HomePage/WellnessForms/wellness_form.dart';

class WellnessFormEditable extends StatefulWidget {
  final Map<String, dynamic> formData;
  final String documentId;
  const WellnessFormEditable(
      {required this.formData, required this.documentId, Key? key})
      : super(key: key);

  @override
  State<WellnessFormEditable> createState() => _WellnessFormEditableState();
}

class _WellnessFormEditableState extends State<WellnessFormEditable> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  double upQuestionOneValue = 0;
  double upQuestionTwoValue = 0;
  double upQuestionThreeValue = 0;
  double upQuestionFourValue = 0;
  String getDocumentId = '';

  late String dateSubmitted;
  late double wellnessQ1Value;
  late double wellnessQ2Value;
  late double wellnessQ3Value;
  late double wellnessQ4Value;
  late String documentId;

  @override
  void initState() {
    super.initState();
    dateSubmitted = widget.formData['DateSubmitted'] as String;
    wellnessQ1Value = double.parse(widget.formData['WellnessQ1'].toString());
    wellnessQ2Value = double.parse(widget.formData['WellnessQ2'].toString());
    wellnessQ3Value = double.parse(widget.formData['WellnessQ3'].toString());
    wellnessQ4Value = double.parse(widget.formData['WellnessQ4'].toString());
    documentId = widget.documentId;

    upQuestionOneValue = wellnessQ1Value;
    upQuestionTwoValue = wellnessQ2Value;
    upQuestionThreeValue = wellnessQ3Value;
    upQuestionFourValue = wellnessQ4Value;
    getDocumentId = documentId;
  }

  Future<void> _updateForm() async {
    final User? user = _auth.currentUser;
    final uid = user?.uid;
    final collection = FirebaseFirestore.instance.collection('WellnessForm');
    final documentId = getDocumentId;

    // Get the current date
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    final formData = {
      'WellnessQ1': upQuestionOneValue,
      'WellnessQ2': upQuestionTwoValue,
      'WellnessQ3': upQuestionThreeValue,
      'WellnessQ4': upQuestionFourValue,
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
              MaterialPageRoute(builder: (context) => WellnessForms()),
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
                      if (upQuestionOneValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Not a very happy person.')),
                        )
                      else if (upQuestionOneValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Not a happy person.')),
                        )
                      else if (upQuestionOneValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Somewhat happy person.')),
                        )
                      else if (upQuestionOneValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A moderately happy person.')),
                        )
                      else if (upQuestionOneValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A happy person.')),
                        )
                      else if (upQuestionOneValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A very happy person.')),
                        )
                      else if (upQuestionOneValue == 6)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child:
                              const Text(('- A very happy and joyful person.')),
                        ),
                      Slider(
                          value: upQuestionOneValue,
                          min: 0,
                          max: 6,
                          divisions: 6,
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
                        'Compared to most of my peers, I consider myself : ',
                        style: TextStyle(
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (upQuestionTwoValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Not a very happy person.')),
                        )
                      else if (upQuestionTwoValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Not a happy person.')),
                        )
                      else if (upQuestionTwoValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Somewhat happy person.')),
                        )
                      else if (upQuestionTwoValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A moderately happy person.')),
                        )
                      else if (upQuestionTwoValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A happy person.')),
                        )
                      else if (upQuestionTwoValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A very happy person.')),
                        )
                      else if (upQuestionTwoValue == 6)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child:
                              const Text(('- A very happy and joyful person.')),
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
                        'Some people are generally very happy. They enjoy life regardless of what is going on, getting the most out of everything. To what extent does this characterization describe you? : ',
                        style: TextStyle(
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (upQuestionThreeValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Not a very happy person.')),
                        )
                      else if (upQuestionThreeValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Not a happy person.')),
                        )
                      else if (upQuestionThreeValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Somewhat happy person.')),
                        )
                      else if (upQuestionThreeValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A moderately happy person.')),
                        )
                      else if (upQuestionThreeValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A happy person.')),
                        )
                      else if (upQuestionThreeValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A very happy person.')),
                        )
                      else if (upQuestionThreeValue == 6)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child:
                              const Text(('- A very happy and joyful person.')),
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
                        'Some people are generally very happy. They enjoy life regardless of what is going on, getting the most out of everything. To what extent does this characterization describe you? : ',
                        style: TextStyle(
                            color: Color(0xff4D455D),
                            fontWeight: FontWeight.bold),
                      ),
                      if (upQuestionFourValue == 0)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Not a very happy person.')),
                        )
                      else if (upQuestionFourValue == 1)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Not a happy person.')),
                        )
                      else if (upQuestionFourValue == 2)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- Somewhat happy person.')),
                        )
                      else if (upQuestionFourValue == 3)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A moderately happy person.')),
                        )
                      else if (upQuestionFourValue == 4)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A happy person.')),
                        )
                      else if (upQuestionFourValue == 5)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Text(('- A very happy person.')),
                        )
                      else if (upQuestionFourValue == 6)
                        Container(
                          margin: const EdgeInsets.all(10),
                          child:
                              const Text(('- A very happy and joyful person.')),
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
