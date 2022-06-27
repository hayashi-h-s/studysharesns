import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/account/account.dart';
import '../../repository/account_repository.dart';

final accountProvider =
    StateNotifierProvider<AccountNotifier, AsyncValue<Account>>((ref) {
  return AccountNotifier(ref.read);
});

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
      required String imagePath,
      required String selfIntroduction}) async {
    try {
      UserCredential newAccount = await _read(accountRepositoryProvider)
          .signUpAccount(email: email, pass: pass);
      final account = Account(
        id: newAccount.user?.uid,
        userId: userId,
        name: name,
        imagePath: imagePath,
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
      if (kDebugMode) {
        print("【FlutterLog】アカウント作成成功");
      }
      return true;
    } catch (e) {
      throw e.toString();
    }
  }
}
