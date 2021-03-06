import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/view/screen.dart';

import '../../model/account/account.dart';
import '../../provider/provider.dart';
import '../../utils/widget_utils.dart';
import '../create_account/create_account_page.dart';
import 'login_page_view_model.dart';

class LoginPage extends HookConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginPageViewModel = ref.watch(loginPageProvider.notifier);
    final loginPageSate = ref.watch(loginPageProvider);

    ref.listen<Account?>(accountController, (oldAccount, loginAccount) {
      if (loginAccount != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Screen()),
        );
      }
    });

    ref.listen<LoginPageState>(loginPageProvider, (previous, next) {
      if (next.isError) {
        WidgetUtils.createAlertDialog(
            context: context,
            title: "ログイン失敗",
            message: "emailかパスワードが違います。\nもしくは通信状態の良い場所で再度お試しください。",
            okBtnText: "OK");
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            if (loginPageSate.isLoading) WidgetUtils.createCircularProgress(),
            SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "エンジニア用SNS(仮)",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                          width: 300,
                          child: TextField(
                            controller: emailController,
                            decoration:
                                const InputDecoration(hintText: "メールアドレス"),
                          )),
                    ),
                    SizedBox(
                        width: 300,
                        child: TextField(
                          controller: passController,
                          decoration: const InputDecoration(hintText: "パスワード"),
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
                                        builder: (context) =>
                                            const CreateAccountPage(),
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
                            loginPageViewModel.onPressedLoginButton(
                                email: emailController.text,
                                pass: passController.text);
                          }
                        },
                        child: const Text("emailログイン")),
                    ElevatedButton(
                        onPressed: () async {
                          final account = await ref
                              .read(accountRepositoryProvider)
                              .getUser(uid: "OWBCIl1wLmZdoKtAFtIIqq51Qnt2");
                          ref.read(accountController.notifier).state = account;
                        },
                        child: const Text("テストユーザーでログイン")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
