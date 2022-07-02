import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/repository/post_repository.dart';

import '../../model/post/post.dart';

part 'post_controller.freezed.dart';

final postController =
    StateNotifierProvider<PostController, AsyncValue<List<Post>>>((ref) {
  return PostController(ref.read);
});

@freezed
class PostState with _$PostState {
  const factory PostState({
    Post? post,
  }) = _PostState;
}

class PostController extends StateNotifier<AsyncValue<List<Post>>> {
  final Reader _read;

  PostController(this._read) : super(const AsyncValue.loading());

  Future<void> addPost({
    required String content,
    required String postUserId,
  }) async {
    try {
      final post = Post(
        content: content,
        postAccountId: postUserId,
        createdAt: DateTime.now(),
      );
      final postId = await _read(postRepositoryProvider).createPost(post: post);
      state.whenData(
        (posts) => state = AsyncValue.data(
          posts..add(post.copyWith(id: postId)),
        ),
      );
    } on Exception catch (e) {
      // LogUtils.outputLog("ログイン失敗");
      // // TODO: エラー処理
    }
  }
}
