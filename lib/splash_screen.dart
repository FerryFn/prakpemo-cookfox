import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/getx_controller/splash_screen_controller.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/data/palette.dart';

class SplashScreen extends StatelessWidget {
  SplashScreenController splashScreenController = Get.put(SplashScreenController());
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
