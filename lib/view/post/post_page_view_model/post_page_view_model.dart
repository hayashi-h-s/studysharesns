import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/provider/provider.dart';

import '../../../controller/post_controller/post_controller.dart';

part 'post_page_view_model.freezed.dart';

final postPageProvider = StateNotifierProvider<PostPageProvider, PostPageState>(
  (ref) => PostPageProvider(ref.watch(postController.notifier)),
);

@freezed
class PostPageState with _$PostPageState {
  const factory PostPageState() = _PostPageState;
}

class PostPageProvider extends StateNotifier<PostPageState> {
  PostPageProvider(
    this._postController,
  ) : super(const PostPageState());

  final PostController _postController;

  // Future<void> onPressedPostButton(
  //     // {required String email,
  //     //   required String pass,
  //     //   required String userId,
  //     //   required String name,
  //     //   required File imageFile,
  //     //   required String selfIntroduction}
  //     ) async {
  //   // try {
  //   //   await _accountController.createAccount(
  //   //       email: email,
  //   //       pass: pass,
  //   //       userId: userId,
  //   //       name: userId,
  //   //       imageFile: imageFile,
  //   //       selfIntroduction: selfIntroduction);
  //   //   LogUtils.outputLog("アカウント作成成功");
  //   // } on Exception catch (e) {
  //   //   LogUtils.outputLog("アカウント作成失敗");
  //   //   // TODO: エラー処理
  //   // }
  // }
}
