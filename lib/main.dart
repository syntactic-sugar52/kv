import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kv/models/auth_model.dart';
import 'package:kv/models/user.dart';

import 'package:kv/provider/current_user.dart';
import 'package:kv/provider/user_auth.dart';
import 'package:kv/screens/feed/feed_helpers.dart';
import 'package:kv/screens/homepage/home_page_helpers.dart';
import 'package:kv/screens/landing_page/landing_helpers.dart';
import 'package:kv/screens/landing_page/landing_services.dart';
import 'package:kv/screens/landing_page/landing_utils.dart';
import 'package:kv/screens/profile/profile_helpers.dart';
import 'package:kv/screens/splash_screen/splash_screen.dart';
import 'package:kv/screens/upload/upload_helpers.dart';
import 'package:kv/services/auth.dart';
import 'package:kv/services/db_future.dart';

import 'package:kv/utils/media_utility.dart';
import 'package:kv/utils/upload_post.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Root/root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp(app: app));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final FirebaseApp app;
  MyApp({this.app});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //auth
        ChangeNotifierProvider<Auth>(create: (_) => Auth()),
        ChangeNotifierProvider<DBFuture>(create: (_) => DBFuture()),
        //state
        ChangeNotifierProvider<CurrentUser>(create: (_) => CurrentUser()),
        ChangeNotifierProvider<UserModel>(create: (_) => UserModel()),
        ChangeNotifierProvider(
          create: (_) => LandingUtils(),
        ),
        ChangeNotifierProvider(
          create: (_) => UploadPost(),
        ),
        ChangeNotifierProvider(
          create: (_) => UploadHelpers(),
        ),
        ChangeNotifierProvider(
          create: (_) => FeedHelpers(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomePageHelpers(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileHelpers(),
        ),
        ChangeNotifierProvider(
          create: (_) => LandingService(),
        ),

        ChangeNotifierProvider(
          create: (_) => LandingHelpers(),
        ),

        // services:
        Provider<MediaUtility>(create: (_) => MediaUtility.instance),
      ],
      child: MaterialApp(
        title: 'Kappyvista',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
                color: Colors.black,
              ),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: Root(),
      ),
    );
  }
}
