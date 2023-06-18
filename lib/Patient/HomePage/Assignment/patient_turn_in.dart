import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:file_picker/file_picker.dart';

class PatientTurnIn extends StatelessWidget {
  const PatientTurnIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF), // Set the background color
      appBar: AppBar(
        backgroundColor: const Color(0xff7DB9B6),
      ),

      drawer: Drawer(
        child: MenuList(),
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
            const Divider(
              color: Color(0xff4D455D), // Customize the color of the line
              thickness: 2, // Adjust the thickness of the line
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
                                MaterialStateProperty.all<Color>(Colors.white),
                            side: MaterialStateProperty.all<BorderSide>(
                              const BorderSide(color: Color(0xffF5E9CF), width: 2.0),
                            ),
                          ),
                          child: const Text('Attach File'),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Image.asset('assets/iconPaperClip.png'),
                        )
                        
                      ],
                    )),
              ]),
            )
            )
              ],
            )
            
          ],
        ),
      ),
    );
  }
}

Future<void> attachFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    File file = File(result.files.single.path!);
    // Use the file as needed (e.g., upload, process, etc.)
    print('Selected file: ${file.path}');
  } else {
    // User canceled the file picking
    print('File picking canceled');
  }
}
