// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      selfIntroduction: json['selfIntroduction'] as String? ?? "",
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      updatedTime: json['updatedTime'] == null
          ? null
          : DateTime.parse(json['updatedTime'] as String),
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'selfIntroduction': instance.selfIntroduction,
      'createdTime': instance.createdTime?.toIso8601String(),
      'updatedTime': instance.updatedTime?.toIso8601String(),
    };
