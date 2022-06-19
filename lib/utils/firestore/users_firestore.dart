import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:studysharesns/utils/Authentication.dart';

import '../../model/account.dart';

class UsersFireStore {
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
      DocumentSnapshot documentSnapshot =  await users.doc(uid).get();
      Map<String, dynamic> data = documentSnapshot.data() as Map<String,dynamic>;
      Account myAccount = Account(
        id:uid,
        userId: data["user_id"],
        name: data["name"],
        imagePath:data["image_path"],
        selfIntroduction: data["self_introduction"],
        createdTime: data["created_time"],
        updatedTime: data["updated_time"],
      );
      Authentication.myAccount =  myAccount;
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
}
