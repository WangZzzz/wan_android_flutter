import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/base/BasePagingData.dart';
import 'package:wan_android_flutter/bean/project/ProjectTabDetailData.dart';

part 'ProjectTabData.g.dart';

@JsonSerializable()
class ProjectTabData extends BasePagingData<ProjectTabDetailData> {
  ProjectTabData(int curPage, int offset, bool over, int pageCount, int size,
      int total, List<ProjectTabDetailData> datas)
      : super(curPage, offset, over, pageCount, size, total, datas);

  factory ProjectTabData.fromJson(Map<String, dynamic> json) =>
      _$ProjectTabDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTabDataToJson(this);
}
