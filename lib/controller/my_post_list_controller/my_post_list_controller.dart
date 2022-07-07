import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/account/account.dart';
import '../../model/post/post.dart';
import '../../provider/provider.dart';
import '../../repository/post_repository.dart';
import '../../utils/log_util.dart';

part 'my_post_list_controller.freezed.dart';

final myPostListProvider =
    StateNotifierProvider<MyPostListController, AsyncValue<List<Post>>>((ref) {
  return MyPostListController(ref.read);
});

@freezed
class MyPostListState with _$MyPostListState {
  const factory MyPostListState({
    Post? post,
  }) = _MyPostListState;
}

class MyPostListController extends StateNotifier<AsyncValue<List<Post>>> {
  final Reader _read;
  Account? account;

  MyPostListController(this._read) : super(const AsyncValue.loading()) {
    account = _read(accountController);
    getMyPosts();
  }

  Future<void> getMyPosts({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      final posts =
          await _read(postRepositoryProvider).getMyPosts(account: account!);
      if (mounted) {
        state = AsyncValue.data(posts);
      }
    } catch (e) {
      LogUtils.outputLog("getMyPosts失敗  $e");
      throw e.toString();
    }
  }
}
