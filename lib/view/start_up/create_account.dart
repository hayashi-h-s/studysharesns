import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/Authentication.dart';
import '../screen.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  File? fileImage;
  ImagePicker picker = ImagePicker();

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        fileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadImage(String uid) async {
    final FirebaseStorage storageInstance = FirebaseStorage.instance;
    final Reference ref = storageInstance.ref();
    try {
      await ref.child(uid).putFile(fileImage!);
      String downloadUrl = await storageInstance.ref(uid).getDownloadURL();
      if (kDebugMode) {
        print("画像登録成功 = $downloadUrl");
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("画像登録失敗 =  ${e}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  onTap: getImageFromGallery,
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
                    if (nameController.text.isNotEmpty &&
                        userIdController.text.isNotEmpty &&
                        selfIntroductionController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passController.text.isNotEmpty) {
                      var result = await Authentication.signUp(
                          email: emailController.text,
                          pass: passController.text);
                      if (result is UserCredential) {
                        await uploadImage(result.user!.uid);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Screen(),
                          ),
                        );
                      }
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
