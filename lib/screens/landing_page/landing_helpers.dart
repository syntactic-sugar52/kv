import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/provider/current_user.dart';
import 'package:kv/screens/homepage/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LandingHelpers extends ChangeNotifier {
  bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: kPrimaryBackground),
    );
  }

  Widget taglineText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 10.0),
          child: Text(' Welcome ',
              style: GoogleFonts.roboto(
                  color: kWhite,
                  letterSpacing: 1,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold)),
        ),
        // Text(' Enter your email and password to start. ',
        //     style: GoogleFonts.roboto(
        //       color: Colors.grey.shade500,
        //       letterSpacing: 1,
        //       fontSize: 14.0,
        //       // fontWeight: FontWeight.bold
        //     )),
      ],
    );
  }

  Widget createAccountText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: kWhite,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(
              width: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
              child: Text(' Create account ',
                  style: GoogleFonts.roboto(
                      color: kWhite,
                      letterSpacing: 1,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }

  Widget privacyText(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "By continuing you agree to Kappyvista's Terms of",
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12.0),
        ),
        Text(
          "Services & Privacy Policy",
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12.0),
        ),
      ],
    );
  }
}
