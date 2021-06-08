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
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ImageRotate(),
          Expanded(
            child: Container(
              color: Colors.blueGrey.shade100,
              padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: navigationStatus == NavigationStatus.COUNTRY
                    ? Country()
                    : Global(),
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.all(20),
            // decoration: BoxDecoration(
            //   color: Colors.black87,
            //   borderRadius: BorderRadius.only(
            //     bottomRight: Radius.circular(50),
            //     bottomLeft: Radius.circular(50),
            //     topRight: Radius.circular(50),
            //     topLeft: Radius.circular(50),
            //   ),
            // ),
            color: Colors.blue.shade100,
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationOption(
                  title: "Country",
                  selected: navigationStatus == NavigationStatus.COUNTRY,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.COUNTRY;
                    });
                  },
                ),
                NavigationOption(
                  title: "Global",
                  selected: navigationStatus == NavigationStatus.GLOBAL,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.GLOBAL;
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
