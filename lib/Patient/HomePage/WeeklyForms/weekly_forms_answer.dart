import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_form_chooser.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_forms.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class WeeklyFormsAnswer extends StatelessWidget {
  final Map<String, dynamic> formData;

  const WeeklyFormsAnswer({required this.formData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateSubmitted = formData['DateSubmitted'] as String;
    final wellnessQ1Value = formData['WeeklyQ1'].toString();
    final wellnessQ2Value = formData['WeeklyQ2'].toString();
    final wellnessQ3Value = formData['WeeklyQ3'].toString();
    final wellnessQ4Value = formData['WeeklyQ4'].toString();
    final wellnessQ5Value = formData['WeeklyQ5'].toString();

    // Update values if necessary
    String updatedWellnessQ1Value = wellnessQ1Value;
    if (wellnessQ1Value == '1.0') {
      updatedWellnessQ1Value = 'At no time';
    } else if (wellnessQ1Value == '2.0') {
      updatedWellnessQ1Value = 'Some of the time';
    } else if (wellnessQ1Value == '3.0') {
      updatedWellnessQ1Value = 'Occasionally';
    } else if (wellnessQ1Value == '4.0') {
      updatedWellnessQ1Value = 'Most of the Time';
    } else if (wellnessQ1Value == '5.0') {
      updatedWellnessQ1Value = 'All the time';
    }

    String updatedWellnessQ2Value = wellnessQ2Value;
    if (wellnessQ2Value == '1.0') {
      updatedWellnessQ2Value = 'At no time';
    } else if (wellnessQ2Value == '2.0') {
      updatedWellnessQ2Value = 'Some of the time';
    } else if (wellnessQ2Value == '3.0') {
      updatedWellnessQ2Value = 'Occasionally';
    } else if (wellnessQ2Value == '4.0') {
      updatedWellnessQ2Value = 'Most of the Time';
    } else if (wellnessQ2Value == '5.0') {
      updatedWellnessQ2Value = 'All the time';
    }

    String updatedWellnessQ3Value = wellnessQ3Value;
    if (wellnessQ3Value == '1.0') {
      updatedWellnessQ3Value = 'At no time';
    } else if (wellnessQ3Value == '2.0') {
      updatedWellnessQ3Value = 'Some of the time';
    } else if (wellnessQ3Value == '3.0') {
      updatedWellnessQ3Value = 'Occasionally';
    } else if (wellnessQ3Value == '4.0') {
      updatedWellnessQ3Value = 'Most of the Time';
    } else if (wellnessQ3Value == '5.0') {
      updatedWellnessQ3Value = 'All the time';
    }

    String updatedWellnessQ4Value = wellnessQ4Value;
    if (wellnessQ4Value == '1.0') {
      updatedWellnessQ4Value = 'At no time';
    } else if (wellnessQ4Value == '2.0') {
      updatedWellnessQ4Value = 'Some of the time';
    } else if (wellnessQ4Value == '3.0') {
      updatedWellnessQ4Value = 'Occasionally';
    } else if (wellnessQ4Value == '4.0') {
      updatedWellnessQ4Value = 'Most of the Time';
    } else if (wellnessQ4Value == '5.0') {
      updatedWellnessQ4Value = 'All the time';
    }

    String updatedWellnessQ5Value = wellnessQ5Value;
    if (wellnessQ5Value == '1.0') {
      updatedWellnessQ5Value = 'At no time';
    } else if (wellnessQ5Value == '2.0') {
      updatedWellnessQ5Value = 'Some of the time';
    } else if (wellnessQ5Value == '3.0') {
      updatedWellnessQ5Value = 'Occasionally';
    } else if (wellnessQ5Value == '4.0') {
      updatedWellnessQ5Value = 'Most of the Time';
    } else if (wellnessQ5Value == '5.0') {
      updatedWellnessQ5Value = 'All the time';
    }

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
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              elevation: 4, // The depth of the card shadow
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15), // Change the border radius value
                side: const BorderSide(
                  color: Color(0xff7DB9B6), // Border color
                  width: 2, // Border width
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20), // Padding inside the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'Weekly Form # 1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat   ',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4D455D),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            dateSubmitted,
                            style: const TextStyle(
                              fontFamily: 'Montserrat   ',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4D455D),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),
                    const Text(
                      'I have felt cheerful and in good spirits. : ', // Replace with your description
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        color: Color(0xff4D455D),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      updatedWellnessQ1Value, // Replace with your description
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //2
                    const SizedBox(height: 10),
                    const Text(
                      'I have felt calm and relaxed. : ', // Replace with your description
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        color: Color(0xff4D455D),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      updatedWellnessQ2Value, // Replace with your description
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //3
                    const SizedBox(height: 10),
                    const Text(
                      'I have felt active and vigorous. :', // Replace with your description
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        color: Color(0xff4D455D),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      updatedWellnessQ3Value, // Replace with your description
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //4
                    const SizedBox(height: 10),
                    const Text(
                      'I woke up feeling fresh and rested. :', // Replace with your description
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        color: Color(0xff4D455D),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      updatedWellnessQ4Value, // Replace with your description
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //5
                    const SizedBox(height: 10),
                    const Text(
                      'My daily life has been filled with things that interest me. :', // Replace with your description
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        color: Color(0xff4D455D),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      updatedWellnessQ5Value, // Replace with your description
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),

                    // You can add more widgets here
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
