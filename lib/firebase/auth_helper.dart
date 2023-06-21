import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
