import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Assignment/assignment.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientTurnIn extends StatefulWidget {
  final Map<String, dynamic> formData;
  final String documentId;

  const PatientTurnIn({required this.formData, Key? key, required this.documentId}) : super(key: key);

  @override
  _PatientTurnInState createState() => _PatientTurnInState();
}

class _PatientTurnInState extends State<PatientTurnIn> {
  String? selectedFileName;
  String? Deadline;
  String? Activity;
  String? Description;
  String? documentId;
  File? selectedFile; // Declare selectedFile here

  @override
  void initState() {
    super.initState();
    Deadline = widget.formData['Deadline'] as String?;
    Activity = widget.formData['Activity'];
    Description = widget.formData['Description'];
    documentId = widget.documentId; // Assign the documentId from the widget to the local variable
    print('Document ID: $documentId');
  }

  Future<void> attachFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any, // You can customize this to specify the file types you want to allow.
    );

    if (result != null) {
      selectedFile = File(result.files.single.path!); // Store the selected file
      // You can use the 'selectedFile' variable for further processing, such as uploading the file.

      // Update the UI to display the selected file name
      setState(() {
        selectedFileName = result.files.single.name;
      });
    } else {
      // User canceled the file picking
      print('File picking canceled');
    }
  }

  Future<void> uploadAndSubmit() async {
    if (selectedFile != null) { // Check if a file has been selected
      final Reference storageRef = FirebaseStorage.instance.ref().child('/tasks/$selectedFileName');
      final UploadTask uploadTask = storageRef.putFile(selectedFile!); // Use selectedFile

      await uploadTask.whenComplete(() async {
        final String downloadURL = await storageRef.getDownloadURL();

        // Update Firestore document
        await FirebaseFirestore.instance.collection('Tasks').doc(documentId).update({
          'Status': 'turnedIn',
          'DownloadURL': downloadURL,
        });

      });
    }
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
                              TextButton(
                                onPressed: () {
                                  attachFile();
                                },
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    const BorderSide(
                                      color: Color(0xffF5E9CF),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                child: const Text('Attach File'),
                              ),
                              // Display selected file name or "No file selected"
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(
                                  selectedFileName ?? 'No file selected',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(200, 0, 0, 15),
                          child: ElevatedButton(
                            onPressed: () {
                              uploadAndSubmit();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff7DB97F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Submit',
                            ),
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

