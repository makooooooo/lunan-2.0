import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_form_chooser.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_form_editable.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_forms_answer.dart';
import 'package:lunan/Patient/HomePage/WeeklyForms/weekly_forn_question.dart';
import 'package:lunan/Patient/MenuList/menulist.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WeeklyForms extends StatelessWidget {
  const WeeklyForms({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

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
              MaterialPageRoute(builder: (context) => WeeklyFormChooser()),
            );
          },
          color: Color(0xff4D455D),// Change this color to your desired color
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('WeeklyForm')
            .where('UID', isEqualTo: userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final forms = snapshot.data!.docs;

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: const Text(
                        'View My Weekly Form',
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
                      color: Color(0xff4D455D),
                      thickness: 2,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: forms.length,
                      itemBuilder: (context, index) {
                        final documentId = forms[index].id as String;
                        final formData =
                            forms[index].data() as Map<String, dynamic>;

                        final dateSubmitted =
                            formData['DateSubmitted'] as String;

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WeeklyFormsAnswer(formData: formData),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xff4D455D),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      'Date Submitted: $dateSubmitted',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WeeklyFormEdit(
                                                documentId: documentId,
                                              formData: formData,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
