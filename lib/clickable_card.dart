import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/detail_page.dart';
import 'package:posttest6_2009106051_ferry_fathurrahman/getx_controller/recipes_controller.dart';

class ClickableCard extends StatelessWidget {
  const ClickableCard({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.time,
    required this.ingredients,
    required this.steps,
    required this.bookmarked,
  }) : super(key: key);

  final int id;
  final String image;
  final String title;
  final String price;
  final String time;
  final String ingredients;
  final String steps;
  final bool bookmarked;

  @override
  Widget build(BuildContext context) {
    final Recipes _recipes = Get.put(Recipes());
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Get.to(
            () => DetailPage(
              image: image,
              title: title,
              price: price,
              time: time,
              ingredients: ingredients,
              steps: steps,
            ),
          );
        },
        child: Container(
          height: 128,
          padding: const EdgeInsets.all(9),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.timelapse,
                              size: 16,
                            ),
                            Text(time),
                          ],
                        ),
                        Text(price),
                        Obx(
                          () => IconButton(
                            onPressed: () {
                              _recipes.bookmark(id);
                              _recipes.update();
                            },
                            icon: _recipes.checkBookmarked(id)
                                ? const Icon(Icons.bookmark)
                                : const Icon(Icons.bookmark_border),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
