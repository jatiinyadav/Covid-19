import 'package:covid19_app_flutter/Services/auth.dart';
import 'package:covid19_app_flutter/app/sign_in/sign_in_page.dart';
import 'package:covid19_app_flutter/screens/new-bottombar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key, required this.auth}) : super(key: key);
  final AuthBase? auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: auth!.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // ignore: unused_local_variable
          final User? user = snapshot.data as User?;
          if (user == null) {
            return SignInPage(
              auth: auth,
            );
          } else {
            return HomeBottomBar();
          }
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
