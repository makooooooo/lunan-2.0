import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_form_chooser.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class WeeklyFormsQuestion extends StatefulWidget {
  WeeklyFormsQuestion({super.key});
  


  @override
  State<WeeklyFormsQuestion> createState() => _WeeklyFormsQuestionState();
}

class _WeeklyFormsQuestionState extends State<WeeklyFormsQuestion> {
      double questionOneValue = 0;
  double questionTwoValue = 0;
  double questionThreeValue = 0;
  double questionFourValue = 0;
  double questionFiveValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        backgroundColor: const Color(0xff7DB9B6),
      ),
      drawer: Drawer(
        child: MenuList(),
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
                        if (questionOneValue == 0)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- At no time')
                            ),
                          )
                        else if (questionOneValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Some of the time')
                            ),
                          )
                        else if (questionOneValue == 2)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Less than half of the time')
                            ),
                          )
                        else if (questionOneValue == 3)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- More than half of the time')
                            ),
                          )
                        else if (questionOneValue == 4)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Most of the time')
                            ),
                          )
                        else if (questionOneValue == 5)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- All the time')
                            ),
                          ),
                        Slider(
                            value: questionOneValue,
                            min: 0,
                            max: 5,
                            divisions: 5,
                            label: (5 - questionOneValue).toStringAsFixed(0),
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
                          'I have felt calm and relax',
                          style: TextStyle(
                              color: Color(0xff4D455D),
                              fontWeight: FontWeight.bold),
                        ),
                        if (questionTwoValue == 0)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- At no time')
                            ),
                          )
                        else if (questionTwoValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Some of the time')
                            ),
                          )
                        else if (questionTwoValue == 2)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Less than half of the time')
                            ),
                          )
                        else if (questionTwoValue == 3)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- More than half of the time')
                            ),
                          )
                        else if (questionTwoValue == 4)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Most of the time')
                            ),
                          )
                        else if (questionTwoValue == 5)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- All the time.')
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
                        if (questionThreeValue == 0)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- At no time')
                            ),
                          )
                        else if (questionThreeValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Some of the time')
                            ),
                          )
                        else if (questionThreeValue == 2)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Less than half of the time')
                            ),
                          )
                        else if (questionThreeValue == 3)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- More than half of the time')
                            ),
                          )
                        else if (questionThreeValue == 4)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Most of the time')
                            ),
                          )
                        else if (questionThreeValue == 5)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- All the time.')
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
                        
                      
                        if (questionFourValue == 0)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- At no time')
                            ),
                          )
                        else if (questionFourValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Some of the time')
                            ),
                          )
                        else if (questionFourValue == 2)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Less than half of the time')
                            ),
                          )
                        else if (questionFourValue == 3)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- More than half of the time')
                            ),
                          )
                        else if (questionFourValue == 4)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Most of the time')
                            ),
                          )
                        else if (questionFourValue == 5)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- All the time.')
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
                        
                      
                        if (questionFiveValue == 0)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- At no time')
                            ),
                          )
                        else if (questionFiveValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Some of the time')
                            ),
                          )
                        else if (questionFiveValue == 2)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Less than half of the time')
                            ),
                          )
                        else if (questionFiveValue == 3)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- More than half of the time')
                            ),
                          )
                        else if (questionFiveValue == 4)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Most of the time')
                            ),
                          )
                        else if (questionFiveValue == 5)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- All the time.')
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WeeklyFormChooser()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                           backgroundColor: Color.fromARGB(255, 19, 195, 122),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Set the corner radius here
                            ),
                          ),
                          child: const Text(
                            'Submit',
                          )),
                    ),
          ],
        ),
      ),
      
      )
    );
  }
}
