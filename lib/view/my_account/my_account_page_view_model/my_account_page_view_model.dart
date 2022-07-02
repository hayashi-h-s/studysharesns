import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/provider/provider.dart';

import '../../../controller/account_controller/account_controller.dart';

part 'my_account_page_view_model.freezed.dart';

final myAccountPageProvider =
    StateNotifierProvider<MyAccountPageProvider, MyAccountPageState>(
  (ref) => MyAccountPageProvider(ref.watch(accountController.notifier)),
);

@freezed
class MyAccountPageState with _$MyAccountPageState {
  const factory MyAccountPageState() = _MyAccountPageState;
}

class MyAccountPageProvider extends StateNotifier<MyAccountPageState> {
  MyAccountPageProvider(
    this._accountController,
  ) : super(const MyAccountPageState());

  final AccountController _accountController;
}
