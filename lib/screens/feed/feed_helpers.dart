import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/screens/upload/upload_screen.dart';
import 'package:kv/utils/upload_post.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'components/cover_item.dart';
import 'components/section.dart';

class FeedHelpers with ChangeNotifier {
  Widget bodyFeed(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Text("Kappyvista",
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.cameraRetro,
                      color: kBlueButton,
                      // color: Color(0xff5463FF),
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadScreen()));
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Section(
              title: 'Product',
              children: [
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Section(
              title: 'Service',
              children: [
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Section(
              title: 'Referral',
              children: [
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Section(
              title: 'Investment',
              children: [
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Section(
              title: 'Information',
              children: [
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                      CoverItem(isBig: true, isArtist: false),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
