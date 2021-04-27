import 'package:flutter/material.dart';
//import 'package:rent/service/auth_services.dart';
import './page/splash_screen.dart';

void main() => runApp(new Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //value: AuthServices.firebaseUserStream,
      //child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SplasScreen',
        theme: ThemeData(),
        home: new SplashScreen(),

    );
  }
}

