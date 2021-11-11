import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ewawepay/utils/colors.dart';
import 'package:ewawepay/views/auth/loginScreen.dart';
import 'package:ewawepay/views/dashboard/landDashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ewawe Pay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ewawegreen,
      ),
      home: AnimatedSplashScreen(
          duration: 3000,
          splashIconSize: 300,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white,
          splash: Image.asset('assets/images/ewawelogo.png'),
          nextScreen: LoginScreen()),
    );
  }
}
