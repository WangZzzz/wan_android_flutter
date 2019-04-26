// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BannerResponseData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponseData _$BannerResponseDataFromJson(Map<String, dynamic> json) {
  return BannerResponseData(
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : BannerData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$BannerResponseDataToJson(BannerResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
