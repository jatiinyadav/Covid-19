import 'package:covid19_app_flutter/QNA/qna.dart';
import 'package:covid19_app_flutter/screens/ontapscreens.dart';
import 'package:flutter/material.dart';

class HomeScreenUpper extends StatelessWidget {
  const HomeScreenUpper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/coronavirus_icon.png"),
          // ImageRotate(),
          SizedBox(
            height: 20.0,
          ),
          Image.asset("assets/images/corona-new-banner.png"),
          SizedBox(
            height: 10.0,
          ),
          OnTapScreens(
            text: "Corona Virus FAQ's   ",
            image: "assets/icons/forward-button-20.png",
            returnScreen: QuesAnsScreen(),
          ),
        ],
      ),
    );
  }
}
