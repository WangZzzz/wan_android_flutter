import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/blog/BlogDetailData.dart';

part 'BlogData.g.dart';

@JsonSerializable()
class BlogData {
  BlogData(this.curPage, this.datas, this.offset, this.over, this.pageCount,
      this.size, this.total);

  int curPage;
  List<BlogDetailData> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;
  
  //不同的类使用不同的mixin即可
  factory BlogData.fromJson(Map<String, dynamic> json) =>
      _$BlogDataFromJson(json);

  Map<String, dynamic> toJson() => _$BlogDataToJson(this);
}
