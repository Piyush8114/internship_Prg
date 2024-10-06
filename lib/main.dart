import 'package:flutter/material.dart';
import 'package:internship/otp.dart';
import 'package:internship/splash_screen.dart';
import 'home.dart';
import 'login.dart';
import 'signup.dart';

void main() async {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: SplashScreen(),
     //  home: PhoneEmailToggleScreen()
     //  home: OtpVerificationScreen(),
      home: HomePage(),
    );
  }
}
