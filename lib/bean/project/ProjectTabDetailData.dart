import 'package:wan_android_flutter/bean/project/ProjectTabDetailTag.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ProjectTabDetailData.g.dart';

@JsonSerializable()
class ProjectTabDetailData {
  ProjectTabDetailData(
      this.id,
      this.appLink,
      this.author,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.courseId,
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
      this.superChapterName,
      this.title,
      this.type,
      this.userId,
      this.visible,
      this.zan,
      this.tags);

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
  String title;
  int type;
  int userId;
  int visible;
  int zan;
  List<ProjectTabDetailTag> tags;

  factory ProjectTabDetailData.fromJson(Map<String, dynamic> json) =>
      _$ProjectTabDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectTabDetailDataToJson(this);

  @override
  // TODO: implement hashCode
  int get hashCode => id;

  @override
  bool operator ==(other) {
    // TODO: implement ==
    if (other == null) {
      return false;
    }
    return other.id == this.id;
  }
}
