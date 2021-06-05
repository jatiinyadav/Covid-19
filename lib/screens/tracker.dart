import 'package:covid19_app_flutter/screens/country.dart';
import 'package:covid19_app_flutter/screens/global.dart';
import 'package:covid19_app_flutter/screens/navigation_function.dart';
import 'package:flutter/material.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
}

class Tracker extends StatefulWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBAL;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: navigationStatus == NavigationStatus.GLOBAL
                    ? Global()
                    : Country(),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationOption(
                  title: "Global",
                  selected: navigationStatus == NavigationStatus.GLOBAL,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.GLOBAL;
                    });
                  },
                ),
                NavigationOption(
                  title: "Country",
                  selected: navigationStatus == NavigationStatus.COUNTRY,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.COUNTRY;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
