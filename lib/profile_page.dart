import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/profile_edit_page.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/data/palette.dart';

import 'getx_controller/user_form_controller.dart';

class ProfilePage extends StatelessWidget {
  final UserFormController userFormRead = Get.put(UserFormController());

  Widget batas() {
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: mediaQuerySize.width / 6,
              child: Image.asset("assets/icon/cookfox.png"),
            ),
            batas(),
            Obx(() => bigText(text: userFormRead.name.value, bold: true, size: 32)),
            batas(),
            batas(),
            Obx(() => textRow("Username", userFormRead.username.value)),
            batas(),
            Obx(() => textRow("Email", userFormRead.email.value)),
            batas(),
            Obx(() => textRow("Nomor Telepon", userFormRead.phone.value)),
            batas(),
            Obx(() => textRow("Gender", userFormRead.gender.value)),
            batas(),
            batas(),
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
      ),
    );
  }
}
