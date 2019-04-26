import 'package:json_annotation/json_annotation.dart';

part 'BlogTag.g.dart';

@JsonSerializable()
class BlogTag {
  BlogTag(this.name, this.url);

  String name;
  String url;

  //不同的类使用不同的mixin即可
  factory BlogTag.fromJson(Map<String, dynamic> json) =>
      _$BlogTagFromJson(json);

  Map<String, dynamic> toJson() => _$BlogTagToJson(this);
}
