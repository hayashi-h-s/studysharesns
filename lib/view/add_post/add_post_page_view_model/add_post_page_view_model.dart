import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/utils/log_util.dart';

import '../../../controller/post_list_controller/post_list_controller.dart';
import '../../../model/account/account.dart';

part 'add_post_page_view_model.freezed.dart';

final addPostPageProvider =
    StateNotifierProvider<AddPostPageProvider, AddPostPageState>(
  (ref) => AddPostPageProvider(ref.watch(postListProvider.notifier)),
);

@freezed
class AddPostPageState with _$AddPostPageState {
  const factory AddPostPageState({
    @Default(false) bool isPosted,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
  }) = _AddPostPageState;
}

class AddPostPageProvider extends StateNotifier<AddPostPageState> {
  AddPostPageProvider(
    this._postController,
  ) : super(const AddPostPageState());

  final PostListController _postController;

  void onPressedPostButton({
    required String content,
    required Account account,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      await _postController.addPost(content: content, account: account);
      state = state.copyWith(isLoading: false);
      state = state.copyWith(isPosted: true);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      state = state.copyWith(isError: true);
      LogUtils.outputLog("onPressedPostButton 失敗 -> $e");
    }
  }
}
