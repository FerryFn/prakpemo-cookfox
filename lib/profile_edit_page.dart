import 'package:flutter/material.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/variables.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String gender = User.gender;
  List<String> genderList = ["Laki-Laki", "Perempuan"];

  TextEditingController usernameController =
      TextEditingController(text: User.username);
  TextEditingController nameController = TextEditingController(text: User.name);
  TextEditingController emailController =
      TextEditingController(text: User.email);
  TextEditingController phoneController =
      TextEditingController(text: User.phone);

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
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
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
                      controller_: usernameController,
                      text: "Username",
                    ),
                    batas(),
                    inputBox(
                      controller_: nameController,
                      text: "Nama Lengkap",
                    ),
                    batas(),
                    inputBox(
                      controller_: emailController,
                      text: "Email",
                      type: TextInputType.emailAddress,
                    ),
                    batas(),
                    inputBox(
                      controller_: phoneController,
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
                    for (var item in genderList)
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.white,
                            value: item,
                            groupValue: gender,
                            onChanged: (v) {
                              setState(() {
                                gender = v.toString();
                              });
                            },
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
                          setState(() {
                            User.username = usernameController.text;
                            User.name = nameController.text;
                            User.email = emailController.text;
                            User.phone = phoneController.text;
                            User.gender = gender;

                            const snackBar = SnackBar(
                              content: Text("Profil berhasil disimpan!"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            Navigator.pop(context);
                          });
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
