import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/utils/log_util.dart';

import '../materials/item_repository.dart';
import '../model/post/post.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => PostRepository(ref.read));

abstract class BasePostRepository {
  Future<String> createPost({required Post post});

  Future<void> createMyPost({required Post post, required String postId});

  Future<List<Post>> getPosts();
}

class PostRepository implements BasePostRepository {
  final Reader _read;

  const PostRepository(this._read);

  @override
  Future<String> createPost({
    required Post post,
  }) async {
    try {
      final docRef = await _read(firebaseFirestoreProvider)
          .collection('posts')
          .add(post.toDocument());
      return docRef.id;
    } catch (e) {
      LogUtils.outputLog("createPost -> 失敗 $e");
      throw e.toString();
    }
  }

  @override
  Future<void> createMyPost({
    required Post post,
    required String postId,
  }) async {
    try {
      _read(firebaseFirestoreProvider)
          .collection("users")
          .doc(post.postAccountId)
          .collection("my_posts")
          .doc(postId)
          .set({"post_id": postId, "createdAt": Timestamp.now()});
    } catch (e) {
      LogUtils.outputLog("createPost -> 失敗 $e");
      throw e.toString();
    }
  }

  @override
  Future<List<Post>> getPosts() async {
    try {
      final snap = await _read(firebaseFirestoreProvider)
          .collection('posts')
          .orderBy("createdAt", descending: true)
          .get();
      return snap.docs.map((doc) => Post.fromDocument(doc)).toList();
    } catch (e) {
      // 本来は例外処理をした方が良いですが、簡潔にするため省略しています
      throw e.toString();
    }
  }
}
