import 'package:package_info_plus/package_info_plus.dart';

///软件包工具
class PackageUtils {
  PackageUtils._();

  static PackageInfo? _packageInfo;

  static init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  static String? get appName => _packageInfo?.appName;

  static String? get packageName => _packageInfo?.packageName;

  static String? get version => _packageInfo?.version;

  static String? get buildNumber => _packageInfo?.buildNumber;
}
