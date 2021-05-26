import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/screens/homepage/home_page.dart';
import 'package:kv/screens/profile/profile.dart';

class BottomNavHelpers with ChangeNotifier {
  getBody(
    int activeTab,
  ) {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        Center(
          child: Text(
            "Library",
            style: TextStyle(
                fontSize: 20, color: kWhiteColor, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Search",
            style: TextStyle(
                fontSize: 20, color: kWhiteColor, fontWeight: FontWeight.bold),
          ),
        ),
        Profile(),
        // Center(
        //   child: Text(
        //     "Profile",
        //     style: TextStyle(
        //         fontSize: 20, color: kWhiteColor, fontWeight: FontWeight.bold),
        //   ),
        // ),
      ],
      // notifyListeners();
    );
  }
}
