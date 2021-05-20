import 'package:flutter/material.dart';
import 'package:kv/constants/colors.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      body: Center(
        child: Text(
          "Cart",
          style: TextStyle(color: kWhite),
        ),
      ),
    );
  }
}
