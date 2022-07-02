import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/post/post.dart';

part 'post_controller.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    Post? post,
  }) = _PostState;
}

class PostController extends StateNotifier<Post?> {
  final Reader _read;

  PostController(this._read) : super(null);
}
