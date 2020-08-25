import "dart:async";

import 'package:finance_manager/model/User.dart';
import 'package:finance_manager/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FirebaseAuthService implements AuthService {
  final auth.FirebaseAuth _fireAuth = auth.FirebaseAuth.instance;

  User _userFromFirebase(auth.User user) {
    if(user == null) {
      return null;
    }

    return User(uid: user.uid, email: user.email);
  }

  @override
  Future<User> createUserWithEmailAndPassword(String email, String password) async {
    auth.UserCredential credential = await _fireAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  @override
  Future<User> currentUser() {
    dynamic user = _fireAuth.currentUser;
    return user;
  }

  @override
  void dispose() {
    
  }

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
    auth.UserCredential credential = await _fireAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  @override
  Future<User> signInWithFacebook() {
    
  }

  @override
  Future<User> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    return _fireAuth.signOut();
  }

}