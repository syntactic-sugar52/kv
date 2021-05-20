import 'package:flutter/material.dart';
import 'package:kv/models/auth_model.dart';
import 'package:kv/models/user.dart';
import 'package:kv/provider/current_user.dart';
import 'package:kv/screens/homepage/home_page.dart';
import 'package:kv/screens/landing_page/landing_page.dart';
import 'package:kv/screens/splash_screen/splash_screen.dart';
import 'package:kv/services/auth.dart';
import 'package:kv/services/db_stream.dart';

import 'package:provider/provider.dart';

enum AuthStatus { notLoggedIn, loggedIn }

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  String currentUid;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    Auth _user = Provider.of<Auth>(context, listen: false);

    String returnString = await _user.onStartUp();

    if (returnString == 'success') {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = LandingPage();
        break;
      case AuthStatus.loggedIn:
        retVal = HomePage();
        break;
      default:
    }
    return retVal;
  }
}
