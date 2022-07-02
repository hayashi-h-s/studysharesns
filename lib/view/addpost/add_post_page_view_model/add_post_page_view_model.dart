import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/provider/provider.dart';

import '../../../controller/post_controller/post_controller.dart';

part 'add_post_page_view_model.freezed.dart';

final addPostPageProvider =
    StateNotifierProvider<AddPostPageProvider, AddPostPageState>(
  (ref) => AddPostPageProvider(ref.watch(postController.notifier)),
);

@freezed
class AddPostPageState with _$AddPostPageState {
  const factory AddPostPageState() = _PostPageState;
}

class AddPostPageProvider extends StateNotifier<AddPostPageState> {
  AddPostPageProvider(
    this._postController,
  ) : super(const AddPostPageState());

  final PostController _postController;

  Future<void> onPressedPostButton({
    required String content,
  }) async {
    print("【FlutterLog】content = $content ");
    // _postController.addPost(

    // try {
    //   await _accountController.createAccount(
    //       email: email,
    //       pass: pass,
    //       userId: userId,
    //       name: userId,
    //       imageFile: imageFile,
    //       selfIntroduction: selfIntroduction);
    //   LogUtils.outputLog("アカウント作成成功");
    // } on Exception catch (e) {
    //   LogUtils.outputLog("アカウント作成失敗");
    //   // TODO: エラー処理
    // }
  }
}
