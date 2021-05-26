import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/models/user.dart';
import 'package:provider/provider.dart';

class ProfileHelpers with ChangeNotifier {
  Widget headerProfile(BuildContext context, DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30.0),
                  height: 200.0,
                  width: 135.0,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 35.0,
                          backgroundImage: NetworkImage(
                            (data['profile_photo']),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          data['userName'],
                          style: TextStyle(
                              color: kWhite,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              EvaIcons.email,
                              color: Colors.cyanAccent,
                              size: 13,
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              data['email'],
                              style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70.0,
                            width: 80.0,
                            child: Column(
                              children: [
                                Text(
                                  '0',
                                  style:
                                      TextStyle(color: kWhite, fontSize: 14.0),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 70.0,
                            width: 80.0,
                            child: Column(
                              children: [
                                Text(
                                  '0',
                                  style:
                                      TextStyle(color: kWhite, fontSize: 14.0),
                                ),
                                Text(
                                  'StoreList',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 70.0,
                            width: 80.0,
                            child: Column(
                              children: [
                                Text(
                                  '0',
                                  style:
                                      TextStyle(color: kWhite, fontSize: 14.0),
                                ),
                                Text(
                                  'Deals',
                                  style: TextStyle(
                                      color: kWhite,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.0),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ]),
    );
  }

  Widget divider() {
    return Center(
      child: SizedBox(
        height: 25.0,
        width: 350.0,
        child: Divider(
          color: kWhiteColor,
        ),
      ),
    );
  }

  Widget middleProfile(BuildContext context, dynamic snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                FontAwesomeIcons.award,
                color: kBluePrimary,
                size: 14,
              ),
              Text(
                'Recently Added',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    color: kWhiteColor),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // color: Colors.amber,
              color: kBlack,
              borderRadius: BorderRadius.circular(15.0)),
        )
      ],
    );
  }

  Widget footerProfile(BuildContext context, dynamic snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Text(
              "No StoreList Yet",
              style: TextStyle(color: kWhiteColor),
            ),
            SizedBox(
              height: 5,
            ),
            Image.network(
                'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fclipground.com%2Fimages%2Fhow-to-add-desktop-clipart-windows-10-1.jpg&f=1&nofb=1'),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: kBlack.withOpacity(0.4),
            borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
