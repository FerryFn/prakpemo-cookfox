import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/data/palette.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/data/image_service.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/detail_page_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/recipes_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/user_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/recipe_form_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.image,
    required this.docName,
  }) : super(key: key);

  final String image;
  final String docName;

  Text header(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Text detailContent(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
    );
  }

  @override
  Widget build(BuildContext context) {
    final DetailPageController dpc = Get.put(DetailPageController(docName));
    final UserController userCtrl = Get.put(UserController());
    var mediaQuerySize = MediaQuery.of(context).size;
    var separator = const SizedBox(height: 32);
    final Recipes recipes = Get.put(Recipes());
    return Scaffold(
      appBar: AppBar(
        title: Text(dpc.title.value),
        backgroundColor: Palette.blue,
        actions: [
          if (!userCtrl.isAnonymous.value)
            IconButton(
              onPressed: () {
                Get.to(
                  () => recipeEditForm(docName),
                );
              },
              icon: const Icon(Icons.edit),
              tooltip: "Edit Resep",
            ),
          if (!userCtrl.isAnonymous.value)
            IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "Konfirmasi Penghapusan",
                    middleText:
                        "Anda yakin ingin menghapus resep ${dpc.title.value} ini?",
                    barrierDismissible: false,
                    textConfirm: "Hapus",
                    textCancel: "Batalkan",
                    buttonColor: Palette.orange,
                    confirmTextColor: Palette.white,
                    cancelTextColor: Palette.orange,
                    onConfirm: () async {
                      await FirebaseFirestore.instance
                          .collection("recipes")
                          .doc(docName)
                          .delete();
                      await FirebaseStorage.instance
                          .ref()
                          .child(image)
                          .delete();
                      recipes.getData();
                      Get.back(closeOverlays: true);
                    });
              },
              icon: const Icon(Icons.delete),
              tooltip: "Hapus Resep",
            ),
        ],
      ),
      body: Stack(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: FutureBuilder(
              future: ImageService.getImageURL(image),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return Container();
              },
            ),
          ),
          ListView(
            padding: EdgeInsets.only(
              top: mediaQuerySize.width / 1.75,
            ),
            shrinkWrap: true,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                constraints: BoxConstraints(
                  minHeight: mediaQuerySize.height,
                ),
                decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Obx(
                      () => Text(
                        dpc.title.value,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => Text(dpc.price.value)),
                        const SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.timelapse,
                              size: 16,
                            ),
                            Obx(() => Text("${dpc.time.value}m")),
                          ],
                        ),
                      ],
                    ),
                    separator,
                    SizedBox(
                      width: mediaQuerySize.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          header("Bahan-Bahan"),
                          Obx(() => detailContent(dpc.ingredients.value)),
                          separator,
                          header("Langkah-Langkah"),
                          Obx(() => detailContent(dpc.steps.value)),
                        ],
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
