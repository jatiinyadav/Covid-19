import 'package:covid19_app_flutter/Preventions/preventions.dart';
import 'package:covid19_app_flutter/QNA/qna.dart';
// import 'package:covid19_app_flutter/QNA/qna.dart';
import 'package:covid19_app_flutter/Symptoms/symptoms.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 1;

  final tabs = [
    PreventionScreen(),
    QuesAnsScreen(),
    SymptomsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.masks),
            label: "Symptoms",
            backgroundColor: Colors.deepPurple.shade100,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.deepPurple.shade100,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coronavirus),
            label: "Cases",
            backgroundColor: Colors.deepPurple.shade100,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
