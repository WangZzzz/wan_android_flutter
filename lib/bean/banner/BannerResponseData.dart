import 'package:wan_android_flutter/bean/banner/BannerData.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/base/BaseModel.dart';

part 'BannerResponseData.g.dart';

@JsonSerializable()
class BannerResponseData extends BaseModel<List<BannerData>> {
  BannerResponseData(List<BannerData> data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  //不同的类使用不同的mixin即可
  factory BannerResponseData.fromJson(Map<String, dynamic> json) =>
      _$BannerResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$BannerResponseDataToJson(this);
}
