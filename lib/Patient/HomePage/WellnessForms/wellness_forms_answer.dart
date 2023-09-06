import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_forms.dart';
import 'package:lunan/Patient/HomePage/WellnessForms/wellness_form.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';

class WellnessFormsAnswer extends StatelessWidget {
  final Map<String, dynamic> formData;

  const WellnessFormsAnswer({required this.formData, Key? key})
      : super(key: key);

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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('MoodTracker')
            .where('DateSubmitted', isEqualTo: dateSubmitted)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            QueryDocumentSnapshot moodTrackerData = snapshot.data!.docs.first;
            String moodValue = moodTrackerData.get('Mood').toString();

            return SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.all(15),
                    elevation: 4, // The depth of the card shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Change the border radius value
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
                                  'Wellness Form # 1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat   ',
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4D455D),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  dateSubmitted,
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat   ',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4D455D),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 15),
                          const Text(
                            'In general, I consider myself : ', // Replace with your description
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xff4D455D),
                            ),
                          ),

                          const SizedBox(height: 10),
                          Text(
                            updatedWellnessQ1Value, // Replace with your description
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //2
                          const SizedBox(height: 10),
                          const Text(
                            'Compared to most of my peers, I consider myself:', // Replace with your description
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xff4D455D),
                            ),
                          ),

                          const SizedBox(height: 10),
                          Text(
                            updatedWellnessQ2Value, // Replace with your description
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //3
                          const SizedBox(height: 10),
                          const Text(
                           'Some people are generally very happy. They enjoy life regardless of what is going on, getting the most out of everything. To what extent does this characterization describe you?: ',

                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xff4D455D),
                            ),
                          ),

                          const SizedBox(height: 10),
                          Text(
                            updatedWellnessQ3Value, // Replace with your description
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //4
                          const SizedBox(height: 10),
                          const Text(
                            'Some people are generally very happy. They enjoy life regardless of what is going on, getting the most out of everything. To what extent does this characterization describe you?: ',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xff4D455D),
                            ),
                          ),

                          const SizedBox(height: 10),
                          Text(
                            updatedWellnessQ4Value, // Replace with your description
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //5
                          const SizedBox(height: 20),
                          
                          Row(
                            children: [
                                const Text(
                            'My mood for today is : ', // Replace with your description
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xff4D455D),
                            ),
                          ),

                          const SizedBox(height: 10),
                          Text(
                            moodValue, // Replace with your description
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                            ],
                          )
                          
                         

                          // You can add more widgets here
                        ],
                      ),
                    ),
                  )
                ],
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
