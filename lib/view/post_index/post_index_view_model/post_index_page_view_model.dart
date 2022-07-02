import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controller/post_list_controller/post_list_controller.dart';

part 'post_index_page_view_model.freezed.dart';

final postIndexPageProvider =
    StateNotifierProvider<PostIndexPageProvider, PostIndexPageState>(
  (ref) => PostIndexPageProvider(ref.watch(postListProvider.notifier)),
);

@freezed
class PostIndexPageState with _$PostIndexPageState {
  const factory PostIndexPageState({
    @Default(false) bool isPosted,
  }) = _PostIndexPageState;
}

class PostIndexPageProvider extends StateNotifier<PostIndexPageState> {
  PostIndexPageProvider(
    this._postController,
  ) : super(const PostIndexPageState());

  final PostListController _postController;
}
