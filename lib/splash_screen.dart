import 'dart:async';

import 'package:flutter/material.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/landing_page.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/variables.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() {
    Duration duration = const Duration(seconds: 3);
    return Timer(
      duration,
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LandingPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon/cookfox.png",
              height: _width / 2,
              width: _width / 2,
            ),
            const Text(
              "CookFox",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Palette.white,
              ),
            ),
            const Text(
              "v0.0.3",
              style: TextStyle(
                fontSize: 16,
                color: Palette.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
