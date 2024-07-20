import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

class DeviceUtils {
  DeviceUtils._();

  static AndroidDeviceInfo? _androidInfo;
  static IosDeviceInfo? _iosInfo;
  static const uuid = Uuid();

  static init() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) _androidInfo = await deviceInfo.androidInfo;
    if (Platform.isIOS) _iosInfo = await deviceInfo.iosInfo;
  }

  ///生成设备号
  static String generateDeviceNumber() {
    return Platform.isAndroid
        ? _generateDeviceNumberAndroid()
        : _generateDeviceNumberIOS();
  }

  static String _generateDeviceNumberAndroid() => uuid.v5(Uuid.NAMESPACE_URL,
      "${_androidInfo?.board}${_androidInfo?.brand}${_androidInfo?.manufacturer}${_androidInfo?.model}${_androidInfo?.product}${_androidInfo?.bootloader}${_androidInfo?.display}${_androidInfo?.fingerprint}${_androidInfo?.hardware}${_androidInfo?.host}${_androidInfo?.id}${_androidInfo?.type}");

  static String _generateDeviceNumberIOS() => uuid.v5(Uuid.NAMESPACE_URL,
      "${_iosInfo?.systemName}${_iosInfo?.systemVersion}${_iosInfo?.name}${_iosInfo?.model}");
}
