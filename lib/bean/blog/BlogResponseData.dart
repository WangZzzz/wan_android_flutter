import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/blog/BlogData.dart';
import 'package:wan_android_flutter/bean/base/BaseModel.dart';

part 'BlogResponseData.g.dart';

@JsonSerializable()
class BlogResponseData extends BaseModel<BlogData> {
  BlogResponseData(BlogData data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  //不同的类使用不同的mixin即可
  factory BlogResponseData.fromJson(Map<String, dynamic> json) =>
      _$BlogResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$BlogResponseDataToJson(this);
}
