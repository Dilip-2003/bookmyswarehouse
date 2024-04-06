import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/widgets/chat_screen.dart';
import 'package:bookmywarehouse/widgets/home_screen.dart';
import 'package:bookmywarehouse/widgets/profilescreen.dart';
import 'package:bookmywarehouse/widgets/savded_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarApp extends StatelessWidget {
  const BottomNavBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    ChatScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.signpost_outlined,
              size: 30,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_rounded,
              size: 30,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              size: 30,
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: BasicColor.primary,
        unselectedItemColor: const Color(0xFF7D8588),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
