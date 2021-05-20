import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kv/Root/root.dart';
import 'package:kv/screens/profile/profile_screen.dart';
import 'package:kv/services/auth.dart';

import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  buildButton(context) => Container(
        padding: const EdgeInsets.only(left: 80, top: 0, right: 80, bottom: 0),
        child: FlatButton(
            color: Color(0xff80ffdb),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Color(0xff80ffdb)),
            ),
            textColor: Colors.black,
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
      backgroundColor: Color(0xff252525),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xff252525),
        centerTitle: true,
        // leading: IconButton(
        //     icon: Icon(
        //       Icons.arrow_back_sharp,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     }),
        title: Text(
          "Profile",
          style: TextStyle(
              fontFamily: "Goldplay",
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ListView(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                color: Color(0xff252525),
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
                      color: Color(0xff64dfdf),
                    ),
                  ),
                ),
              ),
              Container(
                color: Color(0xff252525),
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
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Color(0xff64dfdf),
                    ),
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
              Container(
                color: Color(0xff252525),
                child: ListTile(
                  leading: Text(
                    "History",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Color(0xff64dfdf),
                  ),
                ),
              ),
              Container(
                color: Color(0xff252525),
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
                      color: Color(0xff64dfdf),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              buildButton(context),
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
