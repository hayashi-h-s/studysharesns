import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studysharesns/view/create_account/create_account_view_model.dart';
import 'package:studysharesns/view/screen.dart';

import '../../utils/function_utils.dart';

class CreateAccountPage extends HookConsumerWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  File? fileImage;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProvider);
    final accountNotifier = ref.watch(accountProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "アカウント登録",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {
                    var pickedFile = await FunctionUtils.getImageFromGallery();
                    if (pickedFile != null) {
                      // setState(() {
                      //   fileImage = File(pickedFile.path);
                      // });
                    }
                  },
                  child: CircleAvatar(
                    radius: 40,
                    foregroundImage:
                        fileImage == null ? null : FileImage(fileImage!),
                    child: const Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "名前"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: userIdController,
                      decoration: const InputDecoration(hintText: "ユーザーID"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: selfIntroductionController,
                    decoration: const InputDecoration(hintText: "自己紹介"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: "メールアドレス"
                              ""),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: passController,
                    decoration: const InputDecoration(hintText: "パスワード"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                            userIdController.text.isEmpty ||
                            selfIntroductionController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            passController.text.isEmpty
                        // &&
                        // fileImage != null
                        ) return;
                    var result = await accountNotifier.createAccount(
                        email: emailController.text,
                        pass: passController.text,
                        userId: userIdController.text,
                        name: nameController.text,
                        imagePath: "",
                        selfIntroduction: selfIntroductionController.text);
                    if (!result) {
                      // TODO:エラー時の処理
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Screen(),
                        ),
                      );
                    }
                  },
                  child: const Text("アカウント作成"),
                )
              ],
            ),
          ),
        ));
  }
}
