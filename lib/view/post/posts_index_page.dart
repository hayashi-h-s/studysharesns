import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studysharesns/model/account.dart';
import 'package:studysharesns/utils/firestore/post_firestore.dart';
import 'package:studysharesns/utils/firestore/user_firestore.dart';

import '../../model/post.dart';

class PostIndexPage extends StatefulWidget {
  const PostIndexPage({Key? key}) : super(key: key);

  @override
  _PostIndexPageState createState() => _PostIndexPageState();
}

class _PostIndexPageState extends State<PostIndexPage> {
  Future<bool> _willPopCallback() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("投稿一覧"),
            backgroundColor: Colors.indigo,
            automaticallyImplyLeading: false),
        body: StreamBuilder<QuerySnapshot>(
            stream: PostFireStore.posts
                .orderBy("created_time", descending: true)
                .snapshots(),
            builder: (context, postSnapshot) {
              if (postSnapshot.hasData) {
                List<String> postAccountIds = [];
                for (var doc in postSnapshot.data!.docs) {
                  Map<String, dynamic> data =
                      doc.data() as Map<String, dynamic>;
                  if (!postAccountIds.contains(data["post_account_id"])) {
                    postAccountIds.add(data["post_account_id"]);
                  }
                }
                return FutureBuilder<Map<String, Account>?>(
                    future: UserFireStore.getPostUserMap(postAccountIds),
                    builder: (context, userSnapshot) {
                      if (userSnapshot.hasData &&
                          userSnapshot.connectionState ==
                              ConnectionState.done) {
                        return ListView.builder(
                          itemCount: postSnapshot.data!.docs.length + 1,
                          itemBuilder: (context, index) {
                            if (index == postSnapshot.data!.docs.length) {
                              return Container(
                                height: 200,
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
                            Map<String, dynamic> data =
                                postSnapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                            Post post = Post(
                              id: postSnapshot.data!.docs[index].id,
                              content: data["content"],
                              postAccountId: data["post_account_id"],
                              createdTime: data["created_time"],
                            );
                            Account postAccount =
                                userSnapshot.data![post.postAccountId]!;
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
                                          NetworkImage(postAccount.imagePath)),
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
                                                    Text(postAccount.name),
                                                    Text(
                                                        "@${postAccount.userId}",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.grey)),
                                                  ],
                                                ),
                                                Text(DateFormat("M/d/yy")
                                                    .format(post.createdTime!
                                                        .toDate())),
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
                        );
                      } else {
                        return Container();
                      }
                    });
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
