import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 自動生成される2つのファイル
part 'item_model.freezed.dart';
part 'item_model.g.dart';

// Firestoreでは、日付のデータをTimestamp型として扱っていますが、DartではDateTime型なので、変換して型を合わせるのに使います
class DateTimeTimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const DateTimeTimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }
}

// クラスの作成
@freezed
class Item with _$Item {
  // コンストラクタ（メソッドやカスタムゲッター、カスタムフィールドを追加可能にする）
  const Item._();
  // データの内容
  factory Item({
    String? id,
    required String title,
    @Default(false) bool isCompleted,
    @DateTimeTimestampConverter() required DateTime createdAt,
  }) = _Item;

  // タスクを追加する際に、入力内容がなかった場合に入れるデータとして使います
  factory Item.empty() => Item(title: '', createdAt: DateTime.now());

  // FirestoreとのデータのやりとりはMap型で行うので、変換して型を合わせるのに使います
  factory Item.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Item.fromJson(data).copyWith(id: doc.id);
  }
  Map<String, dynamic> toDocument() => toJson()..remove('id');
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
