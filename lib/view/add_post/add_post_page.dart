import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/provider/provider.dart';
import 'package:studysharesns/utils/widget_utils.dart';

import 'add_post_page_view_model/add_post_page_view_model.dart';

class AddPostPage extends HookConsumerWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentController = TextEditingController();
    final myAccount = ref.watch(accountController);
    final postPageViewModel = ref.watch(addPostPageProvider.notifier);
    final addPostPageState = ref.watch(addPostPageProvider);

    ref.listen<AddPostPageState>(addPostPageProvider, (previous, next) {
      if (next.isPosted) {
        Navigator.pop(context);
      }
    });

    ref.listen<AddPostPageState>(addPostPageProvider, (previous, next) {
      if (next.isError) {
        WidgetUtils.createAlertDialog(
            context: context,
            title: "エラー",
            message: "通信状態の良い場所で再度お試しください。",
            okBtnText: "OK");
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("投稿一覧"),
        backgroundColor: Colors.indigo,
      ),
      body:
          // if(addPostPageState.isLoading) WidgetUil
          Stack(
        children: [
          if (addPostPageState.isLoading) WidgetUtils.createCircularProgress(),
          Padding(
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
                    if (contentController.text.isEmpty || myAccount == null) {
                      return;
                    }
                    postPageViewModel.onPressedPostButton(
                        content: contentController.text, account: myAccount);
                  },
                  child: const Text("投稿"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
