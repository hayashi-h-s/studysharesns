import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/account/account.dart';
import '../provider/provider.dart';

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
    );
    await _read(accountRepositoryProvider).createAccount(account: account);
    state = account;
  }
}
