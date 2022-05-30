import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/main_page_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/profile_page.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/home_page.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/bookmark_page.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/data/palette.dart';

class MainPage extends StatelessWidget {
  MainPageController mainPageController = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    var currentUserNotAnonymous =
        !FirebaseAuth.instance.currentUser!.isAnonymous;
    return Scaffold(
      backgroundColor: Palette.blue,
      body: Obx(
        () => IndexedStack(
          index: mainPageController.tabIndex.value,
          children: [
            HomePage(),
            if (currentUserNotAnonymous) BookmarkPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: mainPageController.tabIndex.value,
          onTap: mainPageController.changeTabIndex,
          selectedItemColor: Palette.blue,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Beranda",
            ),
            if (currentUserNotAnonymous)
              const BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: "Disimpan",
              ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Akun",
            ),
          ],
        ),
      ),
    );
  }
}
