import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../item_repository.dart';
import '../model/item_model.dart';

// ItemListNotifierの内容を管理するProviderを作成
final itemListProvider =
    StateNotifierProvider<ItemListNotifier, AsyncValue<List<Item>>>((ref) {
  return ItemListNotifier(ref.read);
});

// データの操作を行うクラスの作成
class ItemListNotifier extends StateNotifier<AsyncValue<List<Item>>> {
  // 外部からProviderを取得可能にする
  final Reader _read;

  // 初期値の指定
  ItemListNotifier(this._read) : super(const AsyncValue.loading()) {
    // アプリを起動時にデータを取得する
    retrieveItems();
  }

  // state(AsyncValue<List<Item>>)
  // Firestoreにデータを保存した後に、whenDataでAsyncValueの中のデータを操作しています
  // AsyncValueとは、非同期的に更新されるデータを安全に取り扱うために用意されたRiverpodの機能のことです

  // 取得
  Future<void> retrieveItems({bool isRefreshing = false}) async {
    if (isRefreshing) state = const AsyncValue.loading();
    try {
      final items = await _read(itemRepositoryProvider).retrieveItems();
      if (mounted) {
        state = AsyncValue.data(items);
      }
    } catch (e) {
      // 本来は例外処理をした方が良いですが、簡潔にするため省略しています
      throw e.toString();
    }
  }

  // 追加
  Future<void> addItem(
      {required String title, bool isCompleted = false}) async {
    try {
      final item = Item(
        title: title,
        isCompleted: isCompleted,
        createdAt: DateTime.now(),
      );
      final itemId = await _read(itemRepositoryProvider).createItem(item: item);
      state.whenData(
        (items) => state = AsyncValue.data(
          items..add(item.copyWith(id: itemId)),
        ),
      );
    } catch (e) {
      throw e.toString();
    }
  }

  // 更新
  Future<void> updateItem({required Item updatedItem}) async {
    try {
      await _read(itemRepositoryProvider).updateItem(item: updatedItem);
      state.whenData(
        (items) {
          state = AsyncValue.data([
            for (final item in items)
              if (item.id == updatedItem.id) updatedItem else item
          ]);
        },
      );
    } catch (e) {
      throw e.toString();
    }
  }

  // 削除
  Future<void> deleteItem({required String itemId}) async {
    try {
      await _read(itemRepositoryProvider).deleteItem(id: itemId);
      state.whenData(
        (items) => state = AsyncValue.data(
          items..removeWhere((item) => item.id == itemId),
        ),
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
