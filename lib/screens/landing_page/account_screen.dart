import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/screens/landing_page/landing_helpers.dart';
import 'package:kv/screens/landing_page/landing_services.dart';
import 'package:kv/screens/landing_page/landing_utils.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var landingService = Provider.of<LandingService>(context, listen: false);
    var landingHelpers = Provider.of<LandingHelpers>(context, listen: false);
    var landingUtils = Provider.of<LandingUtils>(context, listen: false);

    return Scaffold(
      backgroundColor: kPrimaryBackground,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            landingHelpers.createAccountText(context),
            GestureDetector(
                onTap: () async {
                  var photo = await landingUtils.showMediaDialog(context);
                  setState(() {
                    landingUtils.userAvatar = photo;
                    landingUtils.userAvatarUrl = photo.path;
                  });
                },
                child: landingUtils.photoBox(
                    landingUtils.userAvatar, 100.0, 100.0, context)),
            landingService.profilePhotoText(context),
            landingService.signInSheet(context),
            landingService.createAccountButton(context),
          ],
        ),
      ),
    );
  }
}
