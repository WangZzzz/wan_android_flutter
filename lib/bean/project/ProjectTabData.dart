import 'package:wan_android_flutter/bean/project/ProjectTabDetailData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProjectTabData.g.dart';

@JsonSerializable()
class ProjectTabData {
  ProjectTabData(this.curPage, this.offset, this.over, this.pageCount,
      this.size, this.total, this.datas);

  int curPage;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;
  List<ProjectTabDetailData> datas;

  factory ProjectTabData.fromJson(Map<String, dynamic> json) =>
      _$ProjectTabDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTabDataToJson(this);
}
