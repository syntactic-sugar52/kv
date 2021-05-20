import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserModel extends ChangeNotifier {
  String uid;
  String firstName;
  String lastName;
  String email;
  String userName;
  String profilePhoto;
  String country;
  String mobileNumber;
  String gender;
  String birthday;
  String bio;

  Timestamp accountCreated;

  UserModel(
      {this.uid,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.country,
      this.bio,
      this.gender,
      this.userName,
      this.birthday,
      this.email,
      this.accountCreated,
      this.profilePhoto});

  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   if (map == null) return null;
  //   Timestamp _createdAt;
  //   if (map['created_at'] is Timestamp) {
  //     _createdAt = map['created_at'];
  //   } else if (map['created_at'] is Map) {
  //     _createdAt = Timestamp(
  //         map['created_at']['_seconds'], map['created_at']['_nanoseconds']);
  //   }

  //   return UserModel(
  //     uid: map['uid'],
  //     firstName: map['first_name'],
  //     lastName: map['last_name'],
  //     userName: map['user_name'],
  //     mobileNumber: map['mobile_number'],
  //     birthday: map['birthday'],
  //     gender: map['gender'],
  //     bio: map['bio'],
  //     country: map['country'],
  //     profilePhoto: map['profile_photo'],
  //     email: map['email'],
  //     createdAt: _createdAt,
  //   );
  // }
  // factory UserModel.fromDocumentSnapshot({DocumentSnapshot doc}) {
  //   Map<String, dynamic> data = doc.data();
  //   return UserModel(
  //       uid: data['uid'] ?? '',
  //       firstName: data['first_name'] ?? '',
  //       lastName: data['last_name'] ?? '',
  //       birthday: data['birthday'] ?? '',
  //       gender: data['gender'] ?? '',
  //       country: data['country'] ?? '',
  //       bio: data['bio'] ?? '',
  //       userName: data['user_name'] ?? '',
  //       // mobileNumber: doc.data()['mobile_number'],
  //       email: data['email'] ?? '',
  //       profilePhoto: data['profile_photo'] ?? '',
  //       createdAt: data['created_at'] ?? '');
  // }

  UserModel.fromDocumentSnapshot({DocumentSnapshot doc}) {
    Map<String, dynamic> data = doc.data();
    uid = doc.id;
    email = data['email'];
    accountCreated = data['accountCreated'];
    userName = data['fullName'];
    profilePhoto = data['profile_photo'];
  }

  // Map<String, dynamic> toJson(){
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   return data;
  // }
}
