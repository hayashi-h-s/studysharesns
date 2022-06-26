import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/DateTimeTimestampConverter.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    required String id,
    required String userId,
    required String name,
    required String imagePath,
    @Default("") String selfIntroduction,
    @DateTimeTimestampConverter() DateTime? createdTime,
    @DateTimeTimestampConverter() DateTime? updatedTime,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
