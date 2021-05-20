import 'package:flutter/material.dart';
import 'package:kv/constants/colors.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackground,
      body: Center(
        child: Text(
          "chat",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
