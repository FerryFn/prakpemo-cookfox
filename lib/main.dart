import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/splash_screen.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/data/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "CookFox v0.0.3",
      home: SplashScreen(),
      theme: ThemeData(
        fontFamily: "Quicksand",
        primaryColor: Palette.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}