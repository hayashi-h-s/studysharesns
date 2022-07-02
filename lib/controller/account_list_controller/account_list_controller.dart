import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/account/account.dart';
import '../../provider/provider.dart';

part 'account_list_controller.freezed.dart';

final accountListProvider =
    StateNotifierProvider<AccountListController, AsyncValue<List<Account>>>(
        (ref) {
  return AccountListController(ref.read);
});

@freezed
class AccountListState with _$AccountListState {
  const factory AccountListState({
    Account? account,
  }) = _AccountListState;
}

class AccountListController extends StateNotifier<AsyncValue<List<Account>>> {
  final Reader _read;

  AccountListController(this._read) : super(const AsyncValue.loading());

  Future<void> getPostUsers(List<String> postAccountIds) async {
    // TODO: postAccountIdsからUsersを取得
    final postAccounts = await _read(accountRepositoryProvider)
        .getPostUsers(postAccountIds: postAccountIds);
    if (mounted) {
      state = AsyncValue.data(postAccounts);
    }
  }
}
