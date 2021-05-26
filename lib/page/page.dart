import 'dart:convert';
import 'package:rent/models/usermodel.dart';
import 'package:rent/service/apiresponse.dart';
import 'package:rent/service/registrationservices.dart';
import 'package:flutter/material.dart';
import 'package:rent/page/login_screen.dart';

class RegistrationPage extends StatefulWidget {
  static String tag = 'registration-page';
  @override
  _RegistrationPageState createState() => new _RegistrationPageState();
}
class _RegistrationPageState extends State<RegistrationPage> {
  var _nameController = new TextEditingController();
  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  ApiResponse apiResponse;

  @override
  void initState() {
    super.initState();
  }

  void sentRequestInsertDataUser() {
    Usermodel usermodel = new Usermodel(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);

    var requestBody = jsonEncode(usermodel.toJson());
    UserRegistrationServices.sentRequestInsertDataUser(requestBody)
        .then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }).catchError((error) {

    });
    print(requestBody);
  }

  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.blueAccent, //change your color here
        ),
        backgroundColor: Colors.white,
        //leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Center(
                    child: new Image.asset(
                      "image/splash.png",
                      height: 70.0,
                      width: 200.0,
                    ),
                  ),
                  Center(
                      child: Text('SignUp Now', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
                  ),
                  Center(
                    child: Text('Kindly Fill all the details to get started', style: TextStyle(fontSize: 13, color: Colors.grey[600]),),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 70, left: 40, right: 40 ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Username Field must not be empty';
                              }
                              return null;
                            },
                            decoration: new InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                              contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(), // move focus to next
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email Field must not be empty';
                              }
                              return null;
                            },
                            decoration: new InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(), // move focus to next
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(), // move focus to next
                            obscureText: !_showPassword,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password Field must not be empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(),
                              contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),

                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _togglevisibility();
                                },
                                child: Container(
                                  height: 50,
                                  width: 70,
                                  padding: EdgeInsets.symmetric(vertical: 13),
                                  child: Center(
                                    child: Text(
                                      _showPassword ? "Hide" : "Show",
                                      style: TextStyle(color: Colors.blueAccent, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: FlatButton(
                              minWidth: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Text('Register'),
                              color: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              textColor: Colors.white,
                              onPressed: () {
                                return LoginPage();
                              },
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          child: Container(
                            padding: EdgeInsets.all(30),
                            child: Text('Have an Account? Login'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 40, right: 40, bottom: 40,),
                          child: Text('or connect with'),
                        ),
                        Container(
                          padding: EdgeInsets.only( left: 30, right: 30),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('image/facebook.png'),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage('image/google.png'),
                                  ),
                                ),
                                Container(
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('image/twitter.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }

}
