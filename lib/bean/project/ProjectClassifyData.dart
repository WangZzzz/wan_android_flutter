import 'package:json_annotation/json_annotation.dart';

part 'ProjectClassifyData.g.dart';

@JsonSerializable()
class ProjectClassifyData {
  ProjectClassifyData(this.id, this.courseId, this.order, this.parentChapterId,
      this.visible, this.name, this.userControlSetTop);

  int id;
  int courseId;
  int order;
  int parentChapterId;
  int visible;
  String name;
  bool userControlSetTop;

  factory ProjectClassifyData.fromJson(Map<String, dynamic> json) =>
      _$ProjectClassifyDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectClassifyDataToJson(this);
}
