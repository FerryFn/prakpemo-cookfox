import 'package:flutter/material.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/splash_screen.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CookFox v0.0.3",
      home: const SplashScreen(),
      theme: ThemeData(
        fontFamily: "Quicksand",
        primaryColor: Palette.blue,
      ),
    );
  }
}