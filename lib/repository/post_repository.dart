import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../materials/item_repository.dart';
import '../model/post/post.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => PostRepository(ref.read));

abstract class BasePostRepository {
  Future<void> addPost({required Post post});
}

class PostRepository implements BasePostRepository {
  final Reader _read;

  const PostRepository(this._read);

  @override
  Future<void> addPost({
    required Post post,
  }) async {
    try {
      try {
        await _read(firebaseFirestoreProvider)
            .collection('posts')
            .add(post.toDocument());
      } catch (e) {
        throw e.toString();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
