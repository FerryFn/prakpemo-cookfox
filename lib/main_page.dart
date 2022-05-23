import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/getx_controller/main_page_controller.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/profile_page.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/home_page.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/bookmark_page.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/data/palette.dart';

class MainPage extends StatelessWidget {
  MainPageController mainPageController = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.blue,
      body: Obx(
        () => IndexedStack(
          index: mainPageController.tabIndex.value,
          children: [
            HomePage(),
            BookmarkPage(),
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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "Disimpan",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Akun",
            ),
          ],
        ),
      ),
    );
  }
}
