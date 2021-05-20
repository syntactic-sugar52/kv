import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kv/models/user.dart';

class Product extends ChangeNotifier {
  String uid;
  String videoUrl;
  String thumbnail;
  String videoId;
  Timestamp videoCreated;
  int views;
  Map comments;
  Map reviews;
  String category;
  String cardType;
  String details;
  String title;
  String price;
  int likes;
  int dislikes;
  UserModel user;
  Product(
      {this.videoCreated,
      this.thumbnail,
      this.comments,
      this.details,
      this.cardType,
      this.category,
      this.uid,
      this.dislikes,
      this.likes,
      this.price,
      this.videoId,
      this.user,
      this.reviews,
      this.title,
      this.videoUrl,
      this.views});
  Product.fromDocumentSnapshot({DocumentSnapshot doc}) {
    Map<String, dynamic> data = doc.data();
    uid = doc.id;
    videoId = data['video_id'];
    user = data['user'];
    videoUrl = data['video_url'];
    comments = data['comments'];
    category = data['category'];
    cardType = data['card_type'];
    thumbnail = data['thumbnail'];
    price = data['price'];
    views = data['views'];
    title = data['title'];
    likes = data['likes'];
    dislikes = data['dislikes'];
    details = data['details'];
    videoCreated = data['video_created'];
    reviews = data['reviews'];
  }

  Product.fromJson(Map<String, dynamic> json) {
    user = json['userName'];
    thumbnail = json['thumbnail'];
    videoUrl = json['video_url'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    reviews = json['reviews'];
    comments = json['comments'];
    videoCreated = json['video_created'];
    uid = json['uid'];
    cardType = json['catd_type'];
    thumbnail = json['thumbnail'];
    details = json['details'];
    videoId = json['vieo_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = this.user;
    data['thumbnail'] = this.thumbnail;
    data['video_url'] = this.videoUrl;
    data['video_created'] = this.videoCreated;
    data['video_id'] = this.videoId;
    data['uid'] = this.uid;
    data['price'] = this.price;
    data['likes'] = this.likes;
    data['card_type'] = this.cardType;
    data['category'] = this.category;
    data['title'] = this.title;
    data['details'] = this.details;
    data['dislikes'] = this.dislikes;
    data['reviews'] = this.reviews;

    return data;
  }
}
