import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studysharesns/model/account.dart';
import 'package:intl/intl.dart';
import 'package:studysharesns/view/post/post_page.dart';

import '../../model/post.dart';

class PostIndexPage extends StatefulWidget {
  const PostIndexPage({Key? key}) : super(key: key);

  @override
  _PostIndexPageState createState() => _PostIndexPageState();
}

class _PostIndexPageState extends State<PostIndexPage> {
  Account myAccount = Account(
      id: "1",
      name: "Haya",
      selfIntroduction: "Hayaです。",
      userId: "engineer",
      imagePath:
          "https://www.pakutaso.com/shared/img/thumb/ADIMGL6720_TP_V.jpg",
      createdTime: Timestamp.now(),
      updatedTime: Timestamp.now());
  List<Post> postList = [
    Post(
      id: "1",
      content: "こんにちは",
      postAccountId: "1",
      createdTime: DateTime.now(),
    ),
    Post(
      id: "2",
      content: "よろしくお願いします。",
      postAccountId: "1",
      createdTime: DateTime.now(),
    )
  ];

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
        body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (context, index) {
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
                      foregroundImage: NetworkImage(myAccount.imagePath)),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(myAccount.name),
                                    Text("@${myAccount.userId}",
                                        style: const TextStyle(
                                            color: Colors.grey)),
                                  ],
                                ),
                                Text(DateFormat("M/d/yy")
                                    .format(postList[index].createdTime!)),
                              ]),
                          Text(postList[index].content),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
