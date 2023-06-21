import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xff7DB9B6),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => chatT()),
              );
            },
            icon: Icon(
              Icons.messenger,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: MenuListT(),
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
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Name:'),
                  ),
                  Container(
                    width: 300,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextField(
                      onChanged: (value) {
                        // Handle the text field value changes here
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('(Last)'), Text('(First)'), Text('(MI)')],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Your Birth Date :'),
                  ),
                  Container(
                    width: 100,
                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: TextField(
                      onChanged: (value) {
                        // Handle the text field value changes here
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Text('Age:'),
                  ),
                  Container(
                    width: 50,
                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: TextField(
                      onChanged: (value) {
                        // Handle the text field value changes here
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 200),
                child: Text('Today\'s Date : $formattedDate'),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text('Gender:'),
                  ),

                  Checkbox(
                    value: _isCheckedmale,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedmale = value!;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text('Male'),
                  ),
                  
                  Checkbox(
                    value: _isCheckedfemale,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedfemale = value!;
                      });
                    },
                  ),
                  Container(
                    
                    child: Text('Female'),
                  ),
                   Checkbox(
                    value: _isCheckedothers,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCheckedothers = value!;
                      });
                    },
                  ),
                  Container(
                    child: Text('Others'),
                  ),
                  
                ],
              ),
               Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Address:'),
                  ),
                  Container(
                    width: 300,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: TextField(
                      onChanged: (value) {
                        // Handle the text field value changes here
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('(Street and Number)'), Text('(City)'), Text('(Province)'),Text('(Zip)')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
