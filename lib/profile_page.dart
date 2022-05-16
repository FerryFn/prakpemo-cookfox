import 'package:flutter/material.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/profile_edit_page.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/variables.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget batas() {
    return const SizedBox(
      height: 16,
    );
  }

  Widget bigText(
      {required String text, bool bold = false, double size = 18.0}) {
    return Text(
      text,
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
            bigText(text: User.name, bold: true, size: 32),
            batas(),
            batas(),
            textRow("Username", User.username),
            batas(),
            textRow("Email", User.email),
            batas(),
            textRow("Nomor Telepon", User.phone),
            batas(),
            textRow("Gender", User.gender),
            batas(),
            batas(),
            SizedBox(
              width: mediaQuerySize.width,
              height: 64,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileEditPage(),
                    ),
                  ).then((value) {
                    setState(() {});
                  });
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
