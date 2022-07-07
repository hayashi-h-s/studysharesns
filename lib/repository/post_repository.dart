import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/utils/log_util.dart';

import '../materials/item_repository.dart';
import '../model/account/account.dart';
import '../model/post/post.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => PostRepository(ref.read));

abstract class BasePostRepository {
  Future<String> createPost({required Post post});

  Future<void> createMyPost({required Post post});

  Future<List<Post>> getPosts();

  Future<List<Post>> getMyPosts({required Account account});

  Future<List<Post>> getPostsFromIds(List<String> ids);
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
  Future<void> createMyPost({required Post post}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('users')
          .doc(post.postAccountId)
          .collection('my_posts')
          .add(post.toDocument());
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

  @override
  Future<List<Post>> getMyPosts({required Account account}) async {
    try {
      final snapShot = await _read(firebaseFirestoreProvider)
          .collection('users')
          .doc(account.id)
          .collection("my_posts")
          .orderBy("createdAt", descending: true)
          .get();
      List<String> myPostIds = List.generate(snapShot.docs.length, (index) {
        return snapShot.docs[index].id;
      });
      return await getPostsFromIds(myPostIds);
    } catch (e) {
      LogUtils.outputLog("getMyPosts失敗 -> $e");
      throw e.toString();
    }
  }

  @override
  Future<List<Post>> getPostsFromIds(List<String> ids) async {
    try {
      var posts = <Post>[];
      await Future.forEach(ids, (String id) async {
        var doc = await _read(firebaseFirestoreProvider)
            .collection("posts")
            .doc(id)
            .get();
        posts.add(Post.fromDocument(doc));
      });
      return posts;
    } catch (e) {
      LogUtils.outputLog("getPostsFromIds失敗 $e");
      throw e.toString();
    }
  }
}
