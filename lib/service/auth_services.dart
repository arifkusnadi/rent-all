//import 'package:firebase_auth/firebase_auth.dart';

//class AuthServices {
  //static FirebaseAuth _auth = FirebaseAuth.instance;
  //static Future<FirebaseUser>() async {
    //try{
      //AuthResult result = await _auth.();
      //FirebaseUser firebaseUser = result.user;
      //return firebaseUser;
    //} catch(e) {
      //print(e.toString());
      //return null;
    //}
  //}

  //static Future<FirebaseUser> signUp(String email, String password ) async{
    //try {
      //AuthResult result = await _auth.createUserWithEmailAndPassword(
        //  email: email, password: password);
      //FirebaseUser firebaseUser = result.user;
      //return firebaseUser;
    //} catch(e){
      //rint(e.toString());
      //return null;
    //}
  //}

  //static Future<void> signOut() async {
  //_auth.signOut();
//}

//static Stream<FirebaseUser> get firebaseUserStream => _auth.onAuthStateChanged;