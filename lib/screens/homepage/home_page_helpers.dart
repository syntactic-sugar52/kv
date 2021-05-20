import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/models/user.dart';
import 'package:kv/provider/current_user.dart';
import 'package:kv/services/auth.dart';
import 'package:kv/services/database.dart';
import 'package:kv/services/db_future.dart';
import 'package:kv/services/db_stream.dart';
import 'package:provider/provider.dart';

class HomePageHelpers with ChangeNotifier {
  Widget bottomNavigationBar(
    int index,
    PageController pageController,
    BuildContext context,
  ) {
    var _currentUser = Provider.of<Auth>(context);

    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: kPrimaryBackground,
      items: [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(EvaIcons.searchOutline), label: ""),
        BottomNavigationBarItem(icon: Icon(EvaIcons.shoppingCart), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.message_rounded), label: ""),
        // BottomNavigationBarItem(icon: Icon(EvaIcons.person), label: ""),
        BottomNavigationBarItem(
            label: "",
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blueGrey,
              backgroundImage: NetworkImage(_currentUser.getProfileUrl),
            ))
      ],
      iconSize: 22.0,
      unselectedItemColor: kWhite,
      selectedItemColor: kBluePrimary,
      onTap: (val) {
        index = val;
        pageController.jumpToPage(val);
        notifyListeners();
      },
    );
  }
}
