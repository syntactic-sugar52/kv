import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

// import 'package:flutter/material.dart';
import 'package:kv/models/user.dart';
import 'package:provider/provider.dart';
import 'package:video_compress/video_compress.dart';

final usersRef = FirebaseFirestore.instance.collection("users");
final Reference storageRef = FirebaseStorage.instance.ref();

final Reference videosStorage = FirebaseStorage.instance.ref();
final Reference imageRef = FirebaseStorage.instance.ref();

final uploadRef = FirebaseFirestore.instance.collection("Upload");
final videoRef = FirebaseFirestore.instance.collection("videos");

class Database {
  static Database _database;
  static Database get instance {
    if (_database == null) {
      _database = Database();
    }
    return _database;
  }

  Future<String> uploadImageToFirebase(File _imageFile) async {
    String fileName = _imageFile.path;
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('upload_profile_pic/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    print('downloadUrl => $downloadUrl');
    return downloadUrl;
  }

  // Future uploadVideo(File videoFile, String fileName, String stringFile) async {
  //   try {
  //     final DateTime now = DateTime.now();
  //     final int millSeconds = now.millisecondsSinceEpoch;
  //     final String month = now.month.toString();
  //     final String date = now.day.toString();
  //     final String storageId = (millSeconds.toString() + " " + fileName);
  //     final String today = ('$month-$date');

  //     Reference ref = FirebaseStorage.instance
  //         .ref()
  //         .child("video")
  //         .child(today)
  //         .child(storageId);
  //     var compressFile = await compressVideo(stringFile);
  //     UploadTask uploadTask = ref.putFile(compressFile);

  //     UploadTask downloadUrl = uploadTask;
  //     final String url = downloadUrl.toString();

  //     print(url);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

//search
  static Future<QuerySnapshot> searchUsers(String name) {
    Future<QuerySnapshot> users =
        usersRef.where('first_name', isGreaterThanOrEqualTo: name).get();
    return users;
  }

  // //Users

  Future<String> updateNewUser(UserModel user, uid) async {
    String retVal = 'error';
    try {
      await usersRef.doc(uid).update({
        "first_name": user.firstName,
        "last_name": user.lastName,
        "country": user.country,
        "gender": user.gender,
        "birthday": user.birthday,
        "bio": user.bio,
        "profile_photo": user.profilePhoto,
        "mobile_number": user.mobileNumber,
        "email": user.email,
      });
      return 'success';
    } catch (e) {
      retVal = e.toString();
    }
    return retVal;
  }

  Future<String> updateUserProfilePic(UserModel user, uid) async {
    String retVal = 'error';
    try {
      await usersRef.doc(uid).update({
        "profile_photo": user.profilePhoto,
      });
      return 'success';
    } catch (e) {
      retVal = e.toString();
    }
    return retVal;
  }

  static Future<UserModel> getUserWithId(String userId) async {
    DocumentSnapshot userDocSnapshot = await usersRef.doc(userId).get();
    if (userDocSnapshot.exists) {
      return UserModel.fromDocumentSnapshot(doc: userDocSnapshot);
    }
    return UserModel();
  }

  static void updateUser(UserModel user) {
    usersRef.doc(user.uid).update({
      'first_name': user.firstName,
      'last_name': user.lastName,
      'profile_photo': user.profilePhoto,
      'mobile_number': user.mobileNumber,
      'birthday': user.birthday,
      'email': user.email,
      'gender': user.gender,
      'bio': user.bio,
    });
  }

  Stream<QuerySnapshot> get user {
    return usersRef.snapshots();
  }

  //  Future<UserModel> getUserInfo(String uid) async {
  //   UserModel retVal = UserModel();
  //   try {
  //     DocumentSnapshot _docSnapshot = await usersRef.doc(uid).get();
  //     retVal.uid = uid;
  //     retVal.email = _docSnapshot.data()["email"];
  //     retVal.userName = _docSnapshot.data()["userName"];
  //   } catch (e) {
  //     print(e);
  //   }
  //   return retVal;
  // }

  Future<UserModel> getUserInfo(String uid) async {
    UserModel retVal = UserModel();
    try {
      DocumentSnapshot _doc = await usersRef.doc(uid).get();
      Map<String, dynamic> data = _doc.data();
      retVal.uid = uid;

      retVal.userName = data["user_name"];

      retVal.email = data["email"];
      retVal.profilePhoto = data["profile_photo"];
      retVal.accountCreated = data["account_created"];
      retVal.accountCreated = data["accountCreated"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
