import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:studysharesns/controller/post_list_controller/post_list_controller.dart';

part 'my_account_page_view_model.freezed.dart';

final myAccountPageProvider =
    StateNotifierProvider<MyAccountPageProvider, MyAccountPageState>(
  (ref) => MyAccountPageProvider(ref.watch(postListProvider.notifier)),
);

@freezed
class MyAccountPageState with _$MyAccountPageState {
  const factory MyAccountPageState() = _MyAccountPageState;
}

class MyAccountPageProvider extends StateNotifier<MyAccountPageState> {
  MyAccountPageProvider(
    this._postListController,
  ) : super(const MyAccountPageState());

  final PostListController _postListController;
}
