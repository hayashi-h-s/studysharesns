import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/account.dart';

class UsersFireStore {
  static final _firesStoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users =
      _firesStoreInstance.collection("users");

  static Future<bool> setUser(Account newAccount) async {
    try {
      await users.doc(newAccount.id).set({
        "name": newAccount.name,
        "user_id": newAccount.id,
        "self_introduction": newAccount.selfIntroduction,
        "image_path": newAccount.imagePath,
        "created_time": Timestamp.now(),
        "updated_time": Timestamp.now(),
      });
      print("【FlutterLog】新規ユーザー作成完了");
      return true;
    } on FirebaseException catch (e) {
      print("【FlutterLog】新規ユーザー作成エラー：$e");
      return false;
    }
  }
}
