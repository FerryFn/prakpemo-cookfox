import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/data/palette.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/sign_in_up_form_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/registration_page.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/user_route_processing.dart';

class LoginPage extends StatelessWidget {
  final SignInUpController signInUpController = Get.put(SignInUpController());

  Widget batas() {
    return const SizedBox(
      height: 24,
    );
  }

  Widget inputBox({
    required TextEditingController controller_,
    required String text,
    type = TextInputType.text,
    obscureText = false,
  }) {
    return TextFormField(
      keyboardType: type,
      controller: controller_,
      decoration: InputDecoration(
        labelText: text,
        fillColor: Colors.white,
        filled: true,
      ),
      style: const TextStyle(
        fontSize: 20,
      ),
      obscureText: obscureText,
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Akun"),
        backgroundColor: Palette.blue,
      ),
      backgroundColor: Palette.blue,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          batas(),
          inputBox(
            controller_: signInUpController.emailController,
            text: "Email",
            type: TextInputType.emailAddress,
          ),
          batas(),
          inputBox(
            controller_: signInUpController.passwordController,
            text: "Password",
            obscureText: true,
          ),
          batas(),
          SizedBox(
            width: mediaQuerySize.width,
            height: 64,
            child: ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: signInUpController.emailController.text.trim(),
                    password: signInUpController.passwordController.text,
                  );

                  Get.offAll(() => UserRouteProcessing());
                } on FirebaseAuthException catch (e) {
                  Get.dialog(
                    AlertDialog(
                      content: Text(e.message!),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text("Tutup"),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Palette.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.off(() => RegistrationPage());
            },
            child: const Text(
              "Belum punya akun? Registrasi sekarang!",
              style: TextStyle(
                color: Palette.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
