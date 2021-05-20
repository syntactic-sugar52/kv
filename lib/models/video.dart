import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VideoModel with ChangeNotifier {
  String userName;
  String thumbnail;
  String mediaUrl;
  Timestamp videoCreated;

  VideoModel({this.mediaUrl, this.thumbnail, this.userName, this.videoCreated});

  VideoModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    thumbnail = json['thumbnail'];
    mediaUrl = json['mediaUrl'];
    videoCreated = json['video_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userName'] = this.userName;
    data['thumbnail'] = this.thumbnail;
    data['mediaUrl'] = this.mediaUrl;
    data['video_created'] = this.videoCreated;
    return data;
  }
}
