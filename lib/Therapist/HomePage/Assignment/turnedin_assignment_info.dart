import 'package:flutter/material.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/Assignment/turnedin_assignment.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Therapist/HomePage/Assignment/verified_assignment.dart';
import 'package:lunan/Therapist/HomePage/Assignment/verified_assignment_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class TurnedInAssignmentInfo extends StatefulWidget {
  final Map<String, dynamic>? formData;
  final String documentId;
  final String selectedPatientUID;

  TurnedInAssignmentInfo({
    Key? key,
    this.formData,
    required this.selectedPatientUID,
    required this.documentId,
  }) : super(key: key);

  @override
  _TurnedInAssignmentInfoState createState() =>
      _TurnedInAssignmentInfoState(selectedPatientUID, documentId, formData);
}

class _TurnedInAssignmentInfoState extends State<TurnedInAssignmentInfo> {
  String? deadline;
  String? activity;
  String? description;
  String? downloadURL;
  String? fileName;
  final String selectedPatientUID;
  final String documentId;
  final Map<String, dynamic>? formData;

  _TurnedInAssignmentInfoState(
      this.selectedPatientUID, this.documentId, this.formData);

  @override
  void initState() {
    super.initState();
    deadline = widget.formData?['Deadline'] as String?;
    activity = widget.formData?['Activity'];
    description = widget.formData?['Description'];
    downloadURL = widget.formData?['DownloadURL'];
    fileName = extractFileName(downloadURL);
  }

  String? extractFileName(String? downloadURL) {
    if (downloadURL == null) {
      return null;
    }
    final uri = Uri.parse(downloadURL);
    return uri.pathSegments.last;
  }

  Future<void> showVerifyConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure you want to verify this document?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog and verify the document
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => VerifiedAssignmentInfo(
                      selectedPatientUID: selectedPatientUID,
                      formData: formData,
                      documentId: documentId,
                    ),
                  ),
                );
                ;
                updateStatusToVerified();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void updateStatusToVerified() {
    // Update the document status to "Verified" in Firestore
    FirebaseFirestore.instance
        .collection('Tasks')
        .doc(widget.documentId)
        .update({
      'Status': 'Verified',
    }).then((_) {
      // Show a snackbar message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Document successfully verified.'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Add your custom logic here
          // You can navigate to a different route using Navigator
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => TurendInAssignment(
                selectedPatientUID: selectedPatientUID,
              ),
            ),
          );
          // Return true if the route change is successful
          return true;
        },
        child: Scaffold(
          backgroundColor: const Color(0xffF5E9CF),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffF5E9CF),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => TurendInAssignment(
                      selectedPatientUID: selectedPatientUID,
                    ),
                  ),
                );
              },
              color: Color(0xff4D455D),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
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
                          child: Text(
                            '$activity',
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
                      margin: const EdgeInsets.fromLTRB(10, 15, 10, 20),
                      decoration: BoxDecoration(
                        color: const Color(0xff4D455D),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              decoration: BoxDecoration(
                                color: Color(0xffF5E9CF),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              // Display the assignment information
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          '$activity\n$description | Due: $deadline',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: const Color(0xff4D455D),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(9, 0, 0, 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: TextButton(
                                      onPressed: () async {
                                        if (downloadURL != null) {
                                          if (await canLaunch(downloadURL!)) {
                                            await launch(downloadURL!);
                                          } else {
                                            print(
                                                'Could not launch $downloadURL');
                                          }
                                        }
                                      },
                                      child: Text(
                                        fileName ?? 'No file attached',
                                        style: TextStyle(
                                          color: const Color(0xff4D455D),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 20), // Adjust margin as needed
                        child: ElevatedButton(
                          onPressed: () {
                            showVerifyConfirmationDialog();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 19, 195, 122),
                             shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                  ],
                ),
              ),
            ),
                  ] ),
              )
            )
          ),
          
          
        ));
  }
}
