import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/post_controller/post_controller.dart';

class PostIndexPage extends HookConsumerWidget {
  const PostIndexPage({Key? key}) : super(key: key);

  Future<bool> _willPopCallback() async {
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(postListProvider);

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text("投稿一覧"),
              backgroundColor: Colors.indigo,
              automaticallyImplyLeading: false),
          body: postList.when(
            data: (posts) => ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                if (index + 1 == posts.length) {
                  return Container(
                    alignment: Alignment.center,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "投稿は以上です",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                }
                // TODO: ユーザー情報取得処理修正時に修正
                // Map<String, dynamic> data =
                // postSnapshot.data!.docs[index].data()
                // as Map<String, dynamic>;
                // Post post = Post(
                //   id: postSnapshot.data!.docs[index].id,
                //   content: data["content"],
                //   postAccountId: data["post_account_id"],
                //   createdAt: data["createdAt"],
                // );
                // Account postAccount =
                // userSnapshot.data![post.postAccountId]!;
                return Container(
                  decoration: BoxDecoration(
                    border: index == 0
                        ? const Border(
                            top: BorderSide(color: Colors.grey, width: 0),
                            bottom: BorderSide(color: Colors.grey, width: 0),
                          )
                        : const Border(
                            bottom: BorderSide(color: Colors.grey, width: 0),
                          ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        // TODO: ユーザー情報取得時に実装
                        // foregroundImage:
                        // NetworkImage()),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("postAccount.name"),
                                        Text("@postAccount.userId}",
                                            style: const TextStyle(
                                                color: Colors.grey)),
                                      ],
                                    ),
                                    // Text(DateFormat("M/d/yy")
                                    //     .format(post.createdTime!
                                    //         .toDate())),
                                  ]),
                              Text(post.content),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Text(error.toString()),
          )),
    );
  }
}
