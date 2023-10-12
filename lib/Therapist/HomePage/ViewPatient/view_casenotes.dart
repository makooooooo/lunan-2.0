import 'package:flutter/material.dart';
import 'package:lunan/Therapist/MenuList/menulist.dart';
import 'package:lunan/Therapist/HomePage/ViewPatient/patient_casenotes.dart';

class ViewCaseNotes extends StatelessWidget {
    final String selectedPatientUID;
    final Map<String, dynamic>? formData;
    final String documentId;
  ViewCaseNotes({
    Key? key,
    required this.selectedPatientUID,
    this.formData,
    required this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        if (formData == null) {
      // Handle the case where formData is null
      return CircularProgressIndicator();
    }
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
          color: Color(0xff4D455D),// Change this color to your desired color
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
                            'Case Note # 1',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ))),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 25, 10, 20),
                  decoration: BoxDecoration(
                    color: const Color(0xff4D455D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
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
                            ))),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration:  BoxDecoration(
                        color:  Color(0xffF5E9CF),
                      borderRadius: BorderRadius.circular(15),
                      
                      ),
                    )),
                    
                     Container(
                         width: 100,
                          margin: const EdgeInsets.fromLTRB(200, 10, 0, 10),
                          height: 30,
                  child: ElevatedButton(
                      onPressed: () {
                        
                       Navigator.push(
                          
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientCaseNotes (selectedPatientUID: selectedPatientUID,)),
                         );
                      },
                      style: ElevatedButton.styleFrom(
                         backgroundColor: Color.fromARGB(255, 211, 34, 87),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Set the corner radius here
                        ),
                      ),
                      child: const Text(
                        'Back',
                      )),
                ),
                  ]),
                )),
               
              ],
            )),
      )),
    );
  }
}