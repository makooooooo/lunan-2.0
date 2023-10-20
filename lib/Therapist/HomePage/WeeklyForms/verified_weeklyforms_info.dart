import 'package:flutter/material.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/turnedin_weeklyforms.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/verified_weeklyforms.dart';
import 'package:lunan/firebase/auth_helper.dart';
import 'package:lunan/Therapist/HomePage/WeeklyForms/turnedin_weeklyforms_info.dart';

class VerifiedInWeeklyFormsInfo extends StatelessWidget {
  final String selectedPatientUID;
  final Map<String, dynamic>? formData;
  final String documentId;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  VerifiedInWeeklyFormsInfo({
    Key? key,
    required this.selectedPatientUID,
    this.formData,
    required this.documentId,
  }) : super(key: key);

  Future<void> _showVerificationDialog(
      BuildContext context, String documentId) async {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Verify Doc1ument'),
          content: Text('Are you sure you want to unverify this document?'),
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
      UnverifyWeeklyForm()
          .unverifyWeeklyFormStatus(context, selectedPatientUID, documentId);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Document unverified successfully.'),
      ));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TurnedInWeeklyFormsInfo(
            selectedPatientUID: selectedPatientUID,
            formData: formData,
            documentId: documentId,
          ),
        ),
      );
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
    final wellnessQ1Value = formData!['WeeklyQ1'].toString();
    final wellnessQ2Value = formData!['WeeklyQ2'].toString();
    final wellnessQ3Value = formData!['WeeklyQ3'].toString();
    final wellnessQ4Value = formData!['WeeklyQ4'].toString();
    final wellnessQ5Value = formData!['WeeklyQ5'].toString();

    // Function to convert numeric values to descriptive strings
    String mapNumericValueToString(String numericValue) {
      switch (numericValue) {
        case '1.0':
          return 'At no time';
        case '2.0':
          return 'Some of the time';
        case '3.0':
          return 'Occasionally';
        case '4.0':
          return 'Most of the time';
        case '5.0':
          return 'All the time';
        default:
          return '';
      }
    }

    // Update numeric values to descriptive strings
    final updatedWellnessQ1Value = mapNumericValueToString(wellnessQ1Value);
    final updatedWellnessQ2Value = mapNumericValueToString(wellnessQ2Value);
    final updatedWellnessQ3Value = mapNumericValueToString(wellnessQ3Value);
    final updatedWellnessQ4Value = mapNumericValueToString(wellnessQ4Value);
    final updatedWellnessQ5Value = mapNumericValueToString(wellnessQ5Value);

    return WillPopScope(
      onWillPop: () async {
        // Add your custom logic here
        // You can navigate to a different route using Navigator
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => VerifiedWeeklyForms(
              selectedPatientUID: selectedPatientUID,
            ),
          ),
        );
        // Return true if the route change is successful
        return true;
      },
    child:Scaffold(
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
                builder: (context) => TurnedINWeeklyFroms(
                    selectedPatientUID: selectedPatientUID, formData: formData),
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
                            'Weekly Form # 1',
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
                      'I have felt cheerful and in good spirits. : ',
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
                      'I have felt calm and relaxed. : ',
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
                      'I have felt active and vigorous. :',
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
                      'I woke up feeling fresh and rested. :',
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
                    // Question 5
                    const SizedBox(height: 10),
                    const Text(
                      'My daily life has been filled with things that interest me. :',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Color(0xff4D455D),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      updatedWellnessQ5Value,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
                height: 20), // Add some space between the card and the button
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 350, right: 20), // Add margin to the top and right
          child: ElevatedButton(
            onPressed: () {
              _showVerificationDialog(context, documentId);
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 209, 119, 119),
            ),
            child: const Text(
              'Unverify',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffF5E9CF),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
