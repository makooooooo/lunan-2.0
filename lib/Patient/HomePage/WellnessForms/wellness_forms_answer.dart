import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class WellnessFormsAnswer extends StatelessWidget {
  final Map<String, dynamic> formData;

  const WellnessFormsAnswer({required this.formData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateSubmitted = formData['DateSubmitted'] as String;
    final wellnessQ1Value = formData['WellnessQ1'].toString();
    final wellnessQ2Value = formData['WellnessQ2'].toString();
    final wellnessQ3Value = formData['WellnessQ3'].toString();
    final wellnessQ4Value = formData['WellnessQ4'].toString();

    // Update values if necessary
    String updatedWellnessQ1Value = wellnessQ1Value;
    if (wellnessQ1Value == '1.0') {
      updatedWellnessQ1Value = 'Not a Very Happy Person';
    } else if (wellnessQ1Value == '2.0') {
      updatedWellnessQ1Value = 'Not a Happy Person';
    } else if (wellnessQ1Value == '3.0') {
      updatedWellnessQ1Value = 'Somewhat Happy';
    } else if (wellnessQ1Value == '4.0') {
      updatedWellnessQ1Value = 'A moderately happy person';
    } else if (wellnessQ1Value == '5.0') {
      updatedWellnessQ1Value = 'A happy person';
    } else if (wellnessQ1Value == '6.0') {
      updatedWellnessQ1Value = 'A Very Happy Person';
    } else if (wellnessQ1Value == '7.0') {
      updatedWellnessQ1Value = 'A Very Happy and Joyful Person';
    }

    String updatedWellnessQ2Value = wellnessQ2Value;
    if (wellnessQ2Value == '1.0') {
      updatedWellnessQ2Value = 'Not a Very Happy Person';
    } else if (wellnessQ2Value == '2.0') {
      updatedWellnessQ2Value = 'Not a Happy Person';
    } else if (wellnessQ2Value == '3.0') {
      updatedWellnessQ2Value = 'Somewhat Happy';
    } else if (wellnessQ2Value == '4.0') {
      updatedWellnessQ2Value = 'A moderately happy person';
    } else if (wellnessQ2Value == '5.0') {
      updatedWellnessQ2Value = 'A happy person';
    } else if (wellnessQ2Value == '6.0') {
      updatedWellnessQ2Value = 'A Very Happy Person';
    } else if (wellnessQ2Value == '7.0') {
      updatedWellnessQ2Value = 'A Very Happy and Joyful Person';
    }

    String updatedWellnessQ3Value = wellnessQ3Value;
    if (wellnessQ3Value == '1.0') {
      updatedWellnessQ3Value = 'Not a Very Happy Person';
    } else if (wellnessQ3Value == '2.0') {
      updatedWellnessQ3Value = 'Not a Happy Person';
    } else if (wellnessQ3Value == '3.0') {
      updatedWellnessQ3Value = 'Somewhat Happy';
    } else if (wellnessQ3Value == '4.0') {
      updatedWellnessQ3Value = 'A moderately happy person';
    } else if (wellnessQ3Value == '5.0') {
      updatedWellnessQ3Value = 'A happy person';
    } else if (wellnessQ3Value == '6.0') {
      updatedWellnessQ3Value = 'A Very Happy Person';
    } else if (wellnessQ3Value == '7.0') {
      updatedWellnessQ3Value = 'A Very Happy and Joyful Person';
    }

    String updatedWellnessQ4Value = wellnessQ4Value;
    if (wellnessQ4Value == '1.0') {
      updatedWellnessQ4Value = 'Not a Very Happy Person';
    } else if (wellnessQ4Value == '2.0') {
      updatedWellnessQ4Value = 'Not a Happy Person';
    } else if (wellnessQ4Value == '3.0') {
      updatedWellnessQ4Value = 'Somewhat Happy';
    } else if (wellnessQ4Value == '4.0') {
      updatedWellnessQ4Value = 'A moderately happy person';
    } else if (wellnessQ4Value == '5.0') {
      updatedWellnessQ4Value = 'A happy person';
    } else if (wellnessQ4Value == '6.0') {
      updatedWellnessQ4Value = 'A Very Happy Person';
    } else if (wellnessQ4Value == '7.0') {
      updatedWellnessQ4Value = 'A Very Happy and Joyful Person';
    }

    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        backgroundColor: const Color(0xff7DB9B6),
      ),
   
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('MoodTracker')
            .where('DateSubmitted', isEqualTo: dateSubmitted)
            .snapshots(),
        builder: (context, snapshot) {
  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
    QueryDocumentSnapshot moodTrackerData = snapshot.data!.docs.first;
    String moodValue = moodTrackerData.get('Mood').toString();

            return Center(
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
                              'Wellness Form # 1',
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      'In general, I consider myself:\n',
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
                                                      'Compared to most of my peers, I consider myself:\n',
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
                                                      'Some people are generally very happy. They enjoy life regardless of what is going on, getting the most out of everything. To what extent does this characterization describe you?: \n',
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
                                                      'Some people are generally very happy. They enjoy life regardless of what is going on, getting the most out of everything. To what extent does this characterization describe you?: \n',
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
                                                  text: 'Your mood this day: \n',
                                                ),
                                                TextSpan(
                                                  text: moodValue,
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
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
