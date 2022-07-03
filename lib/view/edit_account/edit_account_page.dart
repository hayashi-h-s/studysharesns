import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/utils/Authentication.dart';
import 'package:studysharesns/view/login/login_page.dart';

import '../../utils/widget_utils.dart';

class EditAccountPage extends HookConsumerWidget {
  const EditAccountPage({Key? key}) : super(key: key);

//   @override
//   State<EditAccountPage> createState() => _EditAccountPageState();
// }
//
// class _EditAccountPageState extends State<EditAccountPage> {
//   Account? myAccount = Authentication.myAccount;
//
//   File? fileImage;
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: myAccount!.name);
//     userIdController = TextEditingController(text: myAccount!.userId);
//     selfIntroductionController =
//         TextEditingController(text: myAccount!.selfIntroduction);
//   }
//
//   ImageProvider getImage() {
//     if (fileImage != null) {
//       return FileImage(fileImage!);
//     } else {
//       return NetworkImage(myAccount!.imagePath);
//     }
//   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final userIdController = TextEditingController();
    final selfIntroductionController = TextEditingController();

    return Scaffold(
      appBar: WidgetUtils.createAppBar("プロフィール編集"),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  // var pickedFile = await FunctionUtils.getImageFromGallery();
                  // if (pickedFile != null) {
                  //   setState(() {
                  //     fileImage = File(pickedFile.path);
                  //   });
                  // }
                },
                child: CircleAvatar(
                  radius: 40,
                  // foregroundImage: getImage(),
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
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (nameController.text.isNotEmpty &&
                      userIdController.text.isNotEmpty &&
                      selfIntroductionController.text.isNotEmpty) {
                    // var imagePath = "";
                    // if (fileImage != null) {
                    //   var result = await FunctionUtils.uploadImage(
                    //       myAccount!.id!, fileImage!);
                    //   if (result is String) {
                    //     imagePath = result as String;
                    //   }
                    // } else {
                    //   imagePath = myAccount!.imagePath;
                    // }
                    // TODO: ユーザー編集処理修正時に修正
                    // Account updateAccount = Account(
                    //   id: myAccount!.id,
                    //   userId: userIdController.text,
                    //   name: nameController.text,
                    //   imagePath: imagePath,
                    //   selfIntroduction: selfIntroductionController.text,
                    // );
                    // Authentication.myAccount = updateAccount;
                    // var resultUpdateUser =
                    //     await UserFireStore.updateUser(updateAccount);
                    // if (resultUpdateUser == true) {
                    //   Navigator.pop(context, true);
                    // }
                  }
                },
                child: const Text("更新"),
              ),
              ElevatedButton(
                onPressed: () {
                  Authentication.signOut();
                  while (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: const Text("ログアウト"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
