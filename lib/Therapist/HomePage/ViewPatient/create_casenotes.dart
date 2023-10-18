import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_casenotes.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_info.dart';

class CreateCaseNotes extends StatelessWidget {
  final String selectedPatientUID;
  final quill.QuillController _controller = quill.QuillController.basic();

  CreateCaseNotes({Key? key, required this.selectedPatientUID}) : super(key: key);

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
            Navigator.pop(context);
          },
          color: Color(0xff4D455D),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                        'Create a Case Note',
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
                              child: const Text(
                                'Patient A\nDate Added\nDiagnosis ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffF5E9CF),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 5, 0, 10),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  _attachFile(context);
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
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Image.asset('assets/iconPaperClip.png'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              QuillEditorBasic(controller: _controller, selectedPatientUID: selectedPatientUID),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 100,
                              margin: const EdgeInsets.fromLTRB(120, 10, 10, 10),
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
        
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PatientCaseNotes(selectedPatientUID: selectedPatientUID),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 211, 34, 87),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text('Cancel'),
                              ),
                            ),
                            Container(
                              width: 100,
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  saveCaseNote(context, _controller, selectedPatientUID);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 19, 195, 122),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text('Save'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _attachFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      // Handle the selected file, you can store it or use it as needed.
    }
  }
}

class QuillEditorBasic extends StatefulWidget {
  final quill.QuillController controller;
  final String selectedPatientUID;

  QuillEditorBasic({
    Key? key,
    required this.controller,
    required this.selectedPatientUID,
  }) : super(key: key);

  @override
  _QuillEditorBasicState createState() => _QuillEditorBasicState();
}

class _QuillEditorBasicState extends State<QuillEditorBasic> {
  bool isBoldActive = false;
  bool isUnderlineActive = false;
  bool isListActive = false;

  @override
  Widget build(BuildContext context) {
    final quill.QuillToolbar toolbar = quill.QuillToolbar(
      children: <Widget>[
        _buildQuillIconButton(
          Icons.format_bold,
          () {
            setState(() {
              isBoldActive = !isBoldActive;
            });
            widget.controller.formatSelection(quill.Attribute.bold);
          },
          backgroundColor: isBoldActive ? Colors.grey : Colors.white,
        ),
        _buildQuillIconButton(
          Icons.format_underlined,
          () {
            setState(() {
              isUnderlineActive = !isUnderlineActive;
            });
            widget.controller.formatSelection(quill.Attribute.underline);
          },
          backgroundColor: isUnderlineActive ? Colors.grey : Colors.white,
        ),
        _buildQuillIconButton(
          Icons.format_list_bulleted,
          () {
            setState(() {
              isListActive = !isListActive;
            });
            widget.controller.formatSelection(quill.Attribute.list);
          },
          backgroundColor: isListActive ? Colors.grey : Colors.white,
        ),
      ],
    );

    return Container(
      constraints: BoxConstraints(maxHeight: 400),
      child: Column(
        children: <Widget>[
          toolbar,
          Expanded(
            child: quill.QuillEditor(
              controller: widget.controller,
              scrollController: ScrollController(),
              scrollable: true,
              padding: EdgeInsets.all(8),
              autoFocus: true,
              expands: true,
              focusNode: FocusNode(),
              readOnly: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuillIconButton(IconData icon, VoidCallback onPressed, {Color? backgroundColor}) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: quill.QuillIconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}

void saveCaseNote(BuildContext context, quill.QuillController controller, String selectedPatientUID) async {
  // Get the current user
  final user = FirebaseAuth.instance.currentUser;
  final counselorUID = user?.uid;

  // Get the current date
  final dateAdded = Timestamp.now().toDate();

  // Format the date as a string in "YYYY-MM-DD" format
  final formattedDate = "${dateAdded.year}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}";

  // Get the Quill Delta content from the controller
  final delta = controller.document.toDelta();

  // Convert the Quill Delta to HTML using the custom function
  final contentHtml = convertQuillDeltaToHtml(delta);

  // Prepare the data to be saved to Firestore
  final caseNoteData = {
    'content': contentHtml, // Store content as HTML with tags
    'counselorUID': counselorUID,
    'dateAdded': formattedDate,
    'patientUID': selectedPatientUID,
  };

  // Reference to the Firestore collection
  final collection = FirebaseFirestore.instance.collection('CaseNotes');

  // Add the data to Firestore
  await collection.add(caseNoteData);

  // Navigate back to the previous screen
  Navigator.pop(context);
}

String convertQuillDeltaToHtml(quill.Delta delta) {
  final List<String> htmlParts = [];
  String? listType;

  for (final op in delta.toList()) {
    final data = op.data;
    final attributes = op.attributes;

    if (data is String) {
      // Handle line breaks
      final lines = data.split('\n');
      var wrappedLines = lines.map((line) => '<p>$line</p>').join('<br>');

      if (attributes?['bold'] == true) {
        wrappedLines = '<strong>$wrappedLines</strong>';
      }
      if (attributes?['italic'] == true) {
        wrappedLines = '<em>$wrappedLines</em>';
      }
      if (attributes?['underline'] == true) {
        wrappedLines = '<u>$wrappedLines</u>';
      }
      htmlParts.add(wrappedLines);
    } else if (data is Map<String, dynamic> && data['insert'] is String) {
      final insert = data['insert'] as String;
      final html = StringBuffer();
      if (attributes != null) {
        if (attributes['list'] != null) {
          listType = attributes['list'] == 'ordered' ? 'ol' : 'ul';
          html.write('<$listType>');
        }
      }
      html.write(insert);
      if (attributes != null && listType != null) {
        html.write('</$listType>');
      }
      htmlParts.add(html.toString());
    }
  }
  return htmlParts.join('\n');
}
