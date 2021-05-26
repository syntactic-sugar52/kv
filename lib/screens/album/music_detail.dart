import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:kv/constants/colors.dart';
import 'package:kv/models/product.dart';
import 'package:kv/services/db_future.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';

class MusicDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final Color color;
  final String img;
  final String songUrl;

  const MusicDetailPage(
      {Key key,
      this.title,
      this.description,
      this.color,
      this.img,
      this.songUrl})
      : super(key: key);
  @override
  _MusicDetailPageState createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage>
    with SingleTickerProviderStateMixin {
  double _currentSliderValue = 20;

  VideoPlayerController _videoPlayerController;
  bool _isPlaying = true;
  int _followingForYouController = 0;
  TextStyle _followingForYouStyle =
      TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500);
  Future<void> _initializeVideoPlayerFuture;
  AnimationController _animationController;
  bool startedPlaying = false;
  String videoUrl =
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4';
  String title = '';
  var _product;

  @override
  void initState() {
    // _product = FirebaseFirestore.instance
    //     .collection("Product")
    //     .get()
    //     .then((QuerySnapshot querySnapshot) => {
    //           querySnapshot.docs.forEach((doc) {
    //             Map<String, dynamic> data = doc.data();
    //             // _controller.dispose();
    //             videoUrl = doc["video_url"];
    //             title = data["title"];
    //             _videoPlayerController =
    //                 VideoPlayerController.network(videoUrl);
    //             _initializeVideoPlayerFuture =
    //                 _videoPlayerController.initialize().then((_) {
    //               // _videoPlayerController.setLooping(true);
    //               setState(() {});
    //               // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //             });

    //             print(videoUrl);
    //           })
    //         });
    _videoPlayerController.initialize();
    super.initState();
  }

  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBlack,
        // appBar: getAppBar(),
        body: getBody());
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: kBlack,
      elevation: 0,
      leading: IconButton(
          icon: Icon(
            Feather.arrow_left,
            color: kWhiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        IconButton(
            icon: Icon(
              Feather.more_vertical,
              color: kWhiteColor,
            ),
            onPressed: null)
      ],
    );
  }

  Widget getText() {
    var size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 180,
      left: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: size.width - 80,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                AntDesign.addfolder,
                color: kWhiteColor,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 18,
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 150,
                    child: Text(
                      widget.description,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15, color: kWhiteColor.withOpacity(0.5)),
                    ),
                  )
                ],
              ),
              Icon(
                Feather.more_vertical,
                color: kWhiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildSlider() {
    return Positioned(
      bottom: 130,
      left: 80,
      child: Slider(
          activeColor: kPrimary,
          value: _currentSliderValue,
          min: 0,
          max: 200,
          onChanged: (value) {
            setState(() {
              _currentSliderValue = value;
            });
            // seekSound();
          }),
    );
  }

  buildTime() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "1:50",
              style: TextStyle(color: kWhiteColor.withOpacity(0.5)),
            ),
            Text(
              "4:68",
              style: TextStyle(color: kWhiteColor.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }

  buildPlayer() {
    return Positioned(
      bottom: 25,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Feather.shuffle,
                  color: kWhiteColor.withOpacity(0.8),
                  size: 25,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Feather.skip_back,
                  color: kWhiteColor.withOpacity(0.8),
                  size: 25,
                ),
                onPressed: null),
            IconButton(
                iconSize: 50,
                icon: Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: kPrimary),
                  child: Center(
                    child: Icon(
                      isPlaying
                          ? Entypo.controller_stop
                          : Entypo.controller_play,
                      size: 28,
                      color: kWhiteColor,
                    ),
                  ),
                ),
                onPressed: () {
                  // if (isPlaying) {
                  //   stopSound(widget.songUrl);
                  //   setState(() {
                  //     isPlaying = false;
                  //   });
                  // } else {
                  //   playSound(widget.songUrl);
                  //   setState(() {
                  //     isPlaying = true;
                  //   });
                  // }
                }),
            IconButton(
                icon: Icon(
                  Feather.skip_forward,
                  color: kWhiteColor.withOpacity(0.8),
                  size: 25,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  AntDesign.retweet,
                  color: kWhiteColor.withOpacity(0.8),
                  size: 25,
                ),
                onPressed: null)
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return Scaffold(
        body: Stack(children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: <Widget>[
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Product")
                        .snapshots(),
                    builder: (context, snapshot) {
                      Map<String, dynamic> data = snapshot.data;
                      Product productJson = Product.fromJson(
                          json.decode(json.encode(snapshot.data)));
                      print(productJson);
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              AspectRatio(
                                aspectRatio:
                                    _videoPlayerController.value.aspectRatio,
                                child: VideoPlayer(_videoPlayerController),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Card(
                                  color: kPrimaryBackground,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Details",
                                        style: TextStyle(color: kWhiteColor),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          "Title: ",
                                          style: TextStyle(color: kWhiteColor),
                                        ),
                                        title: Text(
                                          "s",
                                          style: TextStyle(color: kWhiteColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              );
            },
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_videoPlayerController.value.isPlaying) {
                _videoPlayerController.pause();
              } else {
                _videoPlayerController.play();
                _videoPlayerController.setLooping(true);
              }
            });
          },
          child: Icon(
            _videoPlayerController.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }
}
