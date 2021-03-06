import "dart:async";

import 'package:finance_manager/model/User.dart';

// class User {
//   const User({@required this.uid, this.email});

//   final String uid;
//   final String email;
// }

abstract class AuthService  {
  Future<User> updateUserInfo();
  Future<User> currentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<void> sendPasswordRestEmail(String email);
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<void> signOut();
  Stream<User> get onAuthStateChanged;
  void dispose();
  
}