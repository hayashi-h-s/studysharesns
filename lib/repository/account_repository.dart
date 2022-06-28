import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/utils/log_util.dart';

import '../model/account/account.dart';
import '../provider/provider.dart';

abstract class BaseAccountRepository {
  Future<String> createAccount({required Account account});

  Future<UserCredential> signUpAccount(
      {required String email, required String pass});

  Future<void> uploadAccountImage({required File file, required String? uid});
  Future<String> getAccountImage({required String? uid});
}

class AccountRepository implements BaseAccountRepository {
  final Reader _read;

  const AccountRepository(this._read);

  @override
  Future<String> createAccount({
    required Account account,
  }) async {
    try {
      final docRef =
          await _read(firebaseFirestoreProvider).collection('user').add(
                account.toDocument(),
              );
      return docRef.id;
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

// @override
// Future<void> getAccountImage({required File file}) async {
//   try {
//     await _read(firebaseFirebaseStorageProvider).ref().putFile(file);
//   } catch (e) {
//     throw e.toString();
//   }
// }
//
// final FirebaseStorage storageInstance = FirebaseStorage.instance;
// final Reference ref = storageInstance.ref();
// try {
// await ref.child(uid).putFile(image);
// String downloadUrl = await storageInstance.ref(uid).getDownloadURL();
// if (kDebugMode) {
// print("画像登録成功 = $downloadUrl");
// }
// return downloadUrl;
// } on FirebaseException catch (e) {
// if (kDebugMode) {
// print("画像登録失敗 =  ${e}");
// }
// return false;
// }

}
