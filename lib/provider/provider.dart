import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/account_controller/account_controller.dart';
import '../controller/picker_controller/picker_controller.dart';
import '../model/account/account.dart';
import '../repository/account_repository.dart';

// Firebase region start
final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firebaseFirebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseFirebaseStorageProvider =
    Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);
//endregion

// model region start
final accountController =
    StateNotifierProvider<AccountController, Account?>((ref) {
  return AccountController(ref.read);
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
