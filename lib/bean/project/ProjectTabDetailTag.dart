import 'package:json_annotation/json_annotation.dart';

part 'ProjectTabDetailTag.g.dart';

@JsonSerializable()
class ProjectTabDetailTag {
  ProjectTabDetailTag(this.name, this.url);

  String name;
  String url;

  factory ProjectTabDetailTag.fromJson(Map<String, dynamic> json) =>
      _$ProjectTabDetailTagFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTabDetailTagToJson(this);
}
