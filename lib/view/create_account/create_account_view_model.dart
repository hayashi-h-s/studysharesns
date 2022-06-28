import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/utils/log_util.dart';

import '../../model/account/account.dart';
import '../../provider/provider.dart';

class AccountNotifier extends StateNotifier<AsyncValue<Account>> {
  final Reader _read;

  AccountNotifier(this._read) : super(const AsyncValue.loading()) {
    // TODO: データ取得処理実装時に修正
  }

  Future<bool> createAccount(
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
      final accountId = await _read(accountRepositoryProvider)
          .createAccount(account: account);
      state.whenData(
        (account) => state = AsyncValue.data(
          account.copyWith(id: accountId),
        ),
      );
      LogUtils.outputLog("アカウント作成成功");
      return true;
    } catch (e) {
      LogUtils.outputLog("アカウント作成失敗");
      state = AsyncValue.error(e);
      return false;
    }
  }
}
