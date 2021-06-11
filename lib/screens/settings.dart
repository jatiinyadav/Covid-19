import 'package:covid19_app_flutter/AppHomeScreen/apphome.dart';
import 'package:covid19_app_flutter/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key, this.auth}) : super(key: key);
  final AuthBase? auth;

  // ignore: unused_element
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Fluttertoast.showToast(
        msg: "Signed out Successfully.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      );
    } catch (e) {
      print(toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.brown.shade100,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 70),
          Align(
            alignment: Alignment(0.9, 0.6),
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
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(20),
            child: Image.asset("assets/images/3698931.jpg"),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "COVID-19 affects different people in different ways. Most infected people will develop mild to moderate illness and recover without hospitalization.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black54,
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: _signOut,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text("Log Out"),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
