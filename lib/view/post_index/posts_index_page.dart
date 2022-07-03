import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../controller/account_list_controller/account_list_controller.dart';
import '../../controller/post_list_controller/post_list_controller.dart';
import '../../model/account/account.dart';

class PostIndexPage extends HookConsumerWidget {
  const PostIndexPage({Key? key}) : super(key: key);

  Future<bool> _willPopCallback() async {
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(postListProvider);
    final accountList = ref.watch(accountListProvider);

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text("投稿一覧"),
              backgroundColor: Colors.indigo,
              automaticallyImplyLeading: false),
          body: accountList.when(
            data: (accountList) => ListView.builder(
              itemCount: postList.value!.length + 1,
              itemBuilder: (context, index) {
                if (index == postList.value?.length) {
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
                } else {
                  final post = postList.value?[index];
                  late Account postAccount;
                  for (var account in accountList) {
                    if (account.id == post?.postAccountId) {
                      postAccount = account;
                    }
                  }
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
                          foregroundImage: NetworkImage(postAccount.imagePath),
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
                                          Text(postAccount.name),
                                          Text("@${postAccount.userId}",
                                              style: const TextStyle(
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                      Text(
                                        DateFormat("M/d/yy")
                                            .format(post!.createdAt),
                                      ),
                                    ]),
                                Text(post.content),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Text(error.toString()),
          )),
    );
  }
}
