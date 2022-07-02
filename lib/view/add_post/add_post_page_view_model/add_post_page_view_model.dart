import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/provider/provider.dart';

import '../../../controller/post_controller/post_controller.dart';

part 'add_post_page_view_model.freezed.dart';

final addPostPageProvider =
    StateNotifierProvider<AddPostPageProvider, AddPostPageState>(
  (ref) => AddPostPageProvider(ref.watch(postController.notifier)),
);

@freezed
class AddPostPageState with _$AddPostPageState {
  const factory AddPostPageState() = _PostPageState;
}

class AddPostPageProvider extends StateNotifier<AddPostPageState> {
  AddPostPageProvider(
    this._postController,
  ) : super(const AddPostPageState());

  final PostController _postController;

  Future<void> onPressedPostButton({
    required String content,
    required String postUserId,
  }) async {
    _postController.addPost(content: content, postUserId: postUserId);
  }
}
