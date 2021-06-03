import 'package:covid19_app_flutter/app/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> _signOut() async {
    try {
      await _auth.signOut();
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

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String? verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      // ignore: unused_local_variable
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = true;
      });

      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldkey.currentState
          // ignore: deprecated_member_use
          ?.showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  getMobileFormWidget(context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(145, 100, 222, 1),
          Color.fromRGBO(160, 148, 170, 1),
        ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset('images/injection.png'),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              fillColor: Colors.white38,
              filled: true,
              hintText: "Enter your Phone Number",
            ),
          ),
          SizedBox(height: 16.0),
          TextButton(
            onPressed: () async {
              setState(() {
                showLoading = true;
              });

              await _auth.verifyPhoneNumber(
                  phoneNumber: phoneController.text,
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      showLoading = false;
                    });

                    // signInWithPhoneAuthCredential(phoneAuthCredential);
                  },
                  verificationFailed: (verificationFailed) {
                    setState(() {
                      showLoading = false;
                    });
                    // ignore: deprecated_member_use
                    _scaffoldkey.currentState?.showSnackBar(
                        SnackBar(content: Text(verificationFailed.message!)));
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      showLoading = false;
                      currentState =
                          MobileVerificationState.SHOW_OTP_FORM_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {});
            },
            child: Text("Send OTP"),
            style: TextButton.styleFrom(
              primary: Colors.purple,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  getOtpFormWidget(context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(145, 100, 222, 1),
          Color.fromRGBO(160, 148, 170, 1),
        ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset('images/injection.png'),
          TextField(
            controller: otpController,
            decoration: InputDecoration(
              fillColor: Colors.white38,
              filled: true,
              hintText: "Enter OTP",
            ),
          ),
          SizedBox(height: 16.0),
          TextButton(
            onPressed: () async {
              // ignore: unnecessary_statements
              PhoneAuthCredential;
              final phoneAuthCredential = PhoneAuthProvider.credential(
                  verificationId: verificationId!, smsCode: otpController.text);

              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            child: Text("Submit"),
            style: TextButton.styleFrom(
              primary: Colors.purple,
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context)),
    );
  }
}
