import 'package:books_app/Features/screens/homepage_screen.dart';
import 'package:books_app/Features/screens/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: 'assets/images/7813793.jpg',
      nextScreen: Loginscreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Color(0xff00344C),
    );
  }
}