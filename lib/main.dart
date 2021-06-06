// import 'package:covid19_app_flutter/Preventions/preventions.dart';
// import 'package:covid19_app_flutter/QNA/qna.dart';
import 'package:covid19_app_flutter/screens/tracker.dart';
// import 'package:covid19_app_flutter/screens/image_rotate.dart';
// import 'package:covid19_app_flutter/screens/tracker.dart';
// import 'package:covid19_app_flutter/Services/auth.dart';
// import 'package:covid19_app_flutter/app/sign_in/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // home: LandingPage(
      //   auth: Auth(),
      // ),
      home: Tracker(),
    );
  }
}
