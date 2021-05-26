import 'package:flutter/material.dart';
import 'package:kv/screens/feed/feed_helpers.dart';

import 'package:provider/provider.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black26,
        backgroundColor: Color(0xff252525),
        body:
            Provider.of<FeedHelpers>(context, listen: false).bodyFeed(context));
  }
}
