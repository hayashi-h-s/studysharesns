import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/repository/post_repository.dart';

import '../../model/post/post.dart';

part 'post_controller.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    Post? post,
  }) = _PostState;
}

class PostController extends StateNotifier<Post?> {
  final Reader _read;

  PostController(this._read) : super(null);

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
      await _read(postRepositoryProvider).addPost(post: post);
    } on Exception catch (e) {
      // LogUtils.outputLog("ログイン失敗");
      // // TODO: エラー処理
    }
  }
}
