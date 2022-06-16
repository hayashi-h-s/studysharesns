import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:studysharesns/utils/Authentication.dart';
import 'package:studysharesns/view/post/posts_index_page.dart';
import 'package:studysharesns/view/screen.dart';

import 'create_account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "エンジニア用SNS(仮)",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      width: 300,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(hintText: "メールアドレス"),
                      )),
                ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: passController,
                      decoration: InputDecoration(hintText: "パスワード"),
                    )),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          const TextSpan(text: "アカウントを作成していない方は"),
                          TextSpan(
                              text: "こちら",
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (
                                            context) => const CreateAccountPage(),
                                      ));
                                })
                        ])),
                const SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (emailController.text.isNotEmpty &&
                          passController.text.isNotEmpty) {
                        final result = await Authentication.emailSignIn(
                            email: emailController.text,
                            pass: passController.text);
                        if (result) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Screen()));
                        }
                      }
                    },
                    child: const Text("emailログイン"))
              ],
            ),
          )),
    );
  }
}
