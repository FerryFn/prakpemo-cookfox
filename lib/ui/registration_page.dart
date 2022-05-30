import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/data/palette.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/sign_in_up_form_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/login_page.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/main_page.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/user_route_processing.dart';

class RegistrationPage extends StatelessWidget {
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
        title: const Text("Registrasi Akun"),
        backgroundColor: Palette.blue,
      ),
      backgroundColor: Palette.blue,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          batas(),
          inputBox(
            controller_: signInUpController.nameController,
            text: "Nama Lengkap",
          ),
          batas(),
          inputBox(
            controller_: signInUpController.emailController,
            text: "Email",
            type: TextInputType.emailAddress,
          ),
          batas(),
          inputBox(
            controller_: signInUpController.phoneController,
            text: "Nomor HP",
            type: TextInputType.phone,
          ),
          batas(),
          const Text(
            "Jenis Kelamin",
            style: TextStyle(
                fontSize: 20,
                color: Palette.white,
                fontWeight: FontWeight.w600),
          ),
          for (var item in signInUpController.genderList)
            Row(
              children: [
                Obx(
                  () => Radio(
                    activeColor: Palette.white,
                    value: item,
                    groupValue: signInUpController.gender.value,
                    onChanged: (v) {
                      signInUpController.gender.value = v.toString();
                    },
                  ),
                ),
                Text(
                  item,
                  style: const TextStyle(fontSize: 20, color: Palette.white),
                ),
              ],
            ),
          batas(),
          inputBox(
            controller_: signInUpController.passwordController,
            text: "Password",
            obscureText: true,
          ),
          batas(),
          inputBox(
            controller_: signInUpController.passwordConfirmController,
            text: "Konfirmasi Password",
            obscureText: true,
          ),
          batas(),
          SizedBox(
            width: mediaQuerySize.width,
            height: 64,
            child: ElevatedButton(
              onPressed: () async {
                if (signInUpController.validateSignUp()) {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: signInUpController.emailController.text.trim(),
                      password: signInUpController.passwordController.text,
                    );

                    var userID = FirebaseAuth.instance.currentUser!.uid;
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(userID)
                        .set({
                      "name": signInUpController.nameController.text,
                      "email": signInUpController.emailController.text,
                      "phone": signInUpController.phoneController.text,
                      "gender": signInUpController.gender.value,
                    });

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
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Palette.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Registrasi",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.off(() => LoginPage());
            },
            child: const Text(
              "Sudah punya akun? Masuk sekarang",
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
