import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/WellnessForms/wellness_form_chooser.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class WellnessFormQuestion extends StatefulWidget {
  WellnessFormQuestion({super.key});

  @override
  State<WellnessFormQuestion> createState() => _WellnessFormQuestion();
}

class _WellnessFormQuestion extends State<WellnessFormQuestion> {
  double questionOneValue = 1;
  double questionTwoValue = 1;
  double questionThreeValue = 1;
  double questionFourValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5E9CF),
        appBar: AppBar(
          backgroundColor: const Color(0xff7DB9B6),
        ),
        endDrawer: Drawer(
          child: MenuList(),
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
                        if (questionOneValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not a very happy person.')
                            ),
                          )
                       
                        else if (questionOneValue == 7)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A very happy person.')
                            ),
                          ),
                        Slider(
                            value: questionOneValue,
                            min: 1,
                            max: 7,
                            divisions: 7,
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
                        if (questionTwoValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Less happy.')
                            ),
                          )
                       
                        else if (questionTwoValue == 7)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- More happy.')
                            ),
                          ),
                        Slider(
                            value: questionTwoValue,
                            min: 1,
                            max: 7,
                            divisions: 7,
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
                        if (questionThreeValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not at all.')
                            ),
                          )
                       
                        else if (questionThreeValue == 7)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A great deal.')
                            ),
                          ),
                        Slider(
                            value: questionThreeValue,
                            min: 1,
                            max: 7,
                            divisions: 7,
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
                        
                      
                        if (questionFourValue == 1)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- Not at all.')
                            ),
                          )
                       
                        else if (questionFourValue == 7)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              ('- A great deal.')
                            ),
                          ),
                        Slider(
                            value: questionFourValue,
                            min: 1,
                            max: 7,
                            divisions: 7,
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WellnessFormChooser()),
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
        ));
  }
}
