import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/provider/provider.dart';

import '../../controller/account_controller/account_controller.dart';
import '../../utils/log_util.dart';

part 'login_page_view_model.freezed.dart';

final loginPageProvider =
    StateNotifierProvider<LoginPageProvider, LoginPageState>(
  (ref) => LoginPageProvider(ref.watch(accountController.notifier)),
);

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState() = _LoginPageState;
}

class LoginPageProvider extends StateNotifier<LoginPageState> {
  LoginPageProvider(
    this._accountController,
  ) : super(const LoginPageState());

  final AccountController _accountController;

  Future<void> onPressedLoginButton({
    required String email,
    required String pass,
  }) async {
    try {
      await _accountController.emailSignIn(email: email, pass: pass);
      LogUtils.outputLog("ログイン成功");
    } on Exception catch (e) {
      LogUtils.outputLog("ログイン失敗");
      // TODO: エラー処理
    }
  }
}
