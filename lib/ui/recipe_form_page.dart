import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/data/palette.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/data/image_service.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/detail_page_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/recipe_form_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/recipes_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui_templates/recipe_form_page.dart';

Widget recipeAddForm() {
  final RecipeFormController recipeFormController =
      Get.put(RecipeFormController());
  final Recipes recipes = Get.put(Recipes());
  return RecipeForm(
    editMode: false,
    onUpload: () async {
      final results = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["png", "jpg"],
      );

      if (results == null) {
        Get.snackbar(
          "Gagal!",
          "Tidak ada yang diunggah",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Palette.orange,
          colorText: Palette.white,
          margin: const EdgeInsets.all(12),
        );
        return;
      }

      recipeFormController.path.value = results.files.single.path!;
      recipeFormController.fileName.value = results.files.single.name;
    },
    onSubmit: () async {
      recipeFormController.fileName.value = base64Url.encode(
            List<int>.generate(
              32,
              (i) => Random().nextInt(256),
            ),
          ) +
          recipeFormController.fileName.value;

      if (recipeFormController.path.value.isEmpty) {
        return;
      }
      await ImageService.uploadFile(
          recipeFormController.path.value, recipeFormController.fileName.value);
      await FirebaseFirestore.instance.collection("recipes").add({
        "title": recipeFormController.titleController.text,
        "price": recipeFormController.priceController.text,
        "time": recipeFormController.timeController.text,
        "steps": recipeFormController.stepsController.text,
        "ingredients": recipeFormController.ingredientsController.text,
        "image": "recipe_image/${recipeFormController.fileName.value}",
        "bookmarked": false,
      });

      recipes.getData();

      Get.back();
      Get.snackbar(
        "Berhasil!",
        "Berhasil ditambahkan!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Palette.green,
        colorText: Palette.white,
        margin: const EdgeInsets.all(12),
      );
    },
  );
}

Widget recipeEditForm(String docName) {
  final RecipeFormController recipeFormController =
      Get.put(RecipeFormController());
  final Recipes recipes = Get.put(Recipes());
  final DetailPageController dpc = Get.put(DetailPageController(docName));
  recipeFormController.fillTextController(docName);
  return RecipeForm(
    editMode: true,
    docName: docName,
    onUpload: () async {
      final results = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ["png", "jpg"],
      );

      if (results == null) {
        Get.snackbar(
          "Gagal!",
          "Tidak ada yang diunggah",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Palette.orange,
          colorText: Palette.white,
          margin: const EdgeInsets.all(12),
        );
        return;
      }

      recipeFormController.path.value = results.files.single.path!;
      await FirebaseFirestore.instance
          .collection("recipes")
          .doc(docName)
          .get()
          .then((value) {
        recipeFormController.fileName.value =
            value.get("image").toString().replaceFirst("recipe_image/", "");
      });
    },
    onSubmit: () async {
      if (recipeFormController.path.value.isNotEmpty) {
        await ImageService.uploadFile(recipeFormController.path.value,
            recipeFormController.fileName.value);
      }
      await FirebaseFirestore.instance
          .collection("recipes")
          .doc(docName)
          .update({
        "title": recipeFormController.titleController.text,
        "price": recipeFormController.priceController.text,
        "time": recipeFormController.timeController.text,
        "steps": recipeFormController.stepsController.text,
        "ingredients": recipeFormController.ingredientsController.text,
      });

      recipes.getData();
      dpc.fillVariables(docName);

      Get.back();
      Get.snackbar(
        "Berhasil!",
        "Berhasil diperbarui!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Palette.green,
        colorText: Palette.white,
        margin: const EdgeInsets.all(12),
      );
    },
  );
}
