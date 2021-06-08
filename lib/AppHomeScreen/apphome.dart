import 'package:align_positioned/align_positioned.dart';
import 'package:covid19_app_flutter/Preventions/preventions.dart';
// import 'package:covid19_app_flutter/Preventions/preventions.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(145, 100, 222, 1),
            Color.fromRGBO(160, 148, 170, 1),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "COVID 19",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 30.0,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(20.0),
            child: PreventCard(
              image: "assets/images/doctor_health_128.png",
              title: "  In case of any emergency",
              text: "      011-23978046",
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: PreventCardNew(
              image: "assets/images/doctor_prevention_128.png",
              title: "5 must have",
              text: "Preventions for Covid 19",
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(
                //   "Crafted with ❤️ by Jatin Yadav",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontFamily: 'Poppins',
                //     color: Colors.black,
                //     fontSize: 15,
                //     decoration: TextDecoration.none,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                Image.asset("assets/icons/forward-button.png"),
                Image.asset("assets/icons/forward-button.png"),
                Image.asset("assets/icons/forward-button.png"),
              ],
            ),
          ),
          // Container(
          //   color: Colors.green,
          //   child: new IconButton(
          //     icon: new Image.asset(
          //       "assets/icons/forward-button.png",
          //       color: Colors.white,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 80,
        child: Stack(
          // alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white54,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      color: kShadowColor),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 80,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                height: 80,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.red.shade600,
                          decoration: TextDecoration.none),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCardNew extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCardNew({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 110,
        child: Stack(
          // alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white54,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      color: kShadowColor),
                ],
              ),
            ),
            AlignPositioned(
              child: Image.asset(image),
              dx: 110,
            ),
            Positioned(
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                height: 110,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          decoration: TextDecoration.none),
                    ),
                    SizedBox(height: 18.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PreventionScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Know More  ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ),
                        Align(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PreventionScreen();
                                  },
                                ),
                              );
                            },
                            child: Image.asset(
                                "assets/icons/forward-button-20.png"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreventCardSecond extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCardSecond({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 110,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white54,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      color: kShadowColor),
                ],
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                height: 110,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(image),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 1,
                          decoration: TextDecoration.none),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
