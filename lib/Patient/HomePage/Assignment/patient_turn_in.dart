import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lunan/Patient/HomePage/Assignment/assignment.dart';
import 'package:lunan/Patient/HomePage/Assignment/chooser.dart';
import 'package:lunan/Patient/HomePage/Assignment/completed.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:file_picker/file_picker.dart';

class PatientTurnIn extends StatefulWidget {
  const PatientTurnIn({super.key});

  @override
  State<PatientTurnIn> createState() => _PatientTurnInState();
}

class _PatientTurnInState extends State<PatientTurnIn> {
  String? selectedFileName;

  Future<void> attachFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      // Use the file as needed (e.g., upload, process, etc.)

      String fileName = file.uri.pathSegments.last;

      setState(() {
        selectedFileName = fileName;
      });

      print('Selected file: ${file.path}');
    } else {
      // User canceled the file picking
      print('File picking canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
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
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: const Text(
                'Activity # 1',
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
                  padding: EdgeInsets.symmetric(
                      horizontal: 20), // Adjust the padding as needed
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
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: <Widget>[
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Activity # 1\nJournal and Drawing Entry | Due: March 8, 20203',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.fromLTRB(9, 0, 0, 20),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                attachFile();
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                side: MaterialStateProperty.all<BorderSide>(
                                  const BorderSide(
                                      color: Color(0xffF5E9CF), width: 2.0),
                                ),
                              ),
                              child: const Text('Attach File'),
                            ),
                           
                            selectedFileName != null
                                ? Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(selectedFileName!,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text('No file selected',
                                      style: TextStyle(
                                       color: Colors.white,
                                      ),
                                    ),
                                  ),
                          ],
                        )),
                    Container(
                      margin: const EdgeInsets.fromLTRB(200, 0, 0, 15),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Completed()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff7DB97F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              // Set the corner radius here
                            ),
                          ),
                          child: const Text(
                            'Submit',
                          )),
                    ),
                  ]),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
