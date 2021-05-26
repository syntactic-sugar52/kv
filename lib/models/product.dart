import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kv/models/user.dart';

class Product extends ChangeNotifier {
  String productUid;
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
  // String contactNumber;
  String price;
  int likes;
  String quantity;
  int dislikes;
  String userUid;
  Product(
      {this.videoCreated,
      this.thumbnail,
      this.comments,
      this.details,
      this.cardType,
      this.quantity,
      this.category,
      this.productUid,
      this.dislikes,
      this.likes,
      // this.contactNumber,
      this.price,
      this.videoId,
      this.userUid,
      this.reviews,
      this.title,
      this.videoUrl,
      this.views});

  Product.fromDocumentSnapshot({DocumentSnapshot doc}) {
    Map<String, dynamic> data = doc.data();
    productUid = doc.id;
    videoId = data['video_id'];
    userUid = data['user_uid'];
    videoUrl = data['video_url'];
    comments = data['comments'];
    category = data['category'];
    cardType = data['card_type'];
    thumbnail = data['thumbnail'];
    quantity = data['quantity'];
    price = data['price'];
    // contactNumber = data['contact_number'];
    views = data['views'];
    title = data['title'];
    likes = data['likes'];
    dislikes = data['dislikes'];
    details = data['details'];
    videoCreated = data['video_created'];
    reviews = data['reviews'];
  }

  Product.fromJson(Map<String, dynamic> json) {
    userUid = json['user_uid'];
    thumbnail = json['thumbnail'];
    videoUrl = json['video_url'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    reviews = json['reviews'];
    comments = json['comments'];
    quantity = json['quantity'];
    videoCreated = json['video_created'];
    productUid = json['product_uid'];
    // contactNumber = json['contact_number'];
    cardType = json['catd_type'];
    thumbnail = json['thumbnail'];
    details = json['details'];
    videoId = json['vieo_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_uid'] = this.userUid;
    data['thumbnail'] = this.thumbnail;
    data['video_url'] = this.videoUrl;
    data['video_created'] = this.videoCreated;
    data['video_id'] = this.videoId;
    data['uprooduct_uid'] = this.productUid;
    data['price'] = this.price;
    // data['contact_number'] = this.contactNumber;
    data['likes'] = this.likes;
    data['card_type'] = this.cardType;
    data['quantity'] = this.quantity;
    data['category'] = this.category;
    data['title'] = this.title;
    data['details'] = this.details;
    data['dislikes'] = this.dislikes;
    data['reviews'] = this.reviews;

    return data;
  }
}
