import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kv/models/auth_model.dart';

import 'package:kv/models/user.dart';
import 'package:kv/services/database.dart';
import 'package:uuid/uuid.dart';
// import 'package:provider/provider.dart';

class CurrentUser extends ChangeNotifier {
  UserModel _currentUser = UserModel();

  UserModel get currentUser => _currentUser;
  String _uid;
  String _email;

  String get uid => _currentUser.uid;
  String get email => _currentUser.email;

  String get getUserName => _currentUser.userName;
  String get getProfilePhoto => _currentUser.profilePhoto;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<AuthModel> get user {
    return _auth.authStateChanges().map(
          (User firebaseUser) => (firebaseUser != null)
              ? AuthModel.fromFirebaseUser(user: firebaseUser)
              : null,
        );
  }
}
