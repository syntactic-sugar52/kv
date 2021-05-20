import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/models/auth_model.dart';
import 'package:kv/models/user.dart';
import 'package:kv/screens/cart/cart.dart';
import 'package:kv/screens/chat/chat_screen.dart';
import 'package:kv/screens/feed/feed_screen.dart';
import 'package:kv/screens/homepage/home_page_helpers.dart';
import 'package:kv/screens/profile/profile.dart';
import 'package:kv/screens/profile/profile_screen.dart';
import 'package:kv/screens/search/search.dart';
import 'package:kv/services/database.dart';
import 'package:kv/services/db_future.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController homePageController = PageController();

  int pageIndex = 0;
  UserModel _currentUser;
  AuthModel _authModel;
  var photo;
  final homeKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   _authModel = Provider.of<AuthModel>(context);
  //   _currentUser = Provider.of<UserModel>(context);
  //   // photo = Provider.of<UserModel>(context).profilePhoto;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homeKey,
        backgroundColor: kPrimaryBackground,
        body: PageView(
          controller: homePageController,
          children: [
            FeedScreen(),
            SearchScreen(),
            Cart(),
            ChatScreen(),
            Profile()
          ],
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              pageIndex = page;
            });
          },
        ),
        bottomNavigationBar:
            Provider.of<HomePageHelpers>(context, listen: false)
                .bottomNavigationBar(pageIndex, homePageController, context
                    //  homeKey.currentContext
                    ));
  }
}
