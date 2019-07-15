import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/base/BasePagingData.dart';
import 'package:wan_android_flutter/bean/blog/BlogDetailData.dart';

part 'BlogData.g.dart';

@JsonSerializable()
class BlogData extends BasePagingData<BlogDetailData> {
  BlogData(int curPage, int offset, bool over, int pageCount, int size,
      int total, List<BlogDetailData> datas)
      : super(curPage, offset, over, pageCount, size, total, datas);

  //不同的类使用不同的mixin即可
  factory BlogData.fromJson(Map<String, dynamic> json) =>
      _$BlogDataFromJson(json);

  Map<String, dynamic> toJson() => _$BlogDataToJson(this);
}
