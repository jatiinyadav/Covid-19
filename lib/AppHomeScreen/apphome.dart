import 'package:align_positioned/align_positioned.dart';
import 'package:covid19_app_flutter/Preventions/preventions.dart';
import 'package:covid19_app_flutter/QNA/qna.dart';
import 'package:covid19_app_flutter/screens/bottom_bar.dart';
import 'package:covid19_app_flutter/screens/ontapscreens.dart';
import 'package:covid19_app_flutter/screens/prevent_card_new.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(165, 100, 200, 1),
            Color.fromRGBO(180, 148, 222, 1),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: BottomBar(),
          ),
          // Image.asset("assets/images/coronavirus_icon.png"),
          // // ImageRotate(),
          // SizedBox(
          //   height: 20.0,
          // ),
          // Image.asset("assets/images/corona-new-banner.png"),
          // SizedBox(
          //   height: 10.0,
          // ),
          // OnTapScreens(
          //   text: "Corona Virus FAQ's   ",
          //   returnScreen: QuesAnsScreen(),
          // ),
          // OnTapScreens(
          //   text: "Want Detailed Statistics?   ",
          // ),
          // SizedBox(height: 40),
          // Container(
          //   padding: EdgeInsets.only(
          //     left: 20.0,
          //     right: 20.0,
          //     top: 20.0,
          //   ),
          //   child: PreventCard(
          //     image: "assets/images/doctor_health_128.png",
          //     title: "  In case of any emergency",
          //     text: "      011-23978046",
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.all(20.0),
          //   child: PreventCardNew(
          //     image: "assets/images/doctor_prevention_128.png",
          //     title: "5 must have",
          //     text: "Preventions from Covid 19",
          //   ),
          // ),
          // MyName(),
          // MySocial(),
          // BottomBar(),
        ],
      ),
    );
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
            "Crafted with ❤️ by Jatin Yadav",
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
