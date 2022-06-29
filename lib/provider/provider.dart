import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/picker_controller.dart';
import '../model/account/account.dart';
import '../repository/account_repository.dart';
import '../view/create_account/create_account_view_model.dart';

// Firebase region start
final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firebaseFirebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseFirebaseStorageProvider =
    Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);
//endregion

// model region start
final accountProvider = StateNotifierProvider<AccountNotifier, Account?>((ref) {
  return AccountNotifier(ref.read);
});
//endregion

// repository region start
final accountRepositoryProvider =
    Provider<AccountRepository>((ref) => AccountRepository(ref.read));
//endregion

final pickerProvider =
    StateNotifierProvider.autoDispose<PickerController, PickerState>((ref) {
  return PickerController();
});
