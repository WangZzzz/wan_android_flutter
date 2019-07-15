import 'package:wan_android_flutter/bean/base/BaseModel.dart';
import 'package:wan_android_flutter/bean/project/ProjectTabData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProjectTabResponseData.g.dart';

@JsonSerializable()
class ProjectTabResponseData extends BaseModel<ProjectTabData> {
  ProjectTabResponseData(ProjectTabData data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  factory ProjectTabResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProjectTabResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTabResponseDataToJson(this);
}
