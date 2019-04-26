import 'package:wan_android_flutter/bean/blog/BlogTag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'BlogDetailData.g.dart';

@JsonSerializable()
class BlogDetailData {
  BlogDetailData(
      this.id,
      this.appLink,
      this.author,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.desc,
      this.envelopePic,
      this.fresh,
      this.link,
      this.niceDate,
      this.origin,
      this.prefix,
      this.projectLink,
      this.publishTime,
      this.superChapterId,
      this.tags,
      this.title,
      this.type,
      this.userId,
      this.visible,
      this.zan);

  int id;
  String appLink;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  String link;
  String niceDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int superChapterId;
  String superChapterName;
  List<BlogTag> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  factory BlogDetailData.fromJson(Map<String, dynamic> json) =>
      _$BlogDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$BlogDetailDataToJson(this);
}
