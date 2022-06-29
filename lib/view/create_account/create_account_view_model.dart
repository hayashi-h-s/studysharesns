import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/utils/log_util.dart';

import '../../model/account/account.dart';
import '../../provider/provider.dart';

class AccountNotifier extends StateNotifier<Account?> {
  final Reader _read;

  AccountNotifier(this._read) : super(null);

  Future<void> createAccount(
      {required String email,
      required String pass,
      required String userId,
      required String name,
      required File imageFile,
      required String selfIntroduction}) async {
    try {
      UserCredential newAccount = await _read(accountRepositoryProvider)
          .signUpAccount(email: email, pass: pass);
      await _read(accountRepositoryProvider)
          .uploadAccountImage(file: imageFile, uid: newAccount.user?.uid);
      String accountImagePath = await _read(accountRepositoryProvider)
          .getAccountImage(uid: newAccount.user?.uid);
      final account = Account(
        id: newAccount.user?.uid,
        userId: userId,
        name: name,
        imagePath: accountImagePath,
        selfIntroduction: selfIntroduction,
        createdAt: DateTime.now(),
      );
      state = account;
      LogUtils.outputLog("アカウント作成成功");
    } catch (e) {
      LogUtils.outputLog("アカウント作成失敗");
      // TODO:エラー処理
    }
  }
}
