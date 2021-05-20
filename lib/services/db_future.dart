import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kv/models/product.dart';
import 'package:kv/models/user.dart';

class DBFuture extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> createUser(UserModel user) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").doc(user.uid).set({
        'userName': user.userName.trim(),
        'email': user.email.trim(),
        'accountCreated': Timestamp.now(),
        'profile_photo': user.profilePhoto,
        // 'notifToken': user.notifToken,
      });
      retVal = "success";
    } catch (e) {
      retVal = e.toString();
      print(e);
    }
    notifyListeners();
    return retVal;
  }

  Future<UserModel> getUser(String uid) async {
    UserModel retVal;

    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("users").doc(uid).get();
      retVal = UserModel.fromDocumentSnapshot(doc: _docSnapshot);
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return retVal;
  }

  // Future<String> createProduct(
  //     Product product, String videoId, String userUid) async {
  //   String retVal = "error";

  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("Post")
  //         .doc(userUid)
  //         .collection("Product")
  //         .doc(videoId)
  //         .set({
  //       "video_id": videoId,
  //       "uid": product.uid,
  //       'created_at': product.createdAt,
  //       "details": product.details,
  //       "video_url": product.videoUrl,
  //       "reviews": product.reviews,
  //       "upvote": product.upvote,
  //       "downvote": product.downvote,
  //       "title": product.title,
  //       "price": product.price,
  //       "user_uid": userUid,
  //       "category": product.category,
  //       "comments": product.comments
  //     });
  //     retVal = "success";
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }

  //   Future<UserModel> getUserProfilePhoto(String uid) async {
  //   UserModel retVal;

  //   try {
  //     DocumentSnapshot _docSnapshot =
  //         await _firestore.collection("users").doc(uid);
  //     retVal = UserModel.fromDocumentSnapshot(doc: _docSnapshot);
  //   } catch (e) {
  //     print(e);
  //   }
  //   notifyListeners();
  //   return retVal;
  // }

  // Future<String> createNotifications(
  //     List<String> tokens, String bookName, String author) async {
  //   String retVal = "error";

  //   try {
  //     await _firestore.collection("notifications").add({
  //       'bookName': bookName.trim(),
  //       'author': author.trim(),
  //       'tokens': tokens,
  //     });
  //     retVal = "success";
  //   } catch (e) {
  //     print(e);
  //   }

  //   return retVal;
  // }
}
