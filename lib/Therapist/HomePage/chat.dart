import 'package:flutter/material.dart';

// Create a new screen for the chat details
class ChatDetailScreen extends StatelessWidget {
  final String name;

  ChatDetailScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(2.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular', fontSize: 13.5),
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF9DC08B)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Send',
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFA9AF7E),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class chatT extends StatelessWidget {
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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(name: 'Lexi Lore'),
                ),
              );
            },
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/Lexi.png'),
              ),
              title: Text(
                'Lexi Lore',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Hey, come over',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                '2:30 PM',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(name: 'Lana Rhoades'),
                ),
              );
            },
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/Lana.png'),
              ),
              title: Text(
                'Lana Rhoades',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Hello, are you free tonight?',
                style: TextStyle(fontSize: 16),
              ),
              trailing: Text(
                '7:00 PM',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: chatT(),
  ));
}
