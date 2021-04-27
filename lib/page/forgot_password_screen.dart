import 'package:flutter/material.dart';
import './login_screen.dart';

class ForgotpasswordPage extends StatefulWidget {
  static String tag = 'ForgotPassword-page';
  @override
  _ForgotpasswordPageState createState() => new _ForgotpasswordPageState();
}

class _ForgotpasswordPageState extends State<ForgotpasswordPage> {
  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.blueAccent,
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.0),

        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

    final nextButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {},
        padding: EdgeInsets.all(12),
        color: Colors.blueAccent,

      ),
    );

    final loginLabel = FlatButton(
      child: Text(
        'EMAIL ME',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) {
            return LoginPage();
          }),
        );
      },
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            Image.asset('image/background_login.jp',
                fit: BoxFit.cover, width: 700),
            Padding(
              padding: EdgeInsets.only(top: 70, left: 110),
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 70.0,
                child: Image.asset(
                  'image/logo.png',
                  width: 220,
                  height: 90,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 250, left: 150),
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 25.0,
                child: Icon(
                  Icons.lock_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(top: 330, left: 30),
                child: Text(
                  "We will send you an email with instruction ",
                  style: TextStyle(fontSize: 16),
                )),
            Center(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 400),
                children: <Widget>[
                  email,
                  SizedBox(height: 15.0),
                  nextButton,
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 535),
              child: ListView(
                children: [
                  loginLabel,
                ],
              ),
            )
          ],
        ));
  }
}
