import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android_flutter/bean/base/BasePagingData.dart';
import 'package:wan_android_flutter/bean/wechat/WeChatTabDetailData.dart';

part 'WeChatTabData.g.dart';

@JsonSerializable()
class WeChatTabData extends BasePagingData<WeChatTabDetailData> {
  WeChatTabData(int curPage, int offset, bool over, int pageCount, int size,
      int total, List<WeChatTabDetailData> datas)
      : super(curPage, offset, over, pageCount, size, total, datas);

  factory WeChatTabData.fromJson(Map<String, dynamic> json) =>
      _$WeChatTabDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeChatTabDataToJson(this);
}
