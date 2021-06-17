import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:provider/provider.dart';
import 'dart:async';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  String get tag => null;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get child => null;

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          //Null firebaseUser;
          return LoginPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Image.asset('image/background_splashscreen.JP',
            fit: BoxFit.cover, width: 700),
        Padding(
          padding: EdgeInsets.only(top: 300, left: 50),
          child: Image.asset(
            'image/splash.png',
            width: 300,
            height: 160,
          ),
        ),
      ],
    ));
  }
}
