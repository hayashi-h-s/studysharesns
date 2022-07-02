import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/repository/post_repository.dart';

import '../../model/post/post.dart';
import '../../utils/log_util.dart';

part 'post_controller.freezed.dart';

final postListProvider =
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

  PostController(this._read) : super(const AsyncValue.loading()) {
    getPosts();
  }

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
      LogUtils.outputLog("ログイン失敗");
      // TODO: エラー処理
    }
  }

  Future<void> getPosts({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      final posts = await _read(postRepositoryProvider).getPosts();
      if (mounted) {
        state = AsyncValue.data(posts);
      }
    } catch (e) {
      // 本来は例外処理をした方が良いですが、簡潔にするため省略しています
      throw e.toString();
    }
  }
}
