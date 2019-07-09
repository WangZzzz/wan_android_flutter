import 'package:json_annotation/json_annotation.dart';

part 'UserData.g.dart';

@JsonSerializable()
class UserData {
  //是否为管理员
  bool admin;
  String email;
  int id;
  String nickname;
  String token;
  int type;
  String username;

  UserData(this.admin, this.email, this.id, this.nickname, this.token,
      this.type, this.username);

//不同的类使用不同的mixin即可
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
