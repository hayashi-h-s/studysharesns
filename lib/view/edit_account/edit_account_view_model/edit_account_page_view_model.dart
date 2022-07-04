import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/provider/provider.dart';

import '../../../controller/account_controller/account_controller.dart';
import '../../../model/account/account.dart';
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
      {required Account account, File? imageFile}) async {
    try {
      if (imageFile != null) {
        await _accountController.uploadAccountImage(
            file: imageFile, uid: account.id as String);
        final imagePath = await _accountController.getAccountImagePath(
            uid: account.id as String);
        account = account.copyWith(imagePath: imagePath!);
      }
      await _accountController.updateAccount(account: account);
      LogUtils.outputLog("アカウント編集成功");
    } on Exception catch (e) {
      LogUtils.outputLog("アカウント作成失敗");
      // TODO: エラー処理
    }
  }
}
