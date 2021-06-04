// import 'package:align_positioned/align_positioned.dart';
// import 'package:covid19_app_flutter/Preventions/preventions.dart';
// import 'package:covid19_app_flutter/app/home_page.dart';
import 'package:covid19_app_flutter/constant.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class QuesAnsScreen extends StatelessWidget {
  const QuesAnsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Image.asset("assets/images/Corona_Banner_qna.png"),
                  Text(
                    "Frequently Aksed Questions",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 40),
                  PreventCard(
                    title: "What is COVID-19?",
                    text:
                        "COVID-19 is a disease caused by a virus SARS-CoV-2. Most people with COVID-19 have mild symptoms, but some people can become severely ill. ",
                  ),
                  SizedBox(height: 10),
                  PreventCard(
                    title: "What is COVID-19?",
                    text:
                        "COVID-19 is a disease caused by a virus SARS-CoV-2. Most people with COVID-19 have mild symptoms, but some people can become severely ill. ",
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Crafted with ❤️ by Jatin Yadav",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String title;
  final String text;
  const PreventCard({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 115,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 115,
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
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                height: 115,
                width: MediaQuery.of(context).size.width - 50,
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
