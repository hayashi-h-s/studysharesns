import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model/item_model.dart';

// overrideで値を書き換えられるabstractクラスの作成
abstract class BaseItemRepository {
  Future<List<Item>> retrieveItems();
  Future<String> createItem({required Item item});
  Future<void> updateItem({required Item item});
  Future<void> deleteItem({required String id});
}

// Firestoreのインスタンスを取得するProviderの作成
final firebaseFirestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

// ItemRepositoryの内容を管理するProviderの作成
final itemRepositoryProvider =
    Provider<ItemRepository>((ref) => ItemRepository(ref.read));

// Firestoreとのやりとりをまとめたクラスの作成（BaseItemRepositoryの内容）
class ItemRepository implements BaseItemRepository {
  // 外部からProviderを取得可能にする
  final Reader _read;
  const ItemRepository(this._read);

  // Firestoreとのやりとりの基本は、インスタンスを取得 ▶︎ データの保存先を指定 ▶︎ メソッドを使う

  // 取得
  // getメソッドで値を取得する
  @override
  Future<List<Item>> retrieveItems() async {
    try {
      final snap =
          await _read(firebaseFirestoreProvider).collection('lists').get();
      return snap.docs.map((doc) => Item.fromDocument(doc)).toList();
    } catch (e) {
      // 本来は例外処理をした方が良いですが、簡潔にするため省略しています
      throw e.toString();
    }
  }

  // 追加
  // addメソッドで値を追加する
  @override
  Future<String> createItem({
    required Item item,
  }) async {
    try {
      final docRef =
          await _read(firebaseFirestoreProvider).collection('lists').add(
                item.toDocument(),
              );
      return docRef.id;
    } catch (e) {
      throw e.toString();
    }
  }

  // 更新
  // updateメソッドで値を更新する
  @override
  Future<void> updateItem({required Item item}) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('lists')
          .doc(item.id)
          .update(item.toDocument());
    } catch (e) {
      throw e.toString();
    }
  }

  // 削除
  // deleteメソッドで値を削除する
  @override
  Future<void> deleteItem({
    required String id,
  }) async {
    try {
      await _read(firebaseFirestoreProvider)
          .collection('lists')
          .doc(id)
          .delete();
    } catch (e) {
      throw e.toString();
    }
  }
}
