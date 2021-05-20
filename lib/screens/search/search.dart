import 'package:flutter/material.dart';
import 'package:kv/constants/colors.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      body: Center(
        child: Text(
          "Search",
          style: TextStyle(color: kWhite),
        ),
      ),
    );
  }
}
