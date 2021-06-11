import 'package:covid19_app_flutter/AppHomeScreen/apphome.dart';
import 'package:covid19_app_flutter/constant.dart';
import 'package:flutter/material.dart';

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
                children: [
                  SizedBox(
                    height: 60.0,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AppHomeScreen();
                            },
                          ),
                        );
                      },
                      child: Image.asset("assets/icons/forward-black-48.png"),
                    ),
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
                    title: "How can I protect myself?",
                    text:
                        "Wear a Mask, Stay 6 feet away from others, Get vaccinated, Wash your hands often,Cover coughs and sneezes, Monitor your health daily.",
                  ),
                  SizedBox(height: 10),
                  PreventCard(
                    title: "Am I at risk for COVID-19 from products?",
                    text:
                        "The virus can survive for a short period on some surfaces, it is unlikely to be spread from domestic or international mail, products, or packaging.",
                  ),
                  SizedBox(height: 10),
                  PreventCard(
                    title: "Are people with disabilities at higher risk?",
                    text:
                        "Adults with disabilities are more likely to have an underlying medical condition that may put them at increased risk of severe illness from COVID-19.",
                  ),
                  SizedBox(height: 10),
                  PreventCard(
                    title: "Is at-home testing available?",
                    text:
                        "Yes. At-home testing and collection allow you to collect a specimen at home and either send it to a testing facility or preform the test at home.",
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
