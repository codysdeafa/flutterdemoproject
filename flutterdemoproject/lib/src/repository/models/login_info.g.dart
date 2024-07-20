// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDetails _$LoginDetailsFromJson(Map<String, dynamic> json) => LoginDetails(
      tokenExpireIn: (json['tokenExpireIn'] as num?)?.toInt(),
      refreshToken: json['refreshToken'] as String?,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$LoginDetailsToJson(LoginDetails instance) =>
    <String, dynamic>{
      'tokenExpireIn': instance.tokenExpireIn,
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
    };
