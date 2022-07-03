import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:studysharesns/controller/my_post_list_controller/my_post_list_controller.dart';
import 'package:studysharesns/provider/provider.dart';

import '../../model/post/post.dart';
import '../edit_account/edit_account_page.dart';

class MyAccountPage extends HookConsumerWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAccount = ref.watch(accountController);
    final myPostList = ref.watch(myPostListProvider);
    return Scaffold(
      body: myAccount == null
          ? const Text("ユーザー情報がありません。") // TODO: 後に修正予定
          : SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height + 80,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 32,
                                        foregroundImage:
                                            NetworkImage(myAccount.imagePath),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            myAccount.name,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text("@${myAccount.userId}")
                                        ],
                                      )
                                    ],
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const EditAccountPage(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "編集",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(myAccount.selfIntroduction)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey, width: 0),
                                bottom: BorderSide(
                                    color: Colors.indigo, width: 3))),
                        child: const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                            "投稿",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: myPostList.when(
                          data: (postList) => ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: postList.length + 1,
                            itemBuilder: (context, index) {
                              if (index == postList.length) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "投稿は以上です",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                );
                              }
                              Post post = postList[index];
                              return Container(
                                decoration: BoxDecoration(
                                  border: index == 0
                                      ? const Border(
                                          top: BorderSide(
                                              color: Colors.grey, width: 0),
                                          bottom: BorderSide(
                                              color: Colors.grey, width: 0),
                                        )
                                      : const Border(
                                          bottom: BorderSide(
                                              color: Colors.grey, width: 0),
                                        ),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                        radius: 22,
                                        foregroundImage:
                                            NetworkImage(myAccount.imagePath)),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(myAccount.name),
                                                    Text("@${myAccount.userId}",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.grey)),
                                                  ],
                                                ),
                                                Text(
                                                  DateFormat("M/d/yy")
                                                      .format(post.createdAt),
                                                ),
                                              ],
                                            ),
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
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          error: (error, _) => Text(
                            error.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
