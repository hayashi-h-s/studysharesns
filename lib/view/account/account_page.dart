import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studysharesns/utils/Authentication.dart';

import '../../model/account.dart';
import '../../model/post.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Account myAccount = Authentication.myAccount!;
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
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
    ),
    Post(
      id: "1",
      content: "こんにちは",
      postAccountId: "1",
      createdTime: DateTime.now(),
    ),
    Post(
      id: "2",
      content: "下",
      postAccountId: "1",
      createdTime: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Container(
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
                              foregroundImage:
                                  NetworkImage(myAccount.imagePath),
                            ),
                            const SizedBox(width: 8),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(myAccount.name,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text("@${myAccount.userId}")
                                ])
                          ],
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            child: const Text("編集",
                                style: TextStyle(color: Colors.blue)))
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(myAccount.selfIntroduction)
                  ]),
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
                child: Text("投稿",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              )),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
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
                            )),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
        ]),
      ),
    )));
  }
}
