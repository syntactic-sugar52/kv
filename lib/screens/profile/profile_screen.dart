import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/constants/constants.dart';
import 'package:kv/models/user.dart';
import 'package:kv/screens/profile/profile.dart';
import 'package:kv/screens/profile/profile_helpers.dart';
import 'package:kv/services/auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  // UserModel _currentUser;
  // AuthModel _authModel;
  //  @override
  // void didChangeDependencies() {
  //   _authModel = Provider.of<AuthModel>(context);
  //   _currentUser = Provider.of<UserModel>(context);
  //   super.didChangeDependencies();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlack,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: kWhiteColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
                icon: Icon(
                  EvaIcons.moreHorizotnal,
                  color: kWhite,
                ),
                onPressed: () {
                  //
                })
          ],
          backgroundColor: kBlack,
          // title: RichText(
          //   text: TextSpan(
          //       text: 'My ',
          //       style: TextStyle(
          //           color: kWhite, fontWeight: FontWeight.w700, fontSize: 20.0),
          //       children: [
          //         TextSpan(
          //             text: 'Profile',
          //             style: TextStyle(
          //                 color: kBlueButton,
          //                 fontWeight: FontWeight.w700,
          //                 fontSize: 20.0))
          //       ]),
          // ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<DocumentSnapshot>(
                  stream: usersRef
                      .doc(Provider.of<Auth>(context, listen: false)
                          .getCurrentUser
                          .uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(children: [
                        Provider.of<ProfileHelpers>(context, listen: false)
                            .headerProfile(context, snapshot.data),
                        Provider.of<ProfileHelpers>(context, listen: false)
                            .divider(),
                        Provider.of<ProfileHelpers>(context, listen: false)
                            .middleProfile(context, snapshot),
                        Provider.of<ProfileHelpers>(context, listen: false)
                            .footerProfile(context, snapshot)
                      ]);
                    }
                  }),
              decoration: BoxDecoration(
                  color: kBlack, borderRadius: BorderRadius.circular(15.0)),
            ),
          ),
        ));
  }
}
