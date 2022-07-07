import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/account/account.dart';
import '../../provider/provider.dart';
import '../../utils/log_util.dart';

part 'account_controller.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    Account? account,
  }) = _AccountState;
}

class AccountController extends StateNotifier<Account?> {
  final Reader _read;

  AccountController(this._read) : super(null);

  Future<void> createAccount(
      {required String email,
      required String pass,
      required String userId,
      required String name,
      required File imageFile,
      required String selfIntroduction}) async {
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
      updatedAt: DateTime.now(),
    );
    await _read(accountRepositoryProvider).createAccount(account: account);
    state = account;
  }

  Future<void> emailSignIn({
    required String email,
    required String pass,
  }) async {
    UserCredential signInAccount = await _read(accountRepositoryProvider)
        .emailSignIn(email: email, pass: pass);
    final myAccount = await _read(accountRepositoryProvider)
        .getUser(uid: signInAccount.user!.uid); // TODO: !で問題ないか？エラー処理すればいいのか？
    state = myAccount;
  }

  Future<void> uploadAccountImage({
    required File file,
    required String uid,
  }) async {
    _read(accountRepositoryProvider).uploadAccountImage(file: file, uid: uid);
  }

  Future<void> updateAccount({required Account account}) async {
    await _read(accountRepositoryProvider).updateAccount(account: account);
    state = account;
    LogUtils.outputLog("updateAccount成功");
  }

  Future<String?> getAccountImagePath({required String uid}) async {
    return await _read(accountRepositoryProvider).getAccountImage(uid: uid);
  }

  Future<void> signOut() async {
    try {
      await _read(accountRepositoryProvider).signOut();
      state = null;
      LogUtils.outputLog("サインアウト成功");
    } on Exception catch (e) {
      LogUtils.outputLog("サインアウト失敗 $e");
    }
  }
}
