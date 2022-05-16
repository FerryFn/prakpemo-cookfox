import 'package:flutter/material.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/main_page.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/variables.dart';

class LandingPageContent extends StatelessWidget {
  const LandingPageContent({
    Key? key,
    required this.image,
    required this.header,
    required this.desc,
  }) : super(key: key);

  final String image;
  final String header;
  final String desc;

  @override
  Widget build(BuildContext context) {
    var mQSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
          width: mQSize.width / 1.1,
          height: mQSize.width / 1.1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Palette.white,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              desc,
              style: const TextStyle(
                fontSize: 16,
                color: Palette.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;
    PageController _controller = PageController(initialPage: 0);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 18),
          color: Palette.blue,
          child: SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  children: const [
                    LandingPageContent(
                      image: "assets/landing_page/illus1.png",
                      header: "CookFox, Kuasai Dunia Kuliner",
                      desc:
                          "Dunia masak-memasak, semuanya lebih mudah, semuanya ada dalam genggaman Anda",
                    ),
                    LandingPageContent(
                      image: "assets/landing_page/illus2.png",
                      header: "Cari, Simpan, Masak",
                      desc:
                          "Anda dapat mencari dan menyimpan masakan favorit Anda untuk diikuti nantinya",
                    ),
                    LandingPageContent(
                      image: "assets/landing_page/illus3.png",
                      header: "Berbagai Macam Masakan untuk Dicoba!",
                      desc:
                          "Anda takkan bosan-bosannya menemukan masakan-masakan baru!",
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 72,
                    width: mediaQuerySize.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MainPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Palette.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Mulai Sekarang!",
                        style: TextStyle(
                          color: Palette.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
