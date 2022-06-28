import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../provider/provider.dart';
import '../screen.dart';

class CreateAccountPage extends HookConsumerWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(pickerProvider.select((s) => s.imageFile));
    final account = ref.watch(accountProvider);
    final accountNotifier = ref.watch(accountProvider.notifier);

    final nameController = useTextEditingController();
    final userIdController = useTextEditingController();
    final selfIntroductionController = useTextEditingController();
    final emailController = useTextEditingController();
    final passController = useTextEditingController();

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
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  await ref.read(pickerProvider.notifier).pickImage(image);
                },
                child: CircleAvatar(
                  radius: 40,
                  foregroundImage:
                      imageFile == null ? null : FileImage(imageFile),
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
                      passController.text.isEmpty ||
                      imageFile == null) return;

                  final isCreatedAccount = await accountNotifier.createAccount(
                      email: emailController.text,
                      pass: passController.text,
                      userId: userIdController.text,
                      name: nameController.text,
                      imageFile: imageFile,
                      selfIntroduction: selfIntroductionController.text);

                  if (isCreatedAccount) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Screen()),
                    );
                  }
                },
                child: const Text("アカウント作成"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
