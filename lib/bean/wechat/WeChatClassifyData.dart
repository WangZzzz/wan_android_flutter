import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/base/BaseClassifyData.dart';

part 'WeChatClassifyData.g.dart';

@JsonSerializable()
class WeChatClassifyData extends BaseClassifyData {
  WeChatClassifyData(int id, String name, int order, int parentChapterId,
      bool userControlSetTop, int visible, int courseId)
      : super(id, name, order, parentChapterId, userControlSetTop, visible,
            courseId);

  factory WeChatClassifyData.fromJson(Map<String, dynamic> json) =>
      _$WeChatClassifyDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeChatClassifyDataToJson(this);
}
