import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/utils/log_util.dart';

import '../materials/item_repository.dart';
import '../model/post/post.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => PostRepository(ref.read));

abstract class BasePostRepository {
  Future<String> createPost({required Post post});
}

class PostRepository implements BasePostRepository {
  final Reader _read;

  const PostRepository(this._read);

  @override
  Future<String> createPost({
    required Post post,
  }) async {
    try {
      try {
        final docRef = await _read(firebaseFirestoreProvider)
            .collection('posts')
            .add(post.toDocument());
        return docRef.id;
      } catch (e) {
        LogUtils.outputLog("createPost -> 失敗 $e");
        throw e.toString();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
