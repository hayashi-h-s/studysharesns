import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/account/account.dart';

abstract class BaseAccountRepository {
  Future<String> createAccount({required Account account});

  Future<dynamic> signUpAccount({required String email, required String pass});
}

final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firebaseFirebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final accountRepositoryProvider =
    Provider<AccountRepository>((ref) => AccountRepository(ref.read));

class AccountRepository implements BaseAccountRepository {
  final Reader _read;
  const AccountRepository(this._read);

  @override
  Future<String> createAccount({
    required Account account,
  }) async {
    try {
      final docRef =
          await _read(firebaseFirestoreProvider).collection('user').add(
                account.toDocument(),
              );
      return docRef.id;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<dynamic> signUpAccount({
    required String email,
    required String pass,
  }) async {
    try {
      return await _read(firebaseFirebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: pass);
      ;
    } catch (e) {
      throw e.toString();
    }
  }
}
