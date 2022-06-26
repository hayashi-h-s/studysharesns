import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studysharesns/utils/firestore/user_firestore.dart';

import '../../model/account/account.dart';
import '../../utils/Authentication.dart';
import '../../utils/function_utils.dart';
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
                  onTap: () async {
                    var pickedFile = await FunctionUtils.getImageFromGallery();
                    if (pickedFile != null) {
                      setState(() {
                        fileImage = File(pickedFile.path);
                      });
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
                    if (nameController.text.isNotEmpty &&
                        userIdController.text.isNotEmpty &&
                        selfIntroductionController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passController.text.isNotEmpty &&
                        fileImage != null) {
                      var result = await Authentication.signUp(
                          email: emailController.text,
                          pass: passController.text);
                      if (result is UserCredential) {
                        var downloadUrl = await FunctionUtils.uploadImage(
                            result.user!.uid, fileImage!);
                        Account newAccount = Account(
                          id: result.user!.uid,
                          userId: userIdController.text,
                          name: nameController.text,
                          imagePath: downloadUrl,
                          selfIntroduction: selfIntroductionController.text,
                        );
                        var setUserResult =
                            await UserFireStore.setUser(newAccount);
                        if (setUserResult == true) {
                          var getUserResult =
                              await UserFireStore.getUser(result.user!.uid);
                          if (getUserResult == true) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Screen(),
                              ),
                            );
                          }
                        }
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
