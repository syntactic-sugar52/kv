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

  Future<String> createProduct(Product product, String productId) async {
    String retVal = "error";

    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection("Product").doc();
      docRef.set({
        "video_id": product.videoId,
        "product_uid": docRef.id,
        'video_created': product.videoCreated,
        "details": product.details,
        "video_url": product.videoUrl,
        "reviews": product.reviews,
        "likes": product.likes,
        "dislikes": product.dislikes,
        "views": product.views,
        "title": product.title,
        "price": product.price,
        "user_uid": product.userUid,
        "category": product.category,
        "quantity": product.quantity,
        "comments": product.comments,
        "thumbnail": product.thumbnail,
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<Product> getProduct(String productId) async {
    Product retVal;

    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("Product").doc(productId).get();
      retVal = Product.fromDocumentSnapshot(doc: _docSnapshot);
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return retVal;
  }

// Future getVideoId()async{
//   var document = await _firestore.collection("Product").doc('');
// document.get() => then(function(document) {
//     print(document("name"));
// });
// }
  // Future getProduct(){
  //    UserModel retVal;

  //   try {
  //     DocumentSnapshot _docSnapshot =
  //         await _firestore.collection("Product").doc(uid).get();
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
