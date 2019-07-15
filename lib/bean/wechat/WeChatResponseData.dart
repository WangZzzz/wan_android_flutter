import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/base/BaseModel.dart';
import 'package:wan_android_flutter/bean/wechat/WeChatClassifyData.dart';

part 'WeChatResponseData.g.dart';

@JsonSerializable()
class WeChatResponseData extends BaseModel<List<WeChatClassifyData>> {
  WeChatResponseData(
      List<WeChatClassifyData> data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  //不同的类使用不同的mixin即可
  factory WeChatResponseData.fromJson(Map<String, dynamic> json) =>
      _$WeChatResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeChatResponseDataToJson(this);
}
