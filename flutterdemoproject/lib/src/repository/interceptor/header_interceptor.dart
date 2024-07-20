import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import '../../utils/device_utils.dart';
import '../../utils/encrypt/rsa_encrypt.dart';


class HeaderInterceptor extends Interceptor {
  static const _keyAuthorization = "Authorization";
  static const _keyTenant = "tenant";
  static const _keyLanguage = "accept-language";
  static const _keyToken = "token";
  static const _keyClientType = "client_type";
  static const _keyTimestamp = "timestamp";
  static const _keyVersion = "version";
  static const _keyDeviceId = "device_id";
  static const _keySign = "sign";
  static const _keyXign = "Xign";

  final deviceId = DeviceUtils.generateDeviceNumber();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({

      _keyLanguage: "zh-CN",
      _keyClientType: Platform.operatingSystem.toLowerCase(),
      _keyTimestamp: DateTime.now().millisecondsSinceEpoch,
      _keyDeviceId: deviceId,
    });
    final builder = StringBuffer();
    for (final item in options.headers.keys) {
      builder
        ..write(item)
        ..write("=")
        ..write(options.headers[item])
        ..write("&");
    }
    options.headers[_keySign] = md5
        .convert(
            utf8.encode(builder.toString().substring(0, builder.length - 1)))
        .toString();
    options.headers[_keyXign] =
        RSAEncrypt.encryption((DateTime.now().millisecondsSinceEpoch/1000).toString());

    handler.next(options);
  }
}
