import 'package:json_annotation/json_annotation.dart';

part 'BannerData.g.dart';

@JsonSerializable()
class BannerData{
  BannerData(this.id, this.desc, this.imagePath, this.isVisible, this.order,
      this.title, this.type, this.url);

  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  //不同的类使用不同的mixin即可
  factory BannerData.fromJson(Map<String, dynamic> json) =>
      _$BannerDataFromJson(json);

  Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}
