// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeChatResponseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeChatResponseData _$WeChatResponseDataFromJson(Map<String, dynamic> json) {
  return WeChatResponseData(
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : WeChatClassifyData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$WeChatResponseDataToJson(WeChatResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
