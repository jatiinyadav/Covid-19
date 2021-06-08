import 'package:covid19_app_flutter/QNA/qna.dart';
import 'package:flutter/material.dart';

class OnTapScreens extends StatelessWidget {
  final returnScreen;
  final String text;

  const OnTapScreens({Key? key, this.returnScreen, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: [
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
                            return QuesAnsScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
                            return returnScreen;
                          },
                        ),
                      );
                    },
                    child: Image.asset("assets/icons/forward-button-20.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
