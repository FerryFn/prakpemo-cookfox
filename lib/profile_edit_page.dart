import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/getx_controller/user_form_controller.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/data/palette.dart';

class ProfileEditPage extends StatelessWidget {
  final UserFormController userFormController = Get.put(UserFormController());

  Widget batas() {
    return const SizedBox(
      height: 24,
    );
  }

  Widget inputBox({
    required TextEditingController controller_,
    required String text,
    dynamic type = TextInputType.text,
  }) {
    return TextField(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profil"),
        backgroundColor: Palette.blue,
      ),
      backgroundColor: Palette.blue,
      body: ListView(
        children: [
          Column(
            children: [
              batas(),
              CircleAvatar(
                radius: mediaQuerySize.width / 6,
                child: Image.asset("assets/icon/cookfox.png"),
              ),
              batas(),
              Container(
                margin: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    inputBox(
                      controller_: userFormController.usernameController,
                      text: "Username",
                    ),
                    batas(),
                    inputBox(
                      controller_: userFormController.nameController,
                      text: "Nama Lengkap",
                    ),
                    batas(),
                    inputBox(
                      controller_: userFormController.emailController,
                      text: "Email",
                      type: TextInputType.emailAddress,
                    ),
                    batas(),
                    inputBox(
                      controller_: userFormController.phoneController,
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
                    for (var item in userFormController.genderList)
                      Row(
                        children: [
                          Obx(
                            () => Radio(
                              activeColor: Palette.white,
                              value: item,
                              groupValue: userFormController.gender.value,
                              onChanged: (v) {
                                userFormController.gender.value = v.toString();
                              },
                            ),
                          ),
                          Text(
                            item,
                            style: const TextStyle(
                                fontSize: 20, color: Palette.white),
                          ),
                        ],
                      ),
                    batas(),
                    SizedBox(
                      width: mediaQuerySize.width,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () {
                          userFormController.username.value =
                              userFormController.usernameController.text;
                          userFormController.name.value =
                              userFormController.nameController.text;
                          userFormController.email.value =
                              userFormController.emailController.text;
                          userFormController.phone.value =
                              userFormController.phoneController.text;

                          Get.back();

                          Get.snackbar(
                            "Berhasil!",
                            "Profil berhasil disimpan",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Palette.green,
                            colorText: Palette.white,
                            margin: const EdgeInsets.all(12),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Palette.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Simpan",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
