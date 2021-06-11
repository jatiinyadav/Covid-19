import 'package:covid19_app_flutter/AppHomeScreen/apphome.dart';
import 'package:covid19_app_flutter/QNA/qna.dart';
import 'package:covid19_app_flutter/screens/image_rotate.dart';
import 'package:covid19_app_flutter/screens/ontapscreens.dart';
import 'package:covid19_app_flutter/screens/prevent_card_new.dart';
import 'package:covid19_app_flutter/screens/settings.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import 'countrynew.dart';

enum NavigationStatus {
  GLOBALNEW,
  COUNTRYNEW,
}

class TrackerNew extends StatefulWidget {
  const TrackerNew({Key? key}) : super(key: key);

  @override
  _TrackerNewState createState() => _TrackerNewState();
}

class _TrackerNewState extends State<TrackerNew> {
  NavigationStatus navigationStatus = NavigationStatus.GLOBALNEW;

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
      // resizeToAvoidBottomInset: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 55.0,
          ),
          // Image.asset("assets/images/coronavirus_icon.png"),
          // Icon(Icons.settings),
          Row(
            children: [
              SizedBox(width: 30.0),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return QuesAnsScreen();
                        },
                      ),
                    );
                  },
                  child: Image.asset("assets/icons/question-25.png"),
                ),
              ),
              SizedBox(width: 290.0),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Settings();
                        },
                      ),
                    );
                  },
                  child: Image.asset("assets/icons/settings-25.png"),
                ),
              ),
            ],
          ),

          ImageRotate(),
          // Image.asset("assets/icons/downward-button-20.png"),
          SizedBox(height: 10.0),
          Image.asset("assets/images/corona-new-banner.png"),
          SizedBox(height: 10.0),
          // OnTapScreens(
          //   text: "Corona Virus FAQ's   ",
          //   image: "assets/icons/forward-button-20.png",
          //   returnScreen: QuesAnsScreen(),
          // ),
          OnTapScreens(
            text: "India Covid 19 Statistics",
            image: "assets/icons/downward-button-20.png",
          ),
          SizedBox(height: 10.0),
          Container(
            // height: 200,
            // color: Colors.blueGrey.shade100,
            // padding: EdgeInsets.fromLTRB(32, 32, 32, 32),
            padding: EdgeInsets.only(
              left: 32,
              right: 32,
            ),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              child: navigationStatus == NavigationStatus.COUNTRYNEW
                  ? null
                  : CountrNew(),
            ),
          ),
          SizedBox(height: 10.0),
          OnTapScreens(
            text: "Detailed Statistics at Cases button in bottom",
            image: "assets/icons/downward-button-20.png",
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: PreventCard(
              image: "assets/images/doctor_health_128.png",
              title: "  In case of any emergency",
              text: "      011-23978046",
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: PreventCardNew(
              image: "assets/images/doctor_prevention_128.png",
              title: "5 must have",
              text: "Preventions from Covid 19",
            ),
          ),
          SizedBox(height: 20),
          MyName(),
          MySocial(),
          SizedBox(height: 50),
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
    required this.title,
    required this.text,
    required this.image,
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
