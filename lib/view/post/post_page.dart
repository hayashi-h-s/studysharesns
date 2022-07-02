import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("投稿一覧"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: "投稿",
                hintText: "今日は何を学びましたか？",
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                // TODO:投稿処理修正時に修正
                // if (contentController.text.isNotEmpty) {
                //   Post newPost = Post(
                //     content: contentController.text,
                //     postAccountId: Authentication.myAccount!.id!,
                //   );
                //   var result = await PostFireStore.addPost(newPost);
                //   if (result) {
                //     Navigator.pop(context);
                //   }
                // }
              },
              child: const Text("投稿"),
            )
          ],
        ),
      ),
    );
  }
}
