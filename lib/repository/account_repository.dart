import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/account/account.dart';

abstract class BaseAccountRepository {
  Future<String> createAccount({required Account account});
}

final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

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
          await _read(firebaseFirestoreProvider).collection('lists').add(
                account.toDocument(),
              );
      return docRef.id;
    } catch (e) {
      throw e.toString();
    }
  }
}
