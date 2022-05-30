import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/user_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/landing_page.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/profile_edit_page.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/data/palette.dart';

class ProfilePage extends StatelessWidget {
  final UserController userCtrl = Get.put(UserController());

  Widget separator() {
    return const SizedBox(
      height: 16,
    );
  }

  Widget bigText(
      {required String text, bool bold = false, double size = 18.0}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        color: Palette.white,
        fontWeight: bold == true ? FontWeight.w700 : FontWeight.normal,
      ),
    );
  }

  Widget textRow(String text, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        bigText(text: text, bold: true),
        bigText(text: text2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.blue,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            CircleAvatar(
              radius: mediaQuerySize.width / 6,
              child: Image.asset("assets/icon/cookfox.png"),
            ),
            separator(),
            Obx(
              () => bigText(
                text: userCtrl.isAnonymous.value ? "Tamu" : userCtrl.name.value,
                bold: true,
                size: 32,
              ),
            ),
            separator(),
            if (!userCtrl.isAnonymous.value)
              Column(
                children: [
                  separator(),
                  Obx(() => textRow("Email", userCtrl.email.value)),
                  separator(),
                  Obx(() => textRow("Nomor Telepon", userCtrl.phone.value)),
                  separator(),
                  Obx(() => textRow("Gender", userCtrl.gender.value)),
                  separator(),
                  separator(),
                  SizedBox(
                    width: mediaQuerySize.width,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => ProfileEditPage());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Palette.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Edit Profil",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            separator(),
            SizedBox(
              width: mediaQuerySize.width,
              height: 64,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(() => LandingPage());
                  
                  if (userCtrl.isAnonymous.value) {
                    FirebaseAuth.instance.currentUser!.delete();
                  }
                  FirebaseAuth.instance.signOut();
                },
                style: ElevatedButton.styleFrom(
                  primary: Palette.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Keluar",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
