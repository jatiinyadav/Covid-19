import 'package:align_positioned/align_positioned.dart';
import 'package:covid19_app_flutter/MainHome/trackernew.dart';
import 'package:covid19_app_flutter/Preventions/preventions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: TrackerNew(),
      ),
    );
  }

  buildDataSuggestion(AsyncSnapshot<Object?> snapshot) {
    return snapshot.data;
  }
}

class CoronaHomeScreen extends StatelessWidget {
  const CoronaHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        child: Image.asset("assets/icons/forward-button.png"),
                      ),
                      // child: SvgPicture.asset(
                      //     "assets/icons/forward_user_interface_36.svg")),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Stack(
                        children: [
                          AlignPositioned(
                            child: Image.asset(
                                "assets/images/stay-home-new-icon.png"),
                            dx: 80,
                            dy: -120,
                          ),
                          Positioned(
                            top: 40,
                            left: 170,
                            child: Text(
                              "All you need \nis stay at home.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 19.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    )
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

class CoronaCasesHomeScreen extends StatelessWidget {
  const CoronaCasesHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Home",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 30.0,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

class MyName extends StatelessWidget {
  const MyName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Crafted with ❤️ & ☕ by Jatin Yadav",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontSize: 15,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 50.0)),
        ],
      ),
    );
  }
}

class MySocial extends StatelessWidget {
  const MySocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple.shade300,
            ),
            onPressed: () {
              openurl1();
            },
            child: Image.asset("assets/icons/globe-30.png"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple.shade300,
            ),
            onPressed: () {
              openurl2();
            },
            child: Image.asset("assets/icons/linkedin-30.png"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple.shade300,
            ),
            onPressed: () {
              openurl3();
            },
            child: Image.asset("assets/icons/github-30.png"),
          ),
        ],
      ),
    );
  }

  openurl1() {
    String url1 = "https://jatiinyadav.github.io/";
    launch(url1);
  }

  openurl2() {
    String url2 = "https://www.linkedin.com/in/jatiinyadav/";
    launch(url2);
  }

  openurl3() {
    String url3 = "https://github.com/jatiinyadav";
    launch(url3);
  }
}
