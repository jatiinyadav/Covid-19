import 'package:covid19_app_flutter/Services/auth.dart';
import 'package:covid19_app_flutter/app/sign_in/social_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.onSignIn, required this.auth})
      : super(key: key);

  final AuthBase? auth;

  final void Function(User) onSignIn;

  Future<void> _signInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(userCredentials.user!);
    } catch (e) {
      print(toString());
    }
  }

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
          Color.fromRGBO(145, 100, 222, 1),
          Color.fromRGBO(160, 148, 170, 1),
        ]),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image.asset('images/mask-4.png'),
          // Image.asset('images/signin-doctor-logo.png'),

          AnimatedImage(),
          SizedBox(height: 50.0),
          SocialSignInButton(
            assetsName: 'images/google-24.png',
            text: 'Sign in with Google',
            textColor: Colors.white,
            color: Color.fromRGBO(219, 68, 55, 1),
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          SocialSignInButton(
            assetsName: 'images/facebook-24.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          SocialSignInButton(
            assetsName: 'images/anonymous-mask.png',
            text: 'Sign in Anonymously',
            textColor: Colors.white,
            color: Colors.black38,
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
            assetsName: 'images/mail-logo-2.png',
            text: 'Sign in with Phone Number',
            textColor: Colors.white,
            color: Colors.teal.shade700,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _signInAnonymously {}

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

// Image.asset('images/mask-logo3.png'),
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
