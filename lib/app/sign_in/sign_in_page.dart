// import 'package:covid19_app_flutter/app/sign_in/sign_in_button.dart';
import 'package:covid19_app_flutter/app/sign_in/social_sign_in_button.dart';
// import 'package:covid19_app_flutter/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Covid-19'),
      // ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(145, 131, 222, 1),
          Color.fromRGBO(160, 148, 227, 1),
        ]),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // CustomElevatedButton(
          //   color: Colors.black87,
          //   onPressed: () {},
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Image.asset('images/google-logo.png'),
          //       Text('Sign in with Google'),
          //       Opacity(
          //         opacity: 0,
          //         child: Image.asset('images/google-logo.png'),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(height: 300.0),
          SocialSignInButton(
            assetsName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          SocialSignInButton(
            assetsName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          SocialSignInButton(
            assetsName: 'images/mail-logo-2.png',
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal.shade700,
            onPressed: () {},
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
            assetsName: 'images/anonymous-mask-32.png',
            text: 'Sign in Anonymously',
            textColor: Colors.white,
            color: Colors.black38,
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
