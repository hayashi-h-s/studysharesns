import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../model/post/post.dart';

class PostFireStore {
  static final _firesStoreInstance = FirebaseFirestore.instance;
  static final CollectionReference posts =
      _firesStoreInstance.collection("posts");

  static Future<bool> addPost(Post newPost) async {
    try {
      final CollectionReference userPosts = _firesStoreInstance
          .collection("users")
          .doc(newPost.postAccountId)
          .collection("my_posts");

      var result = await posts.add({
        "content": newPost.content,
        "post_account_id": newPost.postAccountId,
        "created_time": Timestamp.now()
      });
      userPosts
          .doc(result.id)
          .set({"post_id": result.id, "created_time": Timestamp.now()});

      if (kDebugMode) {
        print("【FlutterLog】新規投稿完了");
      }
      return true;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("【FlutterLog】新規投稿完了エラー：$e");
      }
      return false;
    }
  }

  static Future<List<Post>?> getPostsFromIds(List<String> ids) async {
    List<Post> postList = [];
    try {
      await Future.forEach(ids, (String id) async {
        var doc = await posts.doc(id).get();
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Post post = Post(
          id: doc.id,
          content: data["content"],
          postAccountId: data["post_account_id"],
          createdTime: data["created_time"],
        );
        postList.add(post);
      });
      if (kDebugMode) {
        print("【FlutterLog】自分の投稿取得完了");
      }
      return postList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("【FlutterLog】自分の投稿取得エラー：$e");
      }
      return null;
    }
  }
}
