import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'add_post_page_view_model/add_post_page_view_model.dart';

class AddPostPage extends HookConsumerWidget {
  AddPostPage({Key? key}) : super(key: key);

  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postPageViewModel = ref.watch(addPostPageProvider.notifier);
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
                if (contentController.text.isEmpty) return;

                postPageViewModel.onPressedPostButton(
                    content: contentController.text);

                //   Post newPost = Post(
                //     content: contentController.text,
                //     postAccountId: Authentication.myAccount!.id!,
                //   );
                //   var result = await PostFireStore.addPost(newPost);
                //   if (result) {
                //     Navigator.pop(context);
                //   }
              },
              child: const Text("投稿"),
            )
          ],
        ),
      ),
    );
  }
}
