import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/utils/log_util.dart';

import '../model/account/account.dart';
import '../provider/provider.dart';

abstract class BaseAccountRepository {
  Future<void> createAccount({required Account account});

  Future<UserCredential> signUpAccount(
      {required String email, required String pass});

  Future<UserCredential> emailSignIn(
      {required String email, required String pass});

  Future<Account> getUser({required String uid});

  Future<List<Account>> getPostUsers({required List<String> postAccountIds});

  Future<void> uploadAccountImage({required File file, required String? uid});

  Future<String> getAccountImage({required String? uid});
}

class AccountRepository implements BaseAccountRepository {
  final Reader _read;

  const AccountRepository(this._read);

  @override
  Future<void> createAccount({
    required Account account,
  }) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('users')
          .doc(account.id)
          .set({
        "name": account.name,
        "userId": account.userId,
        "selfIntroduction": account.selfIntroduction,
        "imagePath": account.imagePath,
        "createdAt": Timestamp.now(),
        "updatedAt": Timestamp.now(),
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<UserCredential> signUpAccount({
    required String email,
    required String pass,
  }) async {
    try {
      return await _read(firebaseFirebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: pass);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<UserCredential> emailSignIn(
      {required String email, required String pass}) async {
    try {
      return await _read(firebaseFirebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: pass);
    } catch (e) {
      LogUtils.outputLog("emailSignIn失敗 -> $e ");
      throw e.toString();
    }
  }

  @override
  Future<Account> getUser({required String uid}) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();

      print("【FlutterLog】documentSnapshot =${documentSnapshot}");

      return Account.fromDocument(documentSnapshot);
    } catch (e) {
      LogUtils.outputLog("emailSignIn失敗 -> $e ");
      throw e.toString();
    }
  }

  @override
  Future<List<Account>> getPostUsers(
      {required List<String> postAccountIds}) async {
    try {
      var accounts = <Account>[];
      await Future.forEach(postAccountIds, (String postAccountId) async {
        var postAccount = await getUser(uid: postAccountId);
        accounts.add(postAccount);
      });
      LogUtils.outputLog("投稿ユーザー一覧取得成功");
      return accounts;
    } on FirebaseException catch (e) {
      LogUtils.outputLog("投稿ユーザー一覧取得失敗 -> $e");
      throw e.toString();
    }
  }

  @override
  Future<void> uploadAccountImage(
      {required File file, required String? uid}) async {
    try {
      await _read(firebaseFirebaseStorageProvider)
          .ref()
          .child("users/$uid")
          .putFile(file);
      LogUtils.outputLog("アカウント画像登録成功");
    } catch (e) {
      LogUtils.outputLog("アカウント画像登録失敗");
      throw e.toString();
    }
  }

  @override
  Future<String> getAccountImage({required String? uid}) async {
    try {
      return await _read(firebaseFirebaseStorageProvider)
          .ref("users/$uid")
          .getDownloadURL();
    } catch (e) {
      LogUtils.outputLog("アカウント画像取得失敗");
      throw e.toString();
    }
  }
}
