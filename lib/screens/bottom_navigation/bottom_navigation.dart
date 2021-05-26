import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/screens/bottom_navigation/bottom_nav_helpers.dart';
import 'package:kv/screens/chat/chat_screen.dart';
import 'package:kv/screens/homepage/home_page.dart';
import 'package:kv/screens/profile/profile.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int activeTab = 0;
  BottomNavHelpers _bottomNavHelpers;
  @override
  Widget build(BuildContext context) {
    this._bottomNavHelpers = Provider.of(context, listen: false);
    return Scaffold(
        backgroundColor: kBlack,
        bottomNavigationBar: getFooter(),
        body: getBody()
        // body: _bottomNavHelpers.getBody(activeTab),
        );
  }

  getBody(
      // int activeTab,
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
        ChatScreen(),
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

  Widget getFooter() {
    List items = [
      Feather.home,
      Feather.book,
      Feather.search,
      Feather.message_circle,
      Feather.user,
    ];
    return Container(
      height: 80,
      decoration: BoxDecoration(color: kBlack),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return IconButton(
                  icon: Icon(
                    items[index],
                    color: activeTab == index ? kPrimary : kWhiteColor,
                  ),
                  onPressed: () {
                    setState(() {
                      activeTab = index;
                    });
                  });
            })),
      ),
    );
  }
}
