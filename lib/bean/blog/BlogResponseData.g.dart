// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogResponseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogResponseData _$BlogResponseDataFromJson(Map<String, dynamic> json) {
  return BlogResponseData(
      json['data'] == null
          ? null
          : BlogData.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$BlogResponseDataToJson(BlogResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
