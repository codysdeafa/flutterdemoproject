import 'package:json_annotation/json_annotation.dart';
part 'login_info.g.dart';

@JsonSerializable()
class LoginDetails {
  /// token过期时间 ;
  final int? tokenExpireIn;

  ///刷新token，用于刷新登陆token
  final String? refreshToken;

  ///登陆token
  final String? accessToken;

  LoginDetails({
    this.tokenExpireIn,
    this.refreshToken,
    this.accessToken,
  });

  factory LoginDetails.fromJson(Map<String, dynamic> json) =>
      _$LoginDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDetailsToJson(this);
}
