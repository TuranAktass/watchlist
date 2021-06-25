/*

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:watchlist_1/screens/main_screen.dart';
import 'package:watchlist_1/screens/sign_up_screen.dart';

class CustomSplashScreen extends StatelessWidget {
  User result = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      // navigateAfterSeconds: result != null ? Home(uid: result.uid) : SignUp(),
      seconds: 5,
      title: Text(
        'Welcome to Watchlist!',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset('assets/icon.png', fit: BoxFit.scaleDown),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: () => print('flutter'), //silinecek
      loaderColor: Colors.red,
    );
  }
}
*/