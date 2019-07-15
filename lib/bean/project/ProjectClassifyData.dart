import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/base/BaseClassifyData.dart';

part 'ProjectClassifyData.g.dart';

@JsonSerializable()
class ProjectClassifyData extends BaseClassifyData {
  ProjectClassifyData(int id, String name, int order, int parentChapterId,
      bool userControlSetTop, int visible, int courseId)
      : super(id, name, order, parentChapterId, userControlSetTop, visible,
            courseId);

  factory ProjectClassifyData.fromJson(Map<String, dynamic> json) =>
      _$ProjectClassifyDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectClassifyDataToJson(this);
}