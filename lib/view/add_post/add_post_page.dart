import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/provider/provider.dart';

import 'add_post_page_view_model/add_post_page_view_model.dart';

class AddPostPage extends HookConsumerWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentController = TextEditingController();
    final accountProvider = ref.watch(accountController);
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
                if (contentController.text.isEmpty ||
                    accountProvider == null ||
                    accountProvider.id == null) return;
                postPageViewModel.onPressedPostButton(
                    content: contentController.text,
                    postUserId: accountProvider.id as String);
              },
              child: const Text("投稿"),
            )
          ],
        ),
      ),
    );
  }
}
