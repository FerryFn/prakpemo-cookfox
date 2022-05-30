import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/landing_page.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/main_page.dart';

class UserRouteProcessing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return MainPage();
          } else {
            return LandingPage();
          }
        },
      ),
    );
  }
}
