import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/base/BaseModel.dart';
import 'package:wan_android_flutter/bean/wechat/WeChatTabData.dart';

part 'WeChatTabResponseData.g.dart';

@JsonSerializable()
class WeChatTabResponseData extends BaseModel<WeChatTabData> {
  WeChatTabResponseData(WeChatTabData data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);


  factory WeChatTabResponseData.fromJson(Map<String, dynamic> json) =>
      _$WeChatTabResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeChatTabResponseDataToJson(this);
}
