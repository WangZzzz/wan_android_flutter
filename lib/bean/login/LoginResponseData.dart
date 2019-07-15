import 'package:wan_android_flutter/bean/base/BaseModel.dart';
import 'package:wan_android_flutter/bean/login/UserData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'LoginResponseData.g.dart';

@JsonSerializable()
class LoginResponseData extends BaseModel<UserData> {
  LoginResponseData(UserData data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  //不同的类使用不同的mixin即可
  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDataToJson(this);
}
