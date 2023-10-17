import 'package:flutter/material.dart';
import 'package:lunan/Patient/ProfileSetting/profile.dart';
import 'package:lunan/Therapist/ProfileSetting/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileT extends StatelessWidget {
  const EditProfileT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final conNumController = TextEditingController();
    final newPasswordController = TextEditingController();

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .where("UID", isEqualTo: userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final documents = snapshot.data!.docs;
          if (documents.isEmpty) {
            return Text('Therapist not found');
          }

          final firstName =
              documents[0].get('firstName') as String? ?? 'Unknown';
          final email = documents[0].get('Email') as String? ?? 'Unknown';
          final conNum = documents[0].get('ConNum') as String? ?? 'Unknown';

          nameController.text = firstName;
          emailController.text = email;
          conNumController.text = conNum;

          return Scaffold(
            backgroundColor: const Color(0xffF5E9CF),
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xffF5E9CF),
              iconTheme: const IconThemeData(color: Color(0xff4D455D)),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                    child: const Text(
                      'Edit Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        color: Color(0xff4D455D),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                    child: const Text(
                      'Change Name',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: Color(0xff4D455D),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: '$firstName',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: const Text(
                      'Change Number',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: Color(0xff4D455D),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: conNumController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '$conNum',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: const Text(
                      'Change Email',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: Color(0xff4D455D),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: '$email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 0, 10),
                    child: const Text(
                      'Change Password',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        color: Color(0xff4D455D),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: newPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xff7DB9B6)),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 50, 10, 0),
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        final updatedName = nameController.text;
                        final updatedConNum = conNumController.text;
                        final updatedEmail = emailController.text;
                        final newPassword = newPasswordController.text;
                        final user = FirebaseAuth.instance.currentUser;

                        if (user != null) {
                          // Update the email in Firebase Authentication
                          user.updateEmail(updatedEmail).then((_) {
                            if (newPassword.isNotEmpty) {
                              // Update the password
                              user.updatePassword(newPassword).then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("Password updated successfully"),
                                  ),
                                );
                              }).catchError((error) {
                                print(
                                    "Error updating password in Firebase Authentication: $error");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Failed to update password in Firebase Authentication: $error"),
                                  ),
                                );
                              });
                            }
                            // Now, update the email in Firestore
                            FirebaseFirestore.instance
                                .collection("Users")
                                .where("UID", isEqualTo: user.uid)
                                .get()
                                .then((querySnapshot) {
                              if (querySnapshot.docs.isNotEmpty) {
                                final userDoc = querySnapshot.docs[0];

                                userDoc.reference.update({
                                  "firstName": updatedName,
                                  "ConNum": updatedConNum,
                                  "Email": updatedEmail,
                                }).then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text("Profile updated successfully"),
                                    ),
                                  );
                                  Navigator.pop(context);
                                }).catchError((error) {
                                  print(
                                      "Error updating profile in Firestore: $error");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "Failed to update profile in Firestore: $error"),
                                    ),
                                  );
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("User not found"),
                                  ),
                                );
                              }
                            });
                          }).catchError((error) {
                            print(
                                "Error updating email in Firebase Authentication: $error");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Failed to update email in Firebase Authentication: $error"),
                              ),
                            );
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff7DB9B6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
