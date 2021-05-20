import 'package:flutter/material.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/screens/landing_page/landing_helpers.dart';
import 'package:provider/provider.dart';

import 'landing_services.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var landingHelpers = Provider.of<LandingHelpers>(context, listen: false);
    var landingService = Provider.of<LandingService>(context, listen: false);
    return Scaffold(
        backgroundColor: kPrimaryBackground,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              landingHelpers.taglineText(context),
              landingService.login(context),
              landingService.loginButton(context),
              landingService.textOr(),
              landingService.signInButton(context),
              landingService.googleButton(context),
              landingHelpers.privacyText(context),
            ],
          ),
        ));
  }
}
