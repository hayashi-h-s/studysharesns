import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studysharesns/utils/Authentication.dart';
import 'package:studysharesns/utils/firestore/post_firestore.dart';
import 'package:studysharesns/utils/firestore/user_firestore.dart';
import 'package:studysharesns/view/account/edit_account_page.dart';

import '../../model/account/account.dart';
import '../../model/post.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Account myAccount = Authentication.myAccount!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height + 80,
        child: Column(children: [
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 32,
                            foregroundImage: NetworkImage(myAccount.imagePath),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myAccount.name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text("@${myAccount.userId}")
                            ],
                          )
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditAccountPage(),
                              ));
                          if (result == true) {
                            setState(() {
                              myAccount = Authentication.myAccount!;
                            });
                          }
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
                    bottom: BorderSide(color: Colors.indigo, width: 3))),
            child: const Padding(
              padding: EdgeInsets.all(2.0),
              child: Text(
                "投稿",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: UserFireStore.users
                    .doc(myAccount.id)
                    .collection("my_posts")
                    .orderBy("created_time", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<String> myPostIds =
                        List.generate(snapshot.data!.docs.length, (index) {
                      return snapshot.data!.docs[index].id;
                    });
                    return FutureBuilder<List<Post>?>(
                        future: PostFireStore.getPostsFromIds(myPostIds),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length + 1,
                              itemBuilder: (context, index) {
                                if (index == snapshot.data!.length) {
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
                                Post post = snapshot.data![index];
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
                                          foregroundImage: NetworkImage(
                                              myAccount.imagePath)),
                                      Expanded(
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 8),
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
                                                        Text(
                                                            "@${myAccount.userId}",
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                      ],
                                                    ),
                                                    Text(DateFormat("M/d/yy")
                                                        .format(post
                                                            .createdTime!
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
        ]),
      ),
    )));
  }
}
