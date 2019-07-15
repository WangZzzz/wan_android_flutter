import 'package:json_annotation/json_annotation.dart';

part 'TabDetailTag.g.dart';

@JsonSerializable()
class TabDetailTag {
  String name;
  String url;

  TabDetailTag(this.name, this.url);

  factory TabDetailTag.fromJson(Map<String, dynamic> json) =>
      _$TabDetailTagFromJson(json);

  Map<String, dynamic> toJson() => _$TabDetailTagToJson(this);
}
