// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as String?,
      content: json['content'] as String,
      postAccountId: json['postAccountId'] as String,
      createdAt: const DateTimeTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'postAccountId': instance.postAccountId,
      'createdAt':
          const DateTimeTimestampConverter().toJson(instance.createdAt),
    };
