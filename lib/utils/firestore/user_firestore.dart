import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:studysharesns/utils/Authentication.dart';

import '../../model/account/account.dart';

class UserFireStore {
  static final _firesStoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users =
      _firesStoreInstance.collection("users");

  static Future<bool> setUser(Account newAccount) async {
    try {
      await users.doc(newAccount.id).set({
        "name": newAccount.name,
        "user_id": newAccount.userId,
        "self_introduction": newAccount.selfIntroduction,
        "image_path": newAccount.imagePath,
        "created_time": Timestamp.now(),
        "updated_time": Timestamp.now(),
      });
      if (kDebugMode) {
        print("【FlutterLog】新規ユーザー作成完了");
      }
      return true;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("【FlutterLog】新規ユーザー作成エラー：$e");
      }
      return false;
    }
  }

  static Future<bool> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await users.doc(uid).get();
      Authentication.myAccount = Account.fromDocument(doc);
      if (kDebugMode) {
        print("【FlutterLog】新規ユーザー取得完了");
      }
      return true;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("【FlutterLog】新規ユーザー取得エラー：$e");
      }
      return false;
    }
  }

  static Future<bool> updateUser(Account updateAccount) async {
    try {
      await users.doc(updateAccount.id).update({
        "name": updateAccount.name,
        "user_id": updateAccount.userId,
        "self_introduction": updateAccount.selfIntroduction,
        "image_path": updateAccount.imagePath,
        "updated_time": Timestamp.now(),
      });
      if (kDebugMode) {
        print("【FlutterLog】ユーザー情報更新完了");
      }
      return true;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("【FlutterLog】新規ユーザー情報更新エラー：$e");
      }
      return false;
    }
  }

  static Future<Map<String, Account>?> getPostUserMap(
      List<String> accountIds) async {
    Map<String, Account> map = {};
    try {
      await Future.forEach(accountIds, (String accountId) async {
        var doc = await users.doc(accountId).get();
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Account postAccount = Account(
          id: accountId,
          userId: data["user_id"],
          name: data["name"],
          imagePath: data["image_path"],
          selfIntroduction: data["self_introduction"],
          createdTime: data["created_time"],
          updatedTime: data["updated_time"],
        );
        map[accountId] = postAccount;
      });

      if (kDebugMode) {
        print("【FlutterLog】投稿ユーザー情報取得完了");
      }
      return map;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("【FlutterLog】投稿ユーザー情報取得エラー：$e");
      }
      return null;
    }
  }
}
