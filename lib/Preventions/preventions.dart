import 'package:align_positioned/align_positioned.dart';
import 'package:covid19_app_flutter/AppHomeScreen/apphome.dart';
import 'package:covid19_app_flutter/QNA/qna.dart';
import 'package:covid19_app_flutter/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreventionScreen extends StatelessWidget {
  const PreventionScreen({Key? key}) : super(key: key);

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
                padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                height: 352,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF9990CD),
                      Color(0xFF99999F),
                    ],
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/virus.png"),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AppHomeScreen();
                                // return AppHomeScreen(
                                //   summary: ,
                                // );
                              },
                            ),
                          );
                        },
                        child: Image.asset("assets/icons/forward-button.png"),
                      ),
                      // child: SvgPicture.asset(
                      //     "assets/icons/forward_user_interface_36.svg")),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Drcorona.svg",
                            width: 230,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Symptoms",
                  //   style: kTitleTextstyle,
                  // ),
                  // SizedBox(height: 20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     SymptomCard(
                  //       image: "assets/images/headache.png",
                  //       title: 'Headache',
                  //     ),
                  //     SymptomCard(
                  //       image: "assets/images/caugh.png",
                  //       title: 'Caugh',
                  //     ),
                  //     SymptomCard(
                  //       image: "assets/images/fever.png",
                  //       title: 'Headache',
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 20),
                  Text(
                    "Prevention",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 40),
                  PreventCard(
                    image: "assets/images/iconfinder_128_Mask.png",
                    text:
                        "Since the start of the Covid-19 outbreak facemasks are must to wear. ",
                    title: "Wear Face Mask",
                  ),
                  SizedBox(height: 10),
                  PreventCard(
                    image: "assets/images/Wash_hands_128.png",
                    text:
                        "Washing your hands with soap helps to prevent infection with Covid-19. ",
                    title: "Wash Hands",
                  ),
                  SizedBox(height: 10),
                  PreventCard(
                    image: "assets/images/keep_distance_128.png",
                    text:
                        "Always make sure to have 2m distance with other people and be safe.",
                    title: "Keep Social Distancing",
                  ),
                  SizedBox(height: 10),
                  PreventCard(
                    image: "assets/images/avoid_public_crowd_128.png",
                    text:
                        "Avoiding Public places will stop the virus from being spread to others. ",
                    title: "Avoid Public Crowd",
                  ),
                  SizedBox(height: 10),
                  PreventCard(
                    image: "assets/images/home_quarantine_stay_128.png",
                    text:
                        "People in quarantine should stay home, and monitor their health.",
                    title: "Home Quarantine",
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Crafted with ❤️ by Jatin Yadav",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
            // Container(
            //   child: BottomBar(),
            // ),
          ],
        ),
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
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                height: 110,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11.5,
                      ),
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

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  const SymptomCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 7,
            color: kActiveShadowColor,
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 90,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
