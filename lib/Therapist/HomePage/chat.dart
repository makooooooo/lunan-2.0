import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: chatT(),
  ));
}

class ChatDetailScreen extends StatelessWidget {
  final String name;
  final String roomName;
  final TextEditingController _messageController = TextEditingController();

  ChatDetailScreen({required this.name, required this.roomName});

  Stream<QuerySnapshot> getMessageStream(String roomName) {
    return FirebaseFirestore.instance
        .collection('messages')
        .where('room', isEqualTo: roomName)
        .orderBy('createdAt')
        .snapshots();
  }

  void sendMessage(String text, String currentUserUID, String roomName) async {
    String userFirstName = await getUserFirstName(currentUserUID);

    FirebaseFirestore.instance.collection('messages').add({
      'text': text,
      'createdAt': FieldValue.serverTimestamp(),
      'user': userFirstName,
      'room': roomName,
    });
  }

  Future<String> getUserFirstName(String userUID) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('UID', isEqualTo: _auth.currentUser!.uid)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        return userSnapshot.docs[0].get('firstName') as String;
      } else {
        return "Unknown User";
      }
    } catch (error) {
      print("Error fetching user's first name: $error");
      return "Error Fetching Name";
    }
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> messageStream = getMessageStream(roomName);

    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff7DB9B6),
        title: Text(name),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messageStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data?.docs;

               return ListView.builder(
                  itemCount: messages?.length,
                  itemBuilder: (context, index) {
                    final message =
                        messages?[index].data() as Map<String, dynamic>;

                    // Check if the message is from the current user
                    final isCurrentUser = message['user'] == name;

                    // Define the alignment for the message bubble
                    final alignment = isCurrentUser ? CrossAxisAlignment.start : CrossAxisAlignment.end;

                    // Define the background color for the message bubble
                    final bubbleColor = isCurrentUser ? Colors.white : const Color(0xff4D455D);

                    // Define the text color
                    final textColor = isCurrentUser ? Colors.black : Colors.white;

                    return Column(
                      crossAxisAlignment: alignment,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            message['text'],
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(2.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: TextStyle(
                      fontSize: 13.5,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xff4D455D)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    String newMessage = _messageController.text;
                    if (newMessage.isNotEmpty) {
                      sendMessage(newMessage, name, roomName);
                      _messageController.clear();
                    }
                  },
                  child: Text('Send'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff4D455D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class chatT extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String generateRoomName(String currentUserUID, String selectedUserUID) {
    String roomName = currentUserUID.compareTo(selectedUserUID) < 0
        ? '$currentUserUID and $selectedUserUID'
        : '$selectedUserUID and $currentUserUID';
    print("Room Name: $roomName"); // Print the room name to the console
    return roomName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5E9CF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff7DB9B6),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              'Inbox',
              style: TextStyle(
                color: Color(0xffF5E9CF),
                fontSize: 30,
              ),
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
              color: const Color(0xffF5E9CF),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .where('counselorUID', isEqualTo: _auth.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                // Create a separate StreamBuilder for Admin accounts
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .where('Role', isEqualTo: 'Admin')
                      .snapshots(),
                  builder: (context, adminSnapshot) {
                    if (adminSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (adminSnapshot.hasError) {
                      return Text('Error: ${adminSnapshot.error}');
                    }

                    // Combine the data from both snapshots
                    final List<QueryDocumentSnapshot> allUsers = [];
                    if (snapshot.hasData) {
                      allUsers.addAll(snapshot.data!.docs);
                    }
                    if (adminSnapshot.hasData) {
                      allUsers.addAll(adminSnapshot.data!.docs);
                    }

                    if (allUsers.isEmpty) {
                      return Text('No patients found');
                    }

                    return ListView.builder(
                      itemCount: allUsers.length,
                      itemBuilder: (context, index) {
                        var userData =
                            allUsers[index].data() as Map<String, dynamic>;

                        return Padding(padding: EdgeInsets.all(10) ,
                          child : InkWell(
                          onTap: () {
                            String roomName = generateRoomName(
                              _auth.currentUser!.uid,
                              userData['UID'] as String,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatDetailScreen(
                                  name: userData['firstName'] as String,
                                  roomName: roomName,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/ProfPic.png'),
                            ),
                            title: Text(
                              userData['firstName'] as String,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            trailing: Text(
                              '2:30 PM',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        )
                      
                        );
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
