import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studysharesns/provider/provider.dart';
import 'package:studysharesns/utils/Authentication.dart';
import 'package:studysharesns/view/edit_account/edit_account_view_model/edit_account_page_view_model.dart';
import 'package:studysharesns/view/login/login_page.dart';

import '../../controller/picker_controller/picker_controller.dart';
import '../../utils/widget_utils.dart';

class EditAccountPage extends HookConsumerWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAccount = ref.watch(accountController);
    final editAccountPageViewModel =
        ref.watch(editAccountPageProvider.notifier);
    final imageFile = ref.watch(pickerProvider.select((s) => s.imageFile));
    final nameController = TextEditingController(text: myAccount?.name);
    final userIdController = TextEditingController(text: myAccount?.userId);
    final selfIntroductionController =
        TextEditingController(text: myAccount?.selfIntroduction);

    return Scaffold(
      appBar: WidgetUtils.createAppBar("プロフィール編集"),
      body: myAccount == null
          ? Container(
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "ユーザー情報取得エラー",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          : SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () async {
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        await ref
                            .read(pickerProvider.notifier)
                            .pickImage(image);
                        // var pickedFile = await FunctionUtils.getImageFromGallery();
                        // if (pickedFile != null) {
                        //   setState(() {
                        //     fileImage = File(pickedFile.path);
                        //   });
                        // }
                      },
                      child: CircleAvatar(
                        radius: 40,
                        // foregroundImage: imageFile != null
                        //     ? NetworkImage(myAccount.imagePath)
                        //     : FileImage(imageFile),

                        // foregroundImage:NetworkImage(myAccount.imagePath),
                        foregroundImage: imageFile == null
                            ? NetworkImage(myAccount.imagePath) as ImageProvider
                            : FileImage(imageFile),
                        // :NetworkImage(myAccount.imagePath),
//
//                         imageFile == null
//                             ? NetworkImage(myAccount.imagePath)
//                             : ,
// // Ca
// //                        CachedNetworkImageProvider
//                         backgroundImage: (
//                           // cardUser.profileImageURL,
//                         ),

                        // foregroundImage:
                        //     imageFile == null ? NetworkImage(myAccount.imagePath) : FileImage(imageFile),
                        //
                        //
                        // backgroundImage: imageFile == null
                        //     ? NetworkImage(myAccount.imagePath)
                        //     : FileImage(imageFile),

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
                          editAccountPageViewModel.onPressedUpdateAccountButton(
                              uid: myAccount.id as String,
                              imageFile: imageFile,
                              userId: userIdController.text,
                              name: nameController.text,
                              selfIntroduction:
                                  selfIntroductionController.text);

                          // print("【FlutterLog】imageFile =${imageFile}");
                          // if (imageFile != null) {
                          //
                          // }

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
