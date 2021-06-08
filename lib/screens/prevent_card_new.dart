import 'package:align_positioned/align_positioned.dart';
import 'package:covid19_app_flutter/Preventions/preventions.dart';
import 'package:covid19_app_flutter/constant.dart';
import 'package:flutter/material.dart';

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
                  horizontal: 8,
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
                          fontSize: 13.5,
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
                                  color: Colors.grey.shade700,
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
