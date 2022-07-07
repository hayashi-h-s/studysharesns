import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/controller/account_list_controller/account_list_controller.dart';
import 'package:studysharesns/repository/post_repository.dart';

import '../../materials/item_repository.dart';
import '../../model/account/account.dart';
import '../../model/post/post.dart';
import '../../utils/log_util.dart';

part 'post_list_controller.freezed.dart';

final postListProvider =
    StateNotifierProvider<PostListController, AsyncValue<List<Post>>>((ref) {
  return PostListController(ref.read);
});

@freezed
class PostListState with _$PostListState {
  const factory PostListState({
    Post? post,
  }) = _PostListState;
}

class PostListController extends StateNotifier<AsyncValue<List<Post>>> {
  final Reader _read;

  PostListController(this._read) : super(const AsyncValue.loading()) {
    getPosts();
  }

  Future<void> getPosts({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      final snapshots = _read(firebaseFirestoreProvider)
          .collection('posts')
          .orderBy("createdAt", descending: true)
          .snapshots();
      List<String> postAccountIds = [];
      snapshots.listen((snapshot) async {
        final posts =
            snapshot.docs.map((doc) => Post.fromDocument(doc)).toList();
        posts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        for (var post in posts) {
          if (!postAccountIds.contains(post.postAccountId)) {
            postAccountIds.add(post.postAccountId);
          }
        }
        await _read(accountListProvider.notifier).getPostUsers(postAccountIds);
        if (mounted) {
          state = AsyncValue.data(posts);
        }
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> addPost({
    required String content,
    required Account account,
  }) async {
    try {
      final post = Post(
        content: content,
        postAccountId: account.id as String,
        createdAt: DateTime.now(),
      );
      await _read(postRepositoryProvider).createPost(post: post);
      await _read(postRepositoryProvider).createMyPost(post: post);
    } on Exception catch (e) {
      LogUtils.outputLog("ログイン失敗");
      // TODO: エラー処理
    }
  }
}
