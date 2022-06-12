import 'package:flutter/material.dart';
import 'package:studysharesns/model/account.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  Account myAccount = Account(
      id: "1",
      name: "1",
      selfIntroduction: "1",
      userId: "1",
      imagePath: "1",
      createdTime: DateTime.now(),
      updatedTime: DateTime.now()
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("投稿一覧"),
      ),
      body: const Text("内容"),
    );
  }
}
