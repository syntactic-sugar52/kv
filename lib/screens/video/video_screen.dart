import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kv/constants/colors.dart';
import 'package:chewie/chewie.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  bool _isPlaying = true;
  TargetPlatform _platform;
  ChewieController _chewieController;

  Future<void> _initializeVideoPlayerFuture;
  AnimationController _animationController;
  String videoUrl =
      'httpss://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4';
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(videoUrl);
    // _videoPlayerController.addListener(() {
    //   setState(() {});
    // });
    // _videoPlayerController.setLooping(true);
    // _videoPlayerController.initialize().then((_) => setState(() {}));
    // _videoPlayerController.play();

    // _animationController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 8));
    // _animationController.repeat();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 5 / 8,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
            body: Stack(
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                // return StreamBuilder(
                //   stream: FirebaseFirestore.instance
                //       .collection("Product")
                //       .snapshots(),
                // builder: (context, snap) {
                return Stack(children: <Widget>[
                  _chewieController != null &&
                          _chewieController
                              .videoPlayerController.value.isInitialized
                      ? Chewie(
                          controller: _chewieController,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text('Loading'),
                          ],
                        ),
                  TextButton(
                    onPressed: () {
                      _chewieController?.enterFullScreen();
                    },
                    child: const Text('Fullscreen'),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _chewieController?.dispose();
                              _videoPlayerController.pause();
                              _videoPlayerController.seekTo(const Duration());
                              _chewieController = ChewieController(
                                videoPlayerController: _videoPlayerController,
                                autoPlay: true,
                                looping: true,
                                // subtitle: Subtitles([
                                //   Subtitle(
                                //     index: 0,
                                //     start: Duration.zero,
                                //     end: const Duration(seconds: 10),
                                //     text: 'Hello from subtitles',
                                //   ),
                                //   Subtitle(
                                //     index: 0,
                                //     start: const Duration(seconds: 10),
                                //     end: const Duration(seconds: 20),
                                //     text: 'Whats up? :)',
                                //   ),
                                // ]),
                                // subtitleBuilder: (context, subtitle) => Container(
                                //   padding: const EdgeInsets.all(10.0),
                                //   child: Text(
                                //     subtitle,
                                //     style: const TextStyle(color: Colors.white),
                                //   ),
                                // ),
                              );
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text("Landscape Video"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _platform = TargetPlatform.android;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text("Android controls"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _platform = TargetPlatform.iOS;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text("iOS controls"),
                          ),
                        ),
                        // _videoPlayerController.value.isInitialized
                        //     ? Container(
                        //         child: InkWell(
                        //             onTap: () {
                        //               setState(() {
                        //                 if (_videoPlayerController
                        //                     .value.isPlaying) {
                        //                   _isPlaying = false;
                        //                   _videoPlayerController.pause();
                        //                 } else {
                        //                   _isPlaying = true;
                        //                   _videoPlayerController.play();
                        //                 }
                        //               });
                        //             },
                        //             child: VideoPlayer(_videoPlayerController)),
                        //       )
                        //     : Container(),
                        // _isPlaying == false
                        //     ? Align(
                        //         alignment: Alignment.center,
                        //         child: Container(
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: 10, vertical: 10),
                        //           decoration: BoxDecoration(
                        //               color: Colors.black.withOpacity(.4),
                        //               borderRadius: BorderRadius.all(
                        //                   Radius.circular(10))),
                        //           child: Icon(
                        //             Icons.play_arrow,
                        //             size: 95,
                        //             color: kWhiteColor,
                        //           ),
                        //         ),
                        //       )
                        //     : Container(),
                        // _rightSideButtonsWidgets(index),
                        // _textDataWidgetBottom(sizingInformation, index),
                      )
                    ],
                  )
                ]);
              },
            ),
          ],
        ));
      },
    );
  }

  Widget _topWidgetFollowingAndForYou() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.arrow_left,
                  color: kBlack,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            // GestureDetector(
            //     onTap: () {
            //       setState(() {
            //         _followingForYouController = 0;
            //       });
            //     },
            //     child: Text("Following",
            //         style: _textStyleFollowingForYou(
            //             _followingForYouController == 0
            //                 ? Colors.white
            //                 : Colors.white60))),
            // SizedBox(
            //   width: 15,
            // ),
            // GestureDetector(
            //     onTap: () {
            //       setState(() {
            //         _followingForYouController = 1;
            //       });
            //     },
            //     child: Text("For you",
            //         style: _textStyleFollowingForYou(
            //             _followingForYouController == 1
            //                 ? Colors.white
            //                 : Colors.white60)))
          ],
        ),
      ),
    );
  }

  TextStyle _textStyleFollowingForYou(Color color) {
    return TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.w500);
  }

  Widget _rightSideButtonsWidgets(int index) {
    return Positioned(
      right: 10,
      bottom: 40,
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.80),
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image.network(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.xXpSz-NAAsxr379EU8TZqAHaE8%26pid%3DApi&f=1",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 13,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Text(
                      "+",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kBlack),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 38,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("3")
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Icon(Icons.message, size: 38),
                SizedBox(
                  height: 5,
                ),
                Text("4")
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Icon(FontAwesomeIcons.share, size: 38),
          ),
          SizedBox(
            height: 25,
          ),
          // AnimatedBuilder(
          //   builder: (BuildContext context, Widget child) {
          //     return Transform.rotate(
          //         angle: _animationController.value * 6.3, child: child);
          //   },
          //   animation: _animationController,
          //   child: Container(
          //     height: 50,
          //     width: 50,
          //     padding: EdgeInsets.all(10),
          //     decoration: BoxDecoration(
          //         color: Colors.black45,
          //         borderRadius: BorderRadius.all(Radius.circular(50))),
          //     child: Container(
          //       height: 30,
          //       width: 30,
          //       decoration: BoxDecoration(
          //         color: Colors.green,
          //         borderRadius: BorderRadius.all(Radius.circular(50)),
          //       ),
          //       child: ClipRRect(
          //           borderRadius: BorderRadius.all(Radius.circular(50)),
          //           child: Image.network(
          //             "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.xXpSz-NAAsxr379EU8TZqAHaE8%26pid%3DApi&f=1",
          //             fit: BoxFit.cover,
          //           )),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _textDataWidgetBottom(SizingInformation sizingInformation, int index) {
    return Positioned(
      bottom: 20,
      left: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          //   decoration: BoxDecoration(
          //       color: Colors.black38,
          //       borderRadius: BorderRadius.all(Radius.circular(8))),
          //   child: Row(
          //     children: <Widget>[
          //       Container(
          //           padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          //           decoration: BoxDecoration(
          //               color: Colors.orange,
          //               borderRadius: BorderRadius.all(Radius.circular(30))),
          //           child: Icon(
          //             Icons.play_arrow,
          //             size: 15,
          //           )),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       Text("Double Exposure")
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Text(
            "name",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: sizingInformation.localWidgetSize.width * 0.80,
            child: Text(
              "desc",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: sizingInformation.localWidgetSize.width * 0.70,
              child: Text("tag")),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: <Widget>[
          //       Icon(
          //         Icons.music_note,
          //         color: Colors.white,
          //         size: 20,
          //       ),
          //       SizedBox(
          //         width: 5,
          //       ),
          //       Container(
          //         height: 25,
          //         width: sizingInformation.localWidgetSize.width * 0.40,
          //         child: Marquee(
          //           text: "namehhhhhhhhhhhhhhhh",
          //           pauseAfterRound: Duration(seconds: 2),
          //           startPadding: 10.0,
          //           accelerationDuration: Duration(seconds: 1),
          //           accelerationCurve: Curves.linear,
          //           decelerationDuration: Duration(seconds: 1),
          //           decelerationCurve: Curves.easeOut,
          //           scrollAxis: Axis.horizontal,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           blankSpace: 20.0,
          //           velocity: 100.0,
          //         ),
          // )
        ],
        // ),
        // ),
        // ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }
}
