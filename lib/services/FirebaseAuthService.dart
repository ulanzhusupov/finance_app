import "dart:async";

import 'package:finance_manager/model/User.dart';
import 'package:finance_manager/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService implements AuthService {
  final auth.FirebaseAuth _fireAuth = auth.FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  User _userFromFirebase(auth.User user) {
    if (user == null) {
      return null;
    }

    bool isInfoAdded = user.displayName == "added" ? true : false;

    return User(uid: user.uid, email: user.email, isAddedInfo: isInfoAdded);
  }

  Future<User> updateUserInfo() async {
    auth.User user = await _fireAuth.currentUser;
    user.updateProfile(displayName: "added");

    return _userFromFirebase(user);
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    auth.UserCredential credential = await _fireAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  @override
  Future<User> currentUser() {
    dynamic user = _fireAuth.currentUser;
    return user;
  }

  @override
  void dispose() {}

  @override
  Stream<User> get onAuthStateChanged {
    return _fireAuth.authStateChanges().map(_userFromFirebase);
  }

  @override
  Future<void> sendPasswordRestEmail(String email) async {
    await _fireAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    auth.UserCredential credential = await _fireAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  @override
  Future<User> signInWithFacebook() {}

  @override
  Future<User> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    GoogleSignInAccount gAccount = await _googleSignIn.signIn();
    if (gAccount != null) {
      final GoogleSignInAuthentication googleAuth =
          await gAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        dynamic userCredential = await _fireAuth.signInWithCredential(
            auth.GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));
        return _userFromFirebase(userCredential.user);
      } else {
        throw PlatformException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: 'Missing Google Auth Token');
      }
    } else {
      throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
    }
  }

  @override
  Future<void> signOut() async {
    return _fireAuth.signOut();
  }
}
