import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/base/BaseModel.dart';
import 'package:wan_android_flutter/bean/project/ProjectClassifyData.dart';

part 'ProjectResponseData.g.dart';

@JsonSerializable()
class ProjectResponseData extends BaseModel<List<ProjectClassifyData>> {
  ProjectResponseData(
      List<ProjectClassifyData> data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  factory ProjectResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectResponseDataToJson(this);
}
