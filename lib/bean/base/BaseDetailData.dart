import 'package:wan_android_flutter/bean/base/TabDetailTag.dart';

/**
 * 基础详情数据
 */
class BaseDetailData {
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
  List<TabDetailTag> tags;

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

  BaseDetailData(
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
}
