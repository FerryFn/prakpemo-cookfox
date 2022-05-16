import 'package:flutter/material.dart';
import 'package:posttest5_2009106051_ferry_fathurrahman/variables.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.construction,
            color: Palette.white,
          ),
          Text(
            "Fitur pencarian akan segera datang.\nKembali lagi nanti!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Palette.white,
            ),
          ),
        ],
      ),
    );
  }
}