import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFormController extends GetxController {
  var username = "ferryf3".obs;
  var name = "Férry Fathurrahman".obs;
  var email = "f.fe@aleeas.com".obs;
  var phone = "+6281388008800".obs;
  var gender = "Laki-Laki".obs;

  List<String> genderList = ["Laki-Laki", "Perempuan"];

  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    usernameController.text = username.value;
    nameController.text = name.value;
    emailController.text = email.value;
    phoneController.text = phone.value;
  }
}
