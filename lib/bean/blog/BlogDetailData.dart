import 'package:wan_android_flutter/bean/base/BaseDetailData.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/base/TabDetailTag.dart';

part 'BlogDetailData.g.dart';

@JsonSerializable()
class BlogDetailData extends BaseDetailData {
  BlogDetailData(
      int id,
      String appLink,
      String author,
      int chapterId,
      String chapterName,
      bool collect,
      int courseId,
      String desc,
      String envelopePic,
      bool fresh,
      String link,
      String niceDate,
      String origin,
      String prefix,
      String projectLink,
      int publishTime,
      int superChapterId,
      String superChapterName,
      String title,
      int type,
      int userId,
      int visible,
      int zan,
      List<TabDetailTag> tags)
      : super(
            id,
            appLink,
            author,
            chapterId,
            chapterName,
            collect,
            courseId,
            desc,
            envelopePic,
            fresh,
            link,
            niceDate,
            origin,
            prefix,
            projectLink,
            publishTime,
            superChapterId,
            superChapterName,
            title,
            type,
            userId,
            visible,
            zan,
            tags);

  factory BlogDetailData.fromJson(Map<String, dynamic> json) =>
      _$BlogDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$BlogDetailDataToJson(this);
}
