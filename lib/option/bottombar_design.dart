import 'package:flutter/material.dart';
import 'package:lastprojects/screens/home_screen.dart';
import 'package:lastprojects/screens/setting_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNBar extends StatefulWidget {
  const BottomNBar({super.key});

  @override
  State<BottomNBar> createState() => _BottomNBarState();
}

class _BottomNBarState extends State<BottomNBar> {
  int mycurrentIndex = 0;
  List pages = [
    HomeScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[mycurrentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 140, 120, 60),
        animationDuration: Duration(
          milliseconds: 300,
        ),
        onTap: (index) {
          setState(() {
            mycurrentIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.black,
          ),
          Icon(
            Icons.settings,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
