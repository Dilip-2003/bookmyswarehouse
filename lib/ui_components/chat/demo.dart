import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart'; // Importing package for emojis

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Nav Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final TextEditingController _textController = TextEditingController();
  final parser = EmojiParser();

  String _selectedEmoji = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Nav Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter your message',
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Open emoji selection here, for simplicity just using a set emoji
                setState(() {
                  _selectedEmoji = '😊';
                });
              },
              child: Text(
                _selectedEmoji,
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Navigate to home page
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Navigate to search page
                },
              ),
              IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () {
                  // Navigate to add page
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Navigate to notifications page
                },
              ),
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  // Navigate to profile page
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
