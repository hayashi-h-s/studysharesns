import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/DateTimeTimestampConverter.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const Post._();

  const factory Post(
      {required String id,
      required String content,
      required String postAccountId,
      @DateTimeTimestampConverter() required DateTime createdTime}) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Post.fromJson(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
//
// class Post {
//   String id;
//   String content;
//   String postAccountId;
//   Timestamp? createdTime;
//
//   Post({
//     this.id = "",
//     this.content = "",
//     this.postAccountId = "",
//     this.createdTime,
//   });
// }
// //
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:freezed_annotation/freezed_annotation.dart';
// //
// // import '../../utils/DateTimeTimestampConverter.dart';
// //
// // part 'account.freezed.dart';
// // part 'account.g.dart';
// //
// // @freezed
// // class Account with _$Account {
// //   const Account._();
//   const factory Account({
//     String? id,
//     required String userId,
//     required String name,
//     required String imagePath,
//     @Default("") String selfIntroduction,
//     @DateTimeTimestampConverter() required DateTime createdAt,
//     @DateTimeTimestampConverter() required DateTime updatedAt,
//   }) = _Account;
//   factory Account.fromJson(Map<String, dynamic> json) =>
//       _$AccountFromJson(json);
//   factory Account.fromDocument(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return Account.fromJson(data).copyWith(id: doc.id);
//   }
//   Map<String, dynamic> toDocument() => toJson()..remove('id');
// }
