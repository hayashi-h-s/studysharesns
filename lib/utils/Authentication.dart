import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../model/account/account.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentFirebaseUser;
  static Account? myAccount;

  static Future<dynamic> signUp(
      {required String email, required String pass}) async {
    try {
      UserCredential uewAccount = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass);
      if (kDebugMode) {
        print("Auth登録完了");
      }
      return uewAccount;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("Auth登録エラー -> $e");
      }
      return false;
    }
  }

  static Future<dynamic> emailSignIn(
      {required String email, required String pass}) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      currentFirebaseUser = result.user;
      if (kDebugMode) {
        print("Authログイン完了");
      }
      return result;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("Authログインエラー -> $e");
      }
      return false;
    }
  }

  static Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}
