import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static User? currentFirebaseUser;

  static Future<bool> signUp(
      {required String email, required String pass}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      if (kDebugMode) {
        print("Auth登録完了");
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print("Auth登録エラー -> $e");
      }
      return false;
    }
  }
}
