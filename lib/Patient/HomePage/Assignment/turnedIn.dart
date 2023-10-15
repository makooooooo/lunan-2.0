import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Assignment/assignment.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class turnedIn extends StatefulWidget {
  final Map<String, dynamic> formData;
  final String documentId;

  const turnedIn({required this.formData, Key? key, required this.documentId}) : super(key: key);

  @override
  _turnedInState createState() => _turnedInState();
}

class _turnedInState extends State<turnedIn> {
  String? Deadline;
  String? Activity;
  String? Description;
  String? documentId;
  String? DownloadURL;
  File? selectedFile; // Declare selectedFile here

  @override
  void initState() {
    super.initState();
    Deadline = widget.formData['Deadline'] as String?;
    Activity = widget.formData['Activity'];
    Description = widget.formData['Description'];
    DownloadURL = widget.formData['DownloadURL'];
    documentId = widget.documentId; // Assign the documentId from the widget to the local variable
    print('Document ID: $documentId');
  }

  // Function to extract the filename from the DownloadURL
  String extractFileName(String downloadURL) {
    final uri = Uri.parse(downloadURL);
    return uri.pathSegments.last;
  }

  @override
  Widget build(BuildContext context) {
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
              MaterialPageRoute(builder: (context) => Assignment()),
            );
          },
          color: Color(0xff4D455D),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text(
                '${Activity}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: Color(0xff4D455D),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Color(0xff4D455D),
                thickness: 2,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xff4D455D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              '${Activity} \n ${Description} | Due: ${Deadline}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(9, 0, 0, 20),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(
                                  extractFileName(DownloadURL!), // Display the filename
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
