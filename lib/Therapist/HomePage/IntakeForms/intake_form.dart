import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';
import 'package:lunan/Therapist/HomePage/chat.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';

class IntakeForm extends StatefulWidget {
  const IntakeForm({Key? key}) : super(key: key);

  @override
  _IntakeFormState createState() => _IntakeFormState();
}

class _IntakeFormState extends State<IntakeForm> {
  bool _isCheckedmale = false;
  bool _isCheckedfemale = false;
  bool _isCheckedothers = false;
  late DateTime now;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    formattedDate = DateFormat('yyyy / MM / dd').format(now);
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
              MaterialPageRoute(builder: (context) => PatientInfo()),
            );
          },
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Text(
                  'BLOOMFIELDS WELLNESS INSTITUTE (BWI)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: const Text(
                  'bloomfieldswellness@gmail.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: const Text(
                  'Adult Intake Form',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                child: const Text(
                  'Please provide the following information for my records. Leave blank any question you would rather not answer. Information you provide here is held to the same standards of confidentiality as our therapy. Please print out this form and bring it to your first session.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Cell Phone Number:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Home Phone Number:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Email:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Sexual Preference:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Marital Status:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Previous Psychotherapy:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Current prescribed psychiatric meditations:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Emergency contact person name:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Emergency contact person number:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Suicidal thoughts:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Past suicidal thoughts:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Current homicidal thoughts:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Previous homicidal thoughts:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Current physical health:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Last physical Examination:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'List of chronis health problem:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Any Allergies:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'List of maintenance medication:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Regular intake of alcohol:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Engage in recreational drug use:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Habit of Smoke(# of cigar per day):',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Any past head injury:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Lately significant changes or stressors:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Depressed Mood or Sadness:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Anxiety:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Phobias:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Hallucinations:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Sexual Abuse:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Physical Abuse:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                margin: EdgeInsets.only(left: 10),
                child: const Text(
                  'Emotional Abuse:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(0xff4D455D),
                  ),
                ),
              ),
              ),
               Align(
                alignment: Alignment.centerLeft,
                child:Container(
                height: 25,
                width: 350,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10 ),
                child: TextField(
                  onChanged: (value) {
                    // Handle the text field value changes here
                  },
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
