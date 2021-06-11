import 'dart:async';

import 'package:covid19_app_flutter/Services/auth.dart';
import 'package:covid19_app_flutter/app/sign_in/social_sign_in_button.dart';
import 'package:covid19_app_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.auth}) : super(key: key);

  final AuthBase? auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth!.signInAnonymously();
      Fluttertoast.showToast(
        msg: "Signed in as Guest Mode",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
      );
    } catch (e) {
      print(toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth!.signInWithGoogle();
      Fluttertoast.showToast(
        msg: "Signed in using Google",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
      );
    } catch (e) {
      print(toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth!.signInWithFacebook();
      Fluttertoast.showToast(
        msg: "Signed in using Facebook",
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
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/signin-background.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Covid-19",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          AnimatedImage(),
          SizedBox(height: 50.0),
          SocialSignInButton(
            assetsName: 'images/google-24.png',
            text: 'Sign in with Google',
            textColor: Colors.white,
            color: Color.fromRGBO(219, 68, 55, 1),
            onPressed: _signInWithGoogle,
          ),
          SizedBox(height: 10.0),
          SocialSignInButton(
            assetsName: 'images/facebook-24.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: _signInWithFacebook,
          ),
          SizedBox(height: 10.0),
          SocialSignInButton(
            assetsName: 'images/anonymous-mask.png',
            text: 'Sign in as Guest',
            textColor: Colors.white,
            color: Colors.black54,
            onPressed: _signInAnonymously,
            // onPressed: () =>
            //     _signInAnonymously(), // Call back onPressed and  _signInAnonymously() takes no argumentthat why we have used the above shortcut method
          ),
          SizedBox(height: 10.0),
          Text(
            'or',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          SocialSignInButton(
            assetsName: 'images/phone-24.png',
            text: 'Sign in with Phone Number',
            textColor: Colors.white,
            color: Colors.teal.shade700,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
          SizedBox(height: 40),
          Text(
            "Crafted with ❤️ & ☕ by Jatin Yadav",
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset('images/signin-doctor-final.png'),
    );
  }
}
