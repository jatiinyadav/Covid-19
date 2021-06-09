import 'package:covid19_app_flutter/AppHomeScreen/apphome.dart';
import 'package:covid19_app_flutter/QNA/qna.dart';
import 'package:covid19_app_flutter/Symptoms/symptoms.dart';
import 'package:covid19_app_flutter/screens/tracker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            // ignore: deprecated_member_use
            title: Text(
              "Home",
              style: TextStyle(fontSize: 13.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.masks),
            // ignore: deprecated_member_use
            title: Text(
              "Symptoms",
              style: TextStyle(fontSize: 13.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coronavirus),
            // ignore: deprecated_member_use
            title: Text(
              "Cases",
              style: TextStyle(fontSize: 13.0),
            ),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: AppHomeScreen(),
                  // child: AppHomeScreen(
                  //   summaryList: [],
                  // ),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: SymptomsScreen(),
                );
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Tracker(),
                );
              },
            );
          default:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: QuesAnsScreen(),
                  // child: AppHomeScreen(
                  //   summaryList: [],
                  // ),
                );
              },
            );
        }
      },
    );
  }
}
