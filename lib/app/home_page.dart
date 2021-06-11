import 'package:covid19_app_flutter/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.auth}) : super(key: key);
  final AuthBase? auth;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton(
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
    );
  }
}
