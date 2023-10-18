import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Assignment/assignment.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class turnedIn extends StatefulWidget {
  final Map<String, dynamic> formData;
  final String documentId;

  const turnedIn({required this.formData, Key? key, required this.documentId})
      : super(key: key);

  @override
  _turnedInState createState() => _turnedInState();
}

class _turnedInState extends State<turnedIn> {
  String? deadline;
  String? activity;
  String? description;
  String? documentId;
  String? downloadURL;
  String? fileName; // Add a variable to store the file name
  String? extractFileName(String? downloadURL) {
    if (downloadURL == null) {
      return null; // Return null if downloadURL is null
    }
    final uri = Uri.parse(downloadURL);
    return uri.pathSegments.last;
  }

  @override
  void initState() {
    super.initState();
    deadline = widget.formData['Deadline'] as String?;
    activity = widget.formData['Activity'];
    description = widget.formData['Description'];
    downloadURL = widget.formData['DownloadURL'];
    documentId = widget.documentId;
    fileName = extractFileName(downloadURL);
  }

  // Function to download the file
  void downloadFile() async {
    if (downloadURL != null) {
      final FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File file = File(result.files.single.path!);
        // You can use Firebase Storage to upload the selected file here
        // Example: Upload the file to Firebase Storage with documentId as the file name
        final Reference storageReference =
            FirebaseStorage.instance.ref().child(documentId!);
        await storageReference.putFile(file);

        // Display a message or navigate to another page after successful upload
      }
    } else {
      // Handle the case where downloadURL is null (e.g., show an error message)
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
                '$activity',
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
                              '$activity\n$description | Due: $deadline',
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
                                child: TextButton(
                                  onPressed: () async {
                                    if (downloadURL != null) {
                                      if (await canLaunch(downloadURL!)) {
                                        await launch(downloadURL!);
                                      } else {
                                        print('Could not launch $downloadURL');
                                      }
                                    }
                                  },
                                  child: Text(
                                    fileName!,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow
                                        .ellipsis, // Truncate and add ellipsis
                                    maxLines: 1, // Display on a single line
                                  ),
                                ),
                              )
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
