// import 'package:flutter/material.dart';
// import 'package:lunan/Therapist/HomePage/dashboard.dart';
// import 'package:lunan/Therapist/ProfileSetting/profile.dart';
// import 'package:lunan/Patient/SignIn/log_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MenuListT extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final userId = user?.uid;

//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection("Users")
//           .where("UID", isEqualTo: userId)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           final documents = snapshot.data!.docs;
//           if (documents.isEmpty) {
//             return Text('User not found');
//           }

//           final firstName = documents[0].get('firstName') as String? ?? 'Unknown';

//           return ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               Container(
//                 constraints: const BoxConstraints(
//                   minHeight: 100, // Set the minimum height
//                   maxHeight: 130, // Set the maximum height
//                 ),
//                 child: DrawerHeader(
//                   decoration: BoxDecoration(
//                     color: const Color(0xff7DB9B6),
//                   ),
//                   child: Text(
//                     firstName,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                     ),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.home,
//                   color: Color(0xff7DB9B6),
//                 ),
//                 title: const Text('Home'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const DashboardT()),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.person,
//                   color: Color(0xff7DB9B6),
//                 ),
//                 title: const Text('Profile'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const ProfileSettingT()),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.logout,
//                   color: Color(0xff7DB9B6),
//                 ),
//                 title: const Text('Log out'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) =>  LoginPage()),
//                   );
//                 },
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }
