import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'picker_controller.freezed.dart';

@freezed
class PickerState with _$PickerState {
  const factory PickerState({
    File? imageFile,
  }) = _PickerState;
}

final pickerProvider =
    StateNotifierProvider.autoDispose<PickerController, PickerState>((ref) {
  return PickerPageController();
});

class PickerController extends StateNotifier<PickerState> {
  PickerController() : super(const PickerState());

  Future<void> pickImage(XFile? image) async {
    if (image == null) return;
    state = state.copyWith(imageFile: File(image.path));
  }
}
