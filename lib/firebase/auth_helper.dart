import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  static Future<UserCredential> loginUser(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  static Future<DocumentSnapshot> getUserDocument(String uid) async {
    QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('UID', isEqualTo: uid)
        .get();

    if (userQuerySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userSnapshot = userQuerySnapshot.docs[0];
      return userSnapshot;
    } else {
      throw Exception('User document not found');
    }
  }
}

class VerifyWeeklyForm {
  // Pass 'context' as a parameter to the method
  Future<void> updateWeeklyFormStatus(BuildContext context, String selectedPatientUID, String documentId) async {
  try {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Define the collection and document reference
    final CollectionReference weeklyFormsCollection = _firestore.collection('WeeklyForm');
    final DocumentReference documentReference = weeklyFormsCollection.doc(documentId);

    // Update the Status field to 'Verify'
    await documentReference.update({'Status': 'Verified'});
  } catch (error) {
    // Handle any errors that occur during the update
    print('Error updating document status: $error');
  }
}
}

class UnverifyWeeklyForm {
  Future<void> unverifyWeeklyFormStatus(BuildContext context, String selectedPatientUID, String documentId) async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      // Define the collection and document reference
      final CollectionReference weeklyFormsCollection = _firestore.collection('WeeklyForm');
      final DocumentReference documentReference = weeklyFormsCollection.doc(documentId);

      // Update the Status field to 'Unverified' or handle it as needed
      await documentReference.update({'Status': null});
    } catch (error) {
      // Handle any errors that occur during the update
      print('Error unverifying document status: $error');
    }
  }
}
