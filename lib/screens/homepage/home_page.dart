import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/json/songs_json.dart';
import 'package:kv/models/auth_model.dart';
import 'package:kv/models/user.dart';
import 'package:kv/screens/album/album_page.dart';
import 'package:kv/screens/cart/cart.dart';
import 'package:kv/screens/chat/chat_screen.dart';
import 'package:kv/screens/feed/feed_screen.dart';
import 'package:kv/screens/homepage/home_page_helpers.dart';

import 'package:page_transition/page_transition.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController homePageController = PageController();
  int activeMenu1 = 0;
  int activeMenu2 = 2;
  int pageIndex = 0;
  UserModel _currentUser;
  AuthModel _authModel;
  var photo;
  final homeKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: Provider.of<HomePageHelpers>(context, listen: false).getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                      children: List.generate(category_type_1.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMenu1 = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category_type_1[index],
                              style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      activeMenu1 == index ? kPrimary : kGrey,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            activeMenu1 == index
                                ? Container(
                                    width: 10,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: kPrimary,
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(songs.length - 5, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: AlbumPage(
                                      song: songs[index],
                                    ),
                                    type: PageTransitionType.scale));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(songs[index]['img']),
                                        fit: BoxFit.cover),
                                    color: kPrimary,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                songs[index]['title'],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  songs[index]['description'],
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: kGrey,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                      children: List.generate(category_type_2.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMenu2 = index;
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category_type_2[index],
                              style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      activeMenu2 == index ? kPrimary : kGrey,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            activeMenu2 == index
                                ? Container(
                                    width: 10,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: kPrimary,
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    );
                  })),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(songs.length - 5, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: AlbumPage(
                                      song: songs[index + 5],
                                    ),
                                    type: PageTransitionType.scale));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            songs[index + 5]['img']),
                                        fit: BoxFit.cover),
                                    color: kPrimary,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                songs[index + 5]['title'],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 180,
                                child: Text(
                                  songs[index + 5]['description'],
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: kGrey,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
