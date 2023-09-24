import 'package:flutter/material.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/WellnessForm/turnedin_wellnessforms.dart';
import 'package:lunan/firebase/auth_helper.dart';
import 'package:lunan/Therapist/HomePage/WellnessForm/verified_wellnessforms_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TurnedInWellnessInfo extends StatelessWidget {
  final String selectedPatientUID;
  final Map<String, dynamic>? formData;
  final String documentId;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TurnedInWellnessInfo({
    Key? key,
    required this.selectedPatientUID,
    this.formData,
    required this.documentId,
  }) : super(key: key);

  Future<void> _showVerificationDialog(BuildContext context, String documentId) async {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Verify Document'),
          content: Text('Are you sure you want to verify this document?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                // Close the dialog
                Navigator.of(dialogContext).pop();
                // Verify the document
                _verifyDocument(context);
              },
            ),
          ],
        );
      },
    );
  }

void _verifyDocument(BuildContext context) {
  if (documentId != null) {
    VerifyWellnessForm().updateWellnessFormStatus(context, selectedPatientUID, documentId).then((_) {
      // Show a Snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Document verified successfully.'),
      ));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => VerifedWellnessInfo(
            selectedPatientUID: selectedPatientUID,
            formData: formData,
            documentId: documentId,
          ),
        ),
      );
    }).catchError((error) {
      // Handle the error if the update fails
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error verifying document. Please try again later.'),
      ));
      print('Error updating document status: $error');
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Error: Document ID is null.'),
    ));
  }
}


  @override
  Widget build(BuildContext context) {
    print('Selected Patient UID: $selectedPatientUID');

    if (formData == null) {
      // Handle the case where formData is null
      return CircularProgressIndicator();
    }

    // Extract data from formData
    final dateSubmitted = formData!['DateSubmitted'] as String;
    final wellnessQ1Value = formData!['WellnessQ1'].toString();
    final wellnessQ2Value = formData!['WellnessQ2'].toString();
    final wellnessQ3Value = formData!['WellnessQ3'].toString();
    final wellnessQ4Value = formData!['WellnessQ4'].toString();

    String mapNumericValueToString(String numericValue) {
      switch (numericValue) {
        case '1.0':
          return 'Not a Very Happy Person';
        case '2.0':
          return 'Not a Happy Person';
        case '3.0':
          return 'Somewhat Happy';
        case '4.0':
          return 'A moderately happy person';
        case '5.0':
          return 'A happy person';
        case '6.0':
          return 'A Very Happy Person';
        case '7.0':
          return 'A Very Happy and Joyful Person';
        default:
          return '';
      }
    }

    final updatedWellnessQ1Value = mapNumericValueToString(wellnessQ1Value);
    final updatedWellnessQ2Value = mapNumericValueToString(wellnessQ2Value);
    final updatedWellnessQ3Value = mapNumericValueToString(wellnessQ3Value);
    final updatedWellnessQ4Value = mapNumericValueToString(wellnessQ4Value);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF5E9CF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TurnedINWellnessFroms(selectedPatientUID: selectedPatientUID, formData: formData),
              ),
            );
          },
          color: Color(0xff4D455D), // Change this color to your desired color
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Color(0xff7DB9B6),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
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
                              fontFamily: 'Montserrat',
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4D455D),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            dateSubmitted,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4D455D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Question 1
                    const SizedBox(height: 15),
                    const Text(
                      'In general, I consider myself : ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Color(0xff4D455D),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      updatedWellnessQ1Value,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Question 2
                    const SizedBox(height: 10),
                    const Text(
                      'Compared to most of my peers, I consider myself:',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Color(0xff4D455D),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      updatedWellnessQ2Value,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Question 3
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
                      updatedWellnessQ3Value,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Question 4
                    const SizedBox(height: 10),
                    const Text(
                      'Some people are generally very happy. They enjoy life regardless of what is going on, getting the most out of everything. To what extent does this characterization describe you?:',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Color(0xff4D455D),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      updatedWellnessQ4Value,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Patient's mood for this day: ",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Color(0xff4D455D),
                      ),
                    ),
                    const SizedBox(height: 10),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('MoodTracker')
                          .where('UID', isEqualTo: selectedPatientUID)
                          .where('DateSubmitted', isEqualTo: dateSubmitted)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                          QueryDocumentSnapshot moodTrackerData = snapshot.data!.docs.first;
                          String moodValue = moodTrackerData.get('Mood').toString();
                          return Text(
                            moodValue,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Add some space between the card and the button
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 625, right: 10), // Add margin to the top and right
          child: ElevatedButton(
            onPressed: () {
              _showVerificationDialog(context, documentId);
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff7DB9B6),
            ),
            child: const Text(
              'Verify',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffF5E9CF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}