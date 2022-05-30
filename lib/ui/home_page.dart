import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui/recipe_form_page.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/ui_templates/clickable_card.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/recipes_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/getx_controller/user_controller.dart';
import 'package:posttest7_2009106051_ferry_fathurrahman/data/palette.dart';

class HomePage extends StatelessWidget {
  final UserController userCtrl = Get.put(UserController());
  final Recipes _recipes = Get.put(Recipes());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.blue,
      floatingActionButton: Visibility(
        visible: !userCtrl.isAnonymous.value,
        child: FloatingActionButton(
          backgroundColor: Palette.orange,
          onPressed: () {
            Get.to(() => recipeAddForm());
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                color: Palette.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(55, 5, 5, 23),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Halo,",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Obx(
                        () => Text(
                          userCtrl.isAnonymous.value ? "Tamu" : userCtrl.name.value,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    child: Image.asset("assets/icon/cookfox.png"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.all(18),
                  itemCount: _recipes.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = _recipes.recipes[index];
                    return ClickableCard(
                      image: recipe.image,
                      title: recipe.title,
                      price: recipe.price,
                      time: recipe.time,
                      ingredients: recipe.ingredients,
                      steps: recipe.steps,
                      bookmarked: recipe.bookmarked.value,
                      docName: recipe.docName,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
