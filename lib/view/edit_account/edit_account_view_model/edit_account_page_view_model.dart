import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/provider/provider.dart';

import '../../../controller/account_controller/account_controller.dart';
import '../../../utils/log_util.dart';

part 'edit_account_page_view_model.freezed.dart';

final editAccountPageProvider =
    StateNotifierProvider<EditAccountPageProvider, EditAccountPageState>(
  (ref) => EditAccountPageProvider(
    ref.watch(accountController.notifier),
  ),
);

@freezed
class EditAccountPageState with _$EditAccountPageState {
  const factory EditAccountPageState() = _EditAccountPageState;
}

class EditAccountPageProvider extends StateNotifier<EditAccountPageState> {
  EditAccountPageProvider(
    this._accountController,
  ) : super(const EditAccountPageState());

  final AccountController _accountController;

  Future<void> onPressedUpdateAccountButton(
      {required String uid,
      File? imageFile,
      required String name,
      required String userId,
      required String selfIntroduction}) async {
    LogUtils.outputLog("  imageFile = $imageFile");
    LogUtils.outputLog("  name = $name");
    LogUtils.outputLog("  userId = $userId");
    LogUtils.outputLog("  selfIntroduction = $selfIntroduction");

    try {
      // await _accountController.uploadAccount(
      //     email: email,
      //     pass: pass,
      //     userId: userId,
      //     name: userId,
      //     imageFile: imageFile,
      //     selfIntroduction: selfIntroduction);
      if (imageFile != null) {
        await _accountController.uploadAccountImage(file: imageFile, uid: uid);
      }
      LogUtils.outputLog("アカウント編集成功");
    } on Exception catch (e) {
      LogUtils.outputLog("アカウント作成失敗");
      // TODO: エラー処理
    }
  }
}
