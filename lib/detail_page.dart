import 'package:flutter/material.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/variables.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.time,
    required this.ingredients,
    required this.steps,
  }) : super(key: key);

  final String image;
  final String title;
  final String price;
  final String time;
  final String ingredients;
  final String steps;

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
    var mediaQuerySize = MediaQuery.of(context).size;
    var separator = const SizedBox(height: 32);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Palette.blue,
      ),
      body: Stack(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
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
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(price),
                        const SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.timelapse,
                              size: 16,
                            ),
                            Text(time),
                          ],
                        ),
                      ],
                    ),
                    separator,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header("Bahan-Bahan"),
                        detailContent(ingredients),
                        separator,
                        header("Langkah-Langkah"),
                        detailContent(steps),
                      ],
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
