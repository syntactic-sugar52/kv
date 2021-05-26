import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kv/Root/root.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/screens/profile/profile_screen.dart';
import 'package:kv/screens/upload/add_video.dart';
import 'package:kv/screens/upload/upload_screen.dart';
import 'package:kv/services/auth.dart';

import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  buildButton(context) => Container(
        padding: const EdgeInsets.only(left: 80, top: 0, right: 80, bottom: 0),
        child: FlatButton(
            color: Colors.cyanAccent,
            // color: Color(0xff80ffdb),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.cyanAccent),
            ),
            textColor: kBlack,
            child: Text(
              "LOG OUT",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              Auth user = Provider.of(context, listen: false);
              user.onSignOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Root()),
                  (route) => false);
            }),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      // backgroundColor: Color(0xff252525),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: kBlack,
        // backgroundColor: Color(0xff252525),
        // centerTitle: true,
        // leading: CircleAvatar(
        //   backgroundColor: Colors.grey,
        //   radius: 14,
        // ),

        title: Text(
          "Profile",
          style: TextStyle(
              fontFamily: "Goldplay",
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Feather.camera,
                color: kWhiteColor,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UploadScreen()));
              })
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                color: kBlack,
                // color: Color(0xff252525),
                child: ListTile(
                  leading: Text(
                    "My Profile",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 16),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.cyanAccent,
                      // color: Color(0xff64dfdf),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: kBlack,
                child: ListTile(
                  leading: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => EditProfileScreen()));
                    },
                    child: Icon(Icons.arrow_forward_ios,
                        size: 15, color: Colors.cyanAccent),
                  ),
                ),
              ),
              // Container(
              //   color: Color(0xff252525),
              //   child: ListTile(
              //     leading: Text(
              //       "My Cart",
              //       style: TextStyle(color: Colors.white, fontSize: 16),
              //     ),
              //     trailing: Icon(
              //       Icons.arrow_forward_ios,
              //       size: 15,
              //       color: Color(0xff64dfdf),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: kBlack,
                // color: Color(0xff252525),
                child: ListTile(
                  leading: Text(
                    "History",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.cyanAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: kBlack,
                // color: Color(0xff252525),
                child: ListTile(
                  leading: Text(
                    "Payment Details",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.cyanAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: kBlack,
                // color: Color(0xff252525),
                child: ListTile(
                  leading: Text(
                    "Log Out",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.cyanAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              // buildButton(context),
            ],
          ),
        ],
      ),
    );
  }
}
