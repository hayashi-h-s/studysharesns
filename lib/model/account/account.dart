import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/DateTimeTimestampConverter.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const Account._();
  const factory Account({
    String? id,
    required String userId,
    required String name,
    required String imagePath,
    @Default("") String selfIntroduction,
    @DateTimeTimestampConverter() DateTime? createdAt,
    @DateTimeTimestampConverter() DateTime? updatedAt,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  factory Account.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    Timestamp createdTime = data["created_time"];
    Timestamp updatedTime = data["updated_time"];
    Account myAccount = Account(
      id: doc.id,
      userId: data["user_id"],
      name: data["name"],
      imagePath: data["image_path"],
      selfIntroduction: data["self_introduction"],
      createdAt: createdTime.toDate(),
      updatedAt: updatedTime.toDate(),
    );
    return myAccount;
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
