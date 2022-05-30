import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInUpController extends GetxController {
  List<String> genderList = ["Laki-Laki", "Perempuan"];
  var gender = "".obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  bool validateSignUp() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        passwordConfirmController.text.isEmpty ||
        nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        gender.value.isEmpty) {
      Get.dialog(
        AlertDialog(
          content: const Text("Masih ada kolom yang kosong!"),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Tutup"),
            ),
          ],
        ),
      );
      return false;
    }

    if (passwordController.text != passwordConfirmController.text) {
      Get.dialog(
        AlertDialog(
          content: const Text("Konfirmasi password tidak sama"),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Tutup"),
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }
}
