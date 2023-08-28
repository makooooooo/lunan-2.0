import 'package:flutter/material.dart';
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
        backgroundColor: const Color(0xff7DB9B6),
      ),
      
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 630,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff7DB9B6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Weekly Form # 1',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 25, 10, 20),
                    decoration: BoxDecoration(
                      color: const Color(0xff4D455D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Date Submitted: $dateSubmitted',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffF5E9CF),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            decoration: const BoxDecoration(
                              color: Color(0xffF5E9CF),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text:
                                                'I have felt cheerful and in good spirits:\n',
                                          ),
                                          TextSpan(
                                            text: updatedWellnessQ1Value,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text:
                                                'I have felt calm and relaxed:\n',
                                          ),
                                          TextSpan(
                                            text: updatedWellnessQ2Value,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text:
                                                'I have felt active and vigorous: \n',
                                          ),
                                          TextSpan(
                                            text: updatedWellnessQ3Value,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text:
                                                'I woke up feeling fresh and rested.: \n',
                                          ),
                                          TextSpan(
                                            text: updatedWellnessQ4Value,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text:
                                                'My daily life has been filled with things that interest me.: \n',
                                          ),
                                          TextSpan(
                                            text: updatedWellnessQ5Value,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to previous screen
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff4D455D),
                      onPrimary: const Color(0xffF5E9CF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
