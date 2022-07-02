import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/provider/provider.dart';

import '../../controller/account_controller/account_controller.dart';
import '../../utils/log_util.dart';

part 'create_account_view_model.freezed.dart';

final createAccountPageProvider =
    StateNotifierProvider<CreateAccountPageProvider, CreateAccountPageState>(
  (ref) => CreateAccountPageProvider(ref.watch(accountController.notifier)),
);

@freezed
class CreateAccountPageState with _$CreateAccountPageState {
  const factory CreateAccountPageState() = _CreateAccountPageState;
}

class CreateAccountPageProvider extends StateNotifier<CreateAccountPageState> {
  CreateAccountPageProvider(
    this._accountController,
  ) : super(const CreateAccountPageState());

  final AccountController _accountController;

  Future<void> onPressedCreateAccountButton(
      {required String email,
      required String pass,
      required String userId,
      required String name,
      required File imageFile,
      required String selfIntroduction}) async {
    try {
      await _accountController.createAccount(
          email: email,
          pass: pass,
          userId: userId,
          name: userId,
          imageFile: imageFile,
          selfIntroduction: selfIntroduction);
      LogUtils.outputLog("アカウント作成成功");
    } on Exception catch (e) {
      LogUtils.outputLog("アカウント作成失敗");
      // TODO: エラー処理
    }
  }
}
